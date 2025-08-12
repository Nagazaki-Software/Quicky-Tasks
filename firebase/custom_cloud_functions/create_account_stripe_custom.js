const functions = require("firebase-functions");
const cors = require("cors")({ origin: true });
const stripe = require("stripe")("");

exports.createAccountStripeCustom = functions
  .region("us-central1")
  .runWith({
    timeoutSeconds: 30,
    memory: "512MB",
  })
  .https.onRequest((req, res) => {
    cors(req, res, async () => {
      if (req.method !== "POST") {
        return res
          .status(405)
          .json({ error: "Método não permitido. Use POST." });
      }

      try {
        const data = req.body;

        // Validação de dados obrigatórios para os EUA
        if (
          !data.email ||
          !data.firstName ||
          !data.lastName ||
          !data.ssnLast4
        ) {
          return res
            .status(400)
            .json({ error: "Dados obrigatórios ausentes." });
        }

        const account = await stripe.accounts.create({
          type: "custom",
          country: "US",
          email: data.email,
          business_type: "individual",
          capabilities: {
            card_payments: { requested: true },
            transfers: { requested: true },
          },
          business_profile: {
            product_description: data.productDescription || "Services",
            mcc: "7399",
            url: "https://yourwebsite.com",
          },
          tos_acceptance: {
            date: Math.floor(Date.now() / 1000),
            ip: data.ip || "0.0.0.0",
          },
          individual: {
            first_name: data.firstName,
            last_name: data.lastName,
            dob: {
              day: data.dobDay,
              month: data.dobMonth,
              year: data.dobYear,
            },
            address: {
              line1: data.addressLine1,
              city: data.addressCity,
              state: data.addressState,
              postal_code: data.addressPostalCode,
            },
            phone: data.phone,
            ssn_last_4: data.ssnLast4,
          },
        });

        const accountLink = await stripe.accountLinks.create({
          account: account.id,
          refresh_url: "https://yourwebsite.com/error",
          return_url: "https://yourwebsite.com/success",
          type: "account_onboarding",
        });

        res.status(200).json({
          success: true,
          accountId: account.id,
          onboardingUrl: accountLink.url,
        });
      } catch (err) {
        console.error("[Stripe Error]", err.message);
        return res.status(500).json({
          error: "Erro ao criar conta Stripe.",
          details: err.message,
        });
      }
    });
  });
