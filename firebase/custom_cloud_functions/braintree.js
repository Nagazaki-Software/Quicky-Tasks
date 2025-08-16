/* eslint-disable no-console */
const functions = require("firebase-functions");
const corsMw = require("cors");
const braintree = require("braintree");
const querystring = require("querystring");

// ---------- CORS (ajuste o origin p/ endurecer) ----------
const cors = corsMw({ origin: true });

// ---------- helpers de resposta ----------
const ok = (res, data) => res.status(200).json(data);
const fail = (res, code, msg, extra = {}) =>
  res.status(code).json({ error: msg, ...extra });

function setSecurityHeaders(res) {
  res.set("X-Content-Type-Options", "nosniff");
  res.set("Cache-Control", "no-store");
}

function isWebhookRequest(contentType, body) {
  return (
    (contentType || "").includes("application/x-www-form-urlencoded") ||
    (body && (body.bt_signature || body.bt_payload))
  );
}

// Lê form-urlencoded quando necessário (webhook)
function readFormUrlEncoded(req) {
  return new Promise((resolve) => {
    if (req.body && (req.body.bt_signature || req.body.bt_payload)) {
      return resolve({
        bt_signature: req.body.bt_signature,
        bt_payload: req.body.bt_payload,
      });
    }
    let raw = "";
    req.on("data", (c) => (raw += c));
    req.on("end", () => {
      try {
        const parsed = querystring.parse(raw);
        resolve({
          bt_signature: parsed.bt_signature,
          bt_payload: parsed.bt_payload,
        });
      } catch (_) {
        resolve({});
      }
    });
    req.on("error", () => resolve({}));
  });
}

// Normaliza e valida amount (string com 2 casas > 0)
function normalizeAmount(amount) {
  if (typeof amount === "number") amount = amount.toFixed(2);
  if (typeof amount !== "string") amount = String(amount || "");
  amount = amount.trim();
  const num = Number(amount);
  if (!isFinite(num) || num <= 0) return null;
  return num.toFixed(2);
}

// ---------- Config segura (NUNCA hardcode) ----------
function readBraintreeConfig() {
  const cfg = (functions.config() && functions.config().braintree) || {};
  const env = (process.env.BRAINTREE_ENV || cfg.env || "sandbox").toLowerCase();

  const merchantId = process.env.BRAINTREE_MERCHANT_ID || cfg.merchant_id;
  const publicKey = process.env.BRAINTREE_PUBLIC_KEY || cfg.public_key;
  const privateKey = process.env.BRAINTREE_PRIVATE_KEY || cfg.private_key;

  const missing = [];
  if (!merchantId) missing.push("BRAINTREE_MERCHANT_ID / braintree.merchant_id");
  if (!publicKey) missing.push("BRAINTREE_PUBLIC_KEY / braintree.public_key");
  if (!privateKey) missing.push("BRAINTREE_PRIVATE_KEY / braintree.private_key");

  return {
    ok: missing.length === 0,
    env,
    merchantId,
    publicKey,
    privateKey,
    missing,
  };
}

// Lazy-init do gateway para evitar crash no cold start
let gateway = null;
function getGatewayOrError() {
  if (gateway) return { gateway };
  const cfg = readBraintreeConfig();
  if (!cfg.ok) {
    return { error: { code: "missing_braintree_keys", missing: cfg.missing } };
  }
  gateway = new braintree.BraintreeGateway({
    environment:
      cfg.env === "production"
        ? braintree.Environment.Production
        : braintree.Environment.Sandbox,
    merchantId: cfg.merchantId,
    publicKey: cfg.publicKey,
    privateKey: cfg.privateKey,
  });
  return { gateway };
}

