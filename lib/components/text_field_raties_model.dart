import '/flutter_flow/flutter_flow_util.dart';
import 'text_field_raties_widget.dart' show TextFieldRatiesWidget;
import 'package:flutter/material.dart';

class TextFieldRatiesModel extends FlutterFlowModel<TextFieldRatiesWidget> {
  ///  State fields for stateful widgets in this component.

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
