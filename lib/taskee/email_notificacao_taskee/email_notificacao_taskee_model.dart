import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'email_notificacao_taskee_widget.dart' show EmailNotificacaoTaskeeWidget;
import 'package:flutter/material.dart';

class EmailNotificacaoTaskeeModel
    extends FlutterFlowModel<EmailNotificacaoTaskeeWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
