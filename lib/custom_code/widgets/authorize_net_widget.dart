// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:authorize_net_sdk_plugin/authorize_net_sdk_plugin.dart';

class AuthorizeNetWidget extends StatefulWidget {
  final bool useSandbox; // você pode manter, mas não será usado no plugin
  final String cardNumber;
  final String expirationMonth;
  final String expirationYear;
  final String cardCvv;
  final String zipCode; // não usado no generateNonce
  final String cardHolderName; // não usado no generateNonce
  final String apiLoginId;
  final String clientKey;
  final double? width;
  final double? height;

  const AuthorizeNetWidget({
    super.key,
    required this.useSandbox,
    required this.cardNumber,
    required this.expirationMonth,
    required this.expirationYear,
    required this.cardCvv,
    required this.zipCode,
    required this.cardHolderName,
    required this.apiLoginId,
    required this.clientKey,
    this.width,
    this.height,
  });

  @override
  State<AuthorizeNetWidget> createState() => _AuthorizeNetWidgetState();
}

class _AuthorizeNetWidgetState extends State<AuthorizeNetWidget> {
  final authorizeNet = AuthorizeNetSdkPlugin();

  String? token;
  String? error;

  @override
  void initState() {
    super.initState();
    _getToken();
  }

  Future<void> _getToken() async {
    try {
      final result = await authorizeNet.generateNonce(
        apiLoginId: widget.apiLoginId,
        clientKey: widget.clientKey,
        cardNumber: widget.cardNumber,
        expirationMonth: widget.expirationMonth,
        expirationYear: widget.expirationYear,
        cardCode: widget.cardCvv,
      );
      setState(() {
        token = result;
      });
    } catch (e) {
      setState(() {
        error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (error != null) {
      return Text('Erro: $error', style: const TextStyle(color: Colors.red));
    }
    if (token == null) {
      return const CircularProgressIndicator();
    }
    return Container(
      width: widget.width,
      height: widget.height,
      alignment: Alignment.center,
      child: Text('Token: $token'),
    );
  }
}
