import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'password_tasker_widget.dart' show PasswordTaskerWidget;
import 'package:flutter/material.dart';

class PasswordTaskerModel extends FlutterFlowModel<PasswordTaskerWidget> {
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
