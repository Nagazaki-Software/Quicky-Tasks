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

    if (result == null || result.nonce == null || result.nonce!.isEmpty) {
      throw Exception('Falha ao gerar nonce do cartão');
    }

    final nonce = result.nonce!;
    final body = jsonEncode({
      'nonce': nonce,
      'amount': amount.toString(),
      'displayName': displayName,
      'billingDescription': billingDescription,
    });

    final response = await http.post(
      Uri.parse(backendUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['message'] ?? 'Pagamento realizado com sucesso!';
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(
          'Erro no pagamento: ${errorData['error'] ?? response.body}');
    }
  } catch (e) {
    throw Exception('Erro ao processar pagamento: $e');
  }
}

bool isValidCardNumber(String cardNumber) {
  // Implementação simples do algoritmo de Luhn
  int sum = 0;
  bool shouldDouble = false;
  for (int i = cardNumber.length - 1; i >= 0; i--) {
    int digit = int.parse(cardNumber[i]);
    if (shouldDouble) {
      digit *= 2;
      if (digit > 9) digit -= 9;
    }
    sum += digit;
    shouldDouble = !shouldDouble;
  }
  return sum % 10 == 0;
}
