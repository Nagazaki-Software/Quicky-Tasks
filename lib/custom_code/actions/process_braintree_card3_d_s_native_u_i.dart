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

// Braintree Native UI
import 'package:braintree_native_ui/braintree_native_ui.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/// Fluxo: GET token -> tokenizeCard -> 3DS -> deviceData -> POST sale
/// Observação: o plugin braintree_native_ui não recebe billingAddress em tokenizeCard/performThreeDSecure.
/// Envie billing no POST para o seu backend (já suportado).
Future<String> processBraintreeCard3DSNativeUI(
  String
      backendUrl, // ex.: https://us-central1/<proj>.cloudfunctions.net/braintree
  double amount,
  String email,
  // Cartão
  String cardNumber,
  String expirationMonth, // "MM"
  String expirationYear, // "YYYY" ou "YY"
  String cardCvv,
  // Billing (usado no POST ao backend)
  String givenName,
  String surname,
  String phoneNumber,
  String streetAddress,
  String extendedAddress,
  String locality,
  String region,
  String postalCode,
  String countryCodeAlpha2, // "BR" etc
  // Opcionais
  String merchantAccountId, // "" se não usar sub-merchant
  String orderPrefix, // ex.: "ORDER-"
) async {
  try {
    // ---------- Sanitização ----------
    final digitsOnly = _onlyDigits(cardNumber);
    if (!_isValidCardNumber(digitsOnly)) {
      throw Exception('Número de cartão inválido.');
    }
    final mm = expirationMonth.padLeft(2, '0');
    final yyyy =
        expirationYear.length == 2 ? '20$expirationYear' : expirationYear;
    final normalizedAmount = _normalizeAmount(amount);
    if (normalizedAmount == null) {
      throw Exception('Valor inválido (use > 0 com até 2 casas decimais).');
    }

    // ---------- 1) GET client token ----------
    final getResp = await http.get(Uri.parse(backendUrl));
    if (getResp.statusCode != 200) {
      throw Exception('Falha ao obter client token (${getResp.statusCode}).');
    }
    final getJson = _safeJson(getResp.body);
    final authorization = (getJson['clientToken'] as String?)?.trim();
    if (authorization == null || authorization.isEmpty) {
      throw Exception('clientToken ausente na resposta do servidor.');
    }

    final braintree = BraintreeNativeUi();

    // ---------- 2) Tokenizar cartão ----------
    // Removido: billingAddress (não existe nesse plugin)
    final nonce = await braintree.tokenizeCard(
      authorization: authorization,
      number: digitsOnly,
      expirationMonth: mm,
      expirationYear: yyyy,
      cvv: cardCvv.trim(),
    );
    if (nonce == null || nonce.isEmpty) {
      throw Exception('Falha ao tokenizar o cartão.');
    }

    // ---------- 3) 3-D Secure 2 ----------
    // Removido: billingAddress (não existe nesse plugin)
    final verifiedNonce = await braintree.performThreeDSecure(
      authorization: authorization,
      nonce: nonce,
      amount: normalizedAmount,
      email: email,
    );
    if (verifiedNonce == null || verifiedNonce.isEmpty) {
      throw Exception('3-D Secure não retornou um nonce válido.');
    }

    // ---------- 4) Device Data ----------
    String deviceData = '';
    try {
      final dd = await braintree.collectDeviceData(
        authorization: authorization,
        forCard: true,
      );
      if (dd != null && dd.isNotEmpty) deviceData = dd;
    } catch (_) {
      // Segue sem deviceData se plataforma não suportar
    }

    // ---------- 5) POST sale ----------
    final orderId =
        '${(orderPrefix.isEmpty ? "ORDER-" : orderPrefix)}${DateTime.now().millisecondsSinceEpoch}';

    // Mande o billing pro servidor (ele repassa para a transação)
    final saleBody = {
      'amount': normalizedAmount,
      'paymentMethodNonce': verifiedNonce,
      'deviceData': deviceData,
      'orderId': orderId,
      if (merchantAccountId.trim().isNotEmpty)
        'merchantAccountId': merchantAccountId.trim(),
      'customer': {
        if (givenName.trim().isNotEmpty) 'firstName': givenName.trim(),
        if (surname.trim().isNotEmpty) 'lastName': surname.trim(),
        if (email.trim().isNotEmpty) 'email': email.trim(),
        if (phoneNumber.trim().isNotEmpty) 'phone': phoneNumber.trim(),
      },
      'billing': {
        if (streetAddress.trim().isNotEmpty)
          'streetAddress': streetAddress.trim(),
        if (extendedAddress.trim().isNotEmpty)
          'extendedAddress': extendedAddress.trim(),
        if (locality.trim().isNotEmpty) 'locality': locality.trim(),
        if (region.trim().isNotEmpty) 'region': region.trim(),
        if (postalCode.trim().isNotEmpty) 'postalCode': postalCode.trim(),
        if (countryCodeAlpha2.trim().isNotEmpty)
          'countryCodeAlpha2': countryCodeAlpha2.trim(),
      },
    };

    final postResp = await http.post(
      Uri.parse(backendUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(saleBody),
    );

    if (postResp.statusCode == 200) {
      final data = _safeJson(postResp.body);
      final txn = data['transaction'] as Map<String, dynamic>?;
      final id = txn?['id']?.toString();
      final status = txn?['status']?.toString();
      if (id != null) {
        return 'Pagamento aprovado! Transaction ID: $id — status: $status';
      }
      return data['message']?.toString() ?? 'Pagamento realizado com sucesso!';
    } else {
      final err = _safeJson(postResp.body);
      final msg = (err['message'] ?? err['error'] ?? postResp.body).toString();
      throw Exception('Erro no pagamento: $msg');
    }
  } catch (e) {
    throw Exception('Erro ao processar pagamento: $e');
  }
}

// -------------------- Helpers --------------------
String? _normalizeAmount(double amount) {
  if (amount.isNaN || amount.isInfinite || amount <= 0) return null;
  return amount.toStringAsFixed(2);
}

String _onlyDigits(String s) => s.replaceAll(RegExp(r'[^0-9]'), '');

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

Map<String, dynamic> _safeJson(String body) {
  try {
    return jsonDecode(body) as Map<String, dynamic>;
  } catch (_) {
    return {};
  }
}
