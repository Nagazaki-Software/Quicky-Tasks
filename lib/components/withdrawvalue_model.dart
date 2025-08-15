import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'withdrawvalue_widget.dart' show WithdrawvalueWidget;
import 'package:flutter/material.dart';

class WithdrawvalueModel extends FlutterFlowModel<WithdrawvalueWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Backend Call - API (retirar saldo stripe connected)] action in Button widget.
  ApiCallResponse? apiResult4pg;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
