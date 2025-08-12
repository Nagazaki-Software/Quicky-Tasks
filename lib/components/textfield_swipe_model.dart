import '/flutter_flow/flutter_flow_util.dart';
import 'textfield_swipe_widget.dart' show TextfieldSwipeWidget;
import 'package:flutter/material.dart';

class TextfieldSwipeModel extends FlutterFlowModel<TextfieldSwipeWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<String> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
