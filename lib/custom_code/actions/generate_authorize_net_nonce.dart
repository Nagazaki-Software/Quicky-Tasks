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

/// Gera o nonce do cartão no cliente e conclui o pagamento no seu backend
/// (um único endpoint para GET=token e POST=checkout).
///
/// tokenizationKey: opcional (fallback se falhar pegar clientToken)
/// backendUrl: URL ÚNICA da sua Cloud Function (mesmo endpoint p/ GET e POST)
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
    // --- Sanitização & validação ---
    final digitsOnly = _onlyDigits(cardNumber);
    if (!_isValidCardNumber(digitsOnly)) {
      throw Exception('Número de cartão inválido.');
    }
    final mm = expirationMonth.padLeft(2, '0');
    final yyyy =
        expirationYear.length == 2 ? '20$expirationYear' : expirationYear;

    // Normaliza amount p/ duas casas
    final normalizedAmount = _normalizeAmount(amount);
    if (normalizedAmount == null) {
      throw Exception('Valor inválido (use > 0 com até 2 casas decimais).');
    }

    // --- 1) Pega client token do backend (GET no MESMO endpoint) ---
    String authorization = await _fetchClientToken(backendUrl);
    if (authorization.isEmpty) {
      // fallback: tokenizationKey (menos poderoso que clientToken)
      authorization = tokenizationKey.trim();
    }
    if (authorization.isEmpty) {
      throw Exception(
          'Falha ao obter autorização do Braintree (clientToken/tokenizationKey).');
    }

    // --- 2) Tokeniza o cartão (gera NONCE) ---
    final creditCardRequest = BraintreeCreditCardRequest(
      cardNumber: digitsOnly,
      expirationMonth: mm,
      expirationYear: yyyy,
      cvv: cardCvv.trim(),
      // 👇 O plugin PLUS pede amount aqui (usado p/ 3DS)
      amount: normalizedAmount, // String com 2 casas decimais
      // Se o seu pacote reclamar de tipo, troque para:
      // amount: double.parse(normalizedAmount),
      // (algumas forks tipam como double)
    );

    final tokenized = await Braintree.tokenizeCreditCard(
      authorization,
      creditCardRequest,
    );

    final nonce = (tokenized?.nonce ?? '').trim();
    if (nonce.isEmpty) {
      throw Exception('Falha ao gerar nonce do cartão.');
    }

    // --- 3) Cria transação no backend (POST no MESMO endpoint) ---
    final body = jsonEncode({
      'paymentMethodNonce': nonce,
      'amount': normalizedAmount,
      'orderId': 'ORDER-${DateTime.now().millisecondsSinceEpoch}',
      'customer': {
        'firstName': displayName,
      },
      'billingDescription': billingDescription,
      // 'deviceData': tokenized?.deviceData, // use se coletar device data
    });

    final resp = await http.post(
      Uri.parse(backendUrl),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (resp.statusCode == 200) {
      final data = jsonDecode(resp.body) as Map<String, dynamic>;
      final txn = data['transaction'] as Map<String, dynamic>?;
      final id = txn?['id']?.toString();
      return id != null
          ? 'Pagamento aprovado! Transaction ID: $id'
          : (data['message']?.toString() ?? 'Pagamento realizado com sucesso!');
    } else {
      Map<String, dynamic>? errData;
      try {
        errData = jsonDecode(resp.body) as Map<String, dynamic>;
      } catch (_) {}
      final msg = errData?['message'] ?? errData?['error'] ?? resp.body;
      throw Exception('Erro no pagamento: $msg');
    }
  } catch (e) {
    throw Exception('Erro ao processar pagamento: $e');
  }
}

// -------------------- Helpers --------------------

Future<String> _fetchClientToken(String backendUrl) async {
  try {
    final r = await http.get(Uri.parse(backendUrl));
    if (r.statusCode == 200) {
      final data = jsonDecode(r.body) as Map<String, dynamic>;
      final token = (data['clientToken'] ?? '').toString().trim();
      return token;
    }
  } catch (_) {}
  return '';
}

/// Retorna string com 2 casas decimais se válido, ou null se inválido/<=0
String? _normalizeAmount(double amount) {
  if (amount.isNaN || amount.isInfinite || amount <= 0) return null;
  return amount.toStringAsFixed(2);
}

String _onlyDigits(String s) => s.replaceAll(RegExp(r'[^0-9]'), '');

/// Luhn
bool _isValidCardNumber(String digits) {
  int sum = 0;
  bool dbl = false;
  for (int i = digits.length - 1; i >= 0; i--) {
    final code = digits.codeUnitAt(i) - 48;
    if (code < 0 || code > 9) return false;
    int d = code;
    if (dbl) {
      d *= 2;
      if (d > 9) d -= 9;
    }
    sum += d;
    dbl = !dbl;
  }
  return sum > 0 && sum % 10 == 0;
}
