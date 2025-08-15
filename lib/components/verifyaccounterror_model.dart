import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'verifyaccounterror_widget.dart' show VerifyaccounterrorWidget;
import 'package:flutter/material.dart';

class VerifyaccounterrorModel
    extends FlutterFlowModel<VerifyaccounterrorWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
