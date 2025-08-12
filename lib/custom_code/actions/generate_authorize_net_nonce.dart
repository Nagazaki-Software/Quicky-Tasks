// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:braintree_flutter_plus/braintree_flutter_plus.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateAuthorizeNetNonce(
  String tokenizationKey,
  String cardNumber,
  String expirationMonth,
  String expirationYear,
  String cardCvv,
  double amount,
  String backendUrl,
  String displayName,
  String billingDescription,
) async {
  try {
    // Validação do número do cartão (algoritmo de Luhn, por exemplo)
    if (!isValidCardNumber(cardNumber)) {
      throw Exception('Número de cartão inválido.');
    }

    final creditCardRequest = BraintreeCreditCardRequest(
      cardNumber: cardNumber,
      expirationMonth: expirationMonth,
      expirationYear: expirationYear,
      cvv: cardCvv,
      amount: amount.toString(),
    );

    final result = await Braintree.tokenizeCreditCard(
      tokenizationKey,
      creditCardRequest,
    );
