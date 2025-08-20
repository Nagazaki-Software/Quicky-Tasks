import '/flutter_flow/flutter_flow_credit_card_form.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'cardplacehokder_widget.dart' show CardplacehokderWidget;
import 'package:flutter/material.dart';

class CardplacehokderModel extends FlutterFlowModel<CardplacehokderWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for CreditCardForm widget.
  final creditCardFormKey = GlobalKey<FormState>();
  CreditCardModel creditCardInfo = emptyCreditCard();
  // Stores action output result for [Braintree Payment] action in Button widget.
  String? transactionId;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
