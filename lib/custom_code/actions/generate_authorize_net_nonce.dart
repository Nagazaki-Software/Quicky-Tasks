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

import 'dart:convert';
import 'package:braintree_flutter_plus/braintree_flutter_plus.dart';
import 'package:http/http.dart' as http;

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

    final nonce = result?.nonce;
    if (nonce == null || nonce.isEmpty) {
      throw Exception('Erro ao tokenizar o cartão.');
    }

    if (backendUrl.isNotEmpty) {
      await http.post(
        Uri.parse(backendUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'payment_method_nonce': nonce,
          'amount': amount,
          'display_name': displayName,
          'billing_description': billingDescription,
        }),
      );
    }

    return nonce;
  } catch (e) {
    debugPrint('Erro ao gerar nonce: $e');
    rethrow;
  }
}

bool isValidCardNumber(String cardNumber) {
  final sanitized = cardNumber.replaceAll(RegExp(r'\s+'), '');
  if (sanitized.isEmpty) return false;
  int sum = 0;
  bool alternate = false;
  for (int i = sanitized.length - 1; i >= 0; i--) {
    int digit = int.parse(sanitized[i]);
    if (alternate) {
      digit *= 2;
      if (digit > 9) digit -= 9;
    }
    sum += digit;
    alternate = !alternate;
  }
  return sum % 10 == 0;
}
