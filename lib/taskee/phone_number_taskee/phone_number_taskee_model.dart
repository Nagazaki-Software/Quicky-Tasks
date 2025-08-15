import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'phone_number_taskee_widget.dart' show PhoneNumberTaskeeWidget;
import 'package:flutter/material.dart';

class PhoneNumberTaskeeModel extends FlutterFlowModel<PhoneNumberTaskeeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
