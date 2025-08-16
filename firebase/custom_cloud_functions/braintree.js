const functions = require("firebase-functions");
const braintree = require("braintree");
const cors = require("cors")({ origin: true });

const gateway = new braintree.BraintreeGateway({
  environment: braintree.Environment.Sandbox,
  merchantId: "brg8dhjg5tqpw496",
  publicKey: "syt9g3c79t58wk82",
  privateKey: "0f7de713fa2bbb810f183f628f51d86d",
});

exports.braintree = functions.https.onRequest((req, res) => {
  cors(req, res, async () => {
    try {
      if (req.method === "GET") {
        const result = await gateway.clientToken.generate({});
        res.status(200).json({ clientToken: result.clientToken });
      } else if (req.method === "POST") {
        const saleRequest = {
          amount: req.body.amount,
          paymentMethodNonce: req.body.paymentMethodNonce,
          orderId: req.body.orderId,
          deviceData: req.body.deviceData,
          options: { submitForSettlement: true },
          ...(req.body.merchantAccountId && { merchantAccountId: req.body.merchantAccountId }),
          customer: req.body.customer,
          billing: req.body.billing,
        };
        const result = await gateway.transaction.sale(saleRequest);
        if (result.success) {
          res.status(200).json({ transaction: result.transaction });
        } else {
          res.status(500).json({ error: result.message });
        }
      } else {
        res.status(405).send("Method Not Allowed");
      }
    } catch (e) {
      res.status(500).json({ error: e.toString() });
    }
  });
});
