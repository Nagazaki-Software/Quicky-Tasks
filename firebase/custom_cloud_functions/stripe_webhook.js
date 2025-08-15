exports.stripeWebhook = functions.https.onRequest((req, res) => {
  const stripe = require("stripe")("sk_test_...");
  const endpointSecret = "whsec_...";

  const sig = req.headers["stripe-signature"];
  let event;

  try {
    event = stripe.webhooks.constructEvent(req.rawBody, sig, endpointSecret);
  } catch (err) {
    console.error("Webhook Error:", err.message);
    return res.status(400).send(`Webhook Error: ${err.message}`);
  }

  if (event.type === "identity.verification_session.verified") {
    const session = event.data.object;
    const userId = session.metadata.userId;

    // Atualize o status do usuário no Firebase
    admin.firestore().collection("users").doc(userId).update({
      identityVerified: true,
    });
  }

  res.json({ received: true });
});
