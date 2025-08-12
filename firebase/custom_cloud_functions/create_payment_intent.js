const functions = require("firebase-functions");
const admin = require("firebase-admin");
const stripe = require("stripe")("");

admin.initializeApp();

exports.createPaymentIntent = functions.https.onCall(async (data, context) => {
  const amount = data.amount;

  const paymentIntent = await stripe.paymentIntents.create({
    amount: amount * 100, // em centavos
    currency: "brl",
  });

  return {
    clientSecret: paymentIntent.client_secret,
  };
});