// ============ ÚNICO EXPORT ============
exports.braintreePayment = functions.https.onRequest(async (req, res) => {
  setSecurityHeaders(res);

  return cors(req, res, async () => {
    try {
      // Preflight
      if (req.method === "OPTIONS") {
        res.set("Access-Control-Allow-Methods", "GET,POST,OPTIONS");
        res.set("Access-Control-Allow-Headers", "content-type");
        return res.status(204).send("");
      }

      const contentType = (req.headers["content-type"] || "").toLowerCase();

      // 1) GET -> CLIENT TOKEN
      if (req.method === "GET") {
        try {
          const { gateway: gw, error } = getGatewayOrError();
          if (error) return fail(res, 500, error.code, { missing: error.missing });

          const { customerId } = req.query || {};
          const token = await gw.clientToken.generate(customerId ? { customerId } : {});
          return ok(res, { clientToken: token.clientToken });
        } catch (e) {
          functions.logger.error("client-token error", e);
          return fail(res, 500, "client_token_failed", { message: e.message });
        }
      }

      // 2) POST -> WEBHOOK (form) ou CHECKOUT (json)
      if (req.method === "POST") {
        // 2a) WEBHOOK
        if (isWebhookRequest(contentType, req.body)) {
          try {
            const { gateway: gw, error } = getGatewayOrError();
            if (error) {
              // Para webhooks, devolvemos 400 para forçar o retry só quando chaves existirem
              return res.status(400).send(error.code);
            }

            const { bt_signature, bt_payload } = await readFormUrlEncoded(req);
            if (!bt_signature || !bt_payload) {
              return fail(res, 400, "missing_signature");
            }

            const notification = await gw.webhookNotification.parse(
              bt_signature,
              bt_payload
            );

            functions.logger.info("Webhook recebido", {
              kind: notification.kind,
              id: notification?.subject?.id,
            });

            // TODO: trate seus eventos aqui (transaction_settled, disbursement, dispute_*)
            return res.sendStatus(200);
          } catch (e) {
            functions.logger.error("webhook error", e);
            return res.sendStatus(400);
          }
        }

        // 2b) CHECKOUT
        try {
          const { gateway: gw, error } = getGatewayOrError();
          if (error) return fail(res, 500, error.code, { missing: error.missing });

          const {
            amount,
            paymentMethodNonce,
            orderId,
            deviceData,
            merchantAccountId,
            customer, // { firstName, lastName, email, phone, ... } (opcional)
            billingDescription, // customFields precisam existir no painel
          } = req.body || {};

          if (!paymentMethodNonce) {
            return fail(res, 400, "missing_required_fields", {
              required: ["paymentMethodNonce"],
            });
          }

          const normalizedAmount = normalizeAmount(amount);
          if (!normalizedAmount) {
            return fail(res, 400, "invalid_amount", {
              hint: "Use valor > 0 com até 2 casas decimais",
            });
          }

          const saleRequest = {
            amount: normalizedAmount,
            paymentMethodNonce,
            deviceData,
            orderId, // use um ID único do seu lado (ajuda em idempotência)
            options: { submitForSettlement: true },
          };

          if (merchantAccountId) saleRequest.merchantAccountId = merchantAccountId;
          if (customer && typeof customer === "object") saleRequest.customer = customer;
          if (billingDescription)
            saleRequest.customFields = { description: billingDescription };

          const result = await gw.transaction.sale(saleRequest);

          if (result.success) {
            return ok(res, { success: true, transaction: result.transaction });
          }

          const deep =
            typeof result.errors?.deepErrors === "function"
              ? result.errors.deepErrors()
              : result.errors?.deepErrors || [];

          const fieldErrors = Array.isArray(deep)
            ? deep.map((e) => ({
                code: e.code,
                message: e.message,
                attribute: e.attribute,
              }))
            : [];

          return fail(res, 400, "sale_failed", {
            message: result.message,
            fieldErrors,
            transaction: result.transaction || null,
          });
        } catch (e) {
          functions.logger.error("checkout error", e);
          return fail(res, 500, "internal_error", { message: e.message });
        }
      }

      // Método não suportado
      return fail(res, 405, "method_not_allowed");
    } catch (e) {
      functions.logger.error("fatal error", e);
      return fail(res, 500, "fatal_error", { message: e.message });
    }
  });
});
