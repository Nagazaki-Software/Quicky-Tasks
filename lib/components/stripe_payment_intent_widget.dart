import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'stripe_payment_intent_model.dart';
export 'stripe_payment_intent_model.dart';

class StripePaymentIntentWidget extends StatefulWidget {
  const StripePaymentIntentWidget({
    super.key,
    required this.value,
  });

  final double? value;

  @override
  State<StripePaymentIntentWidget> createState() =>
      _StripePaymentIntentWidgetState();
}

class _StripePaymentIntentWidgetState extends State<StripePaymentIntentWidget> {
  late StripePaymentIntentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StripePaymentIntentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
