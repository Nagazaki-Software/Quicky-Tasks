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

import 'package:authorize_net_sdk_plugin/authorize_net_sdk_plugin.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<String> generateAuthorizeNetNonce(
  String apiLoginId,
  String clientKey,
  String cardNumber,
  String expirationMonth,
  String expirationYear,
  String cardCvv,
  double amount,
  String cardHolderName,
  String
      backendUrl, // Ex: https://us-central1-seuprojeto.cloudfunctions.net/processPayment
) async {
  final authorizeNet = AuthorizeNetSdkPlugin();

  try {
    // Gera o nonce/token do cartão via plugin nativo
    final nonce = await authorizeNet.generateNonce(
      apiLoginId: apiLoginId,
      clientKey: clientKey,
      cardNumber: cardNumber,
      expirationMonth: expirationMonth,
      expirationYear: expirationYear,
      cardCode: cardCvv,
    );

    if (nonce == null) {
      throw Exception('Nonce retornou nulo');
    }

    // Monta o corpo JSON para enviar ao backend
    final body = jsonEncode({
      'nonce': nonce,
      'amount': amount,
      'cardHolderName': cardHolderName,
    });

    // Chama seu backend para processar o pagamento
    final response = await http.post(
      Uri.parse(backendUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      // Retorna a mensagem do backend (ex: transactionId, status, etc)
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
