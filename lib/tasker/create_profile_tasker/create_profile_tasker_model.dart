import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/index.dart';
import 'create_profile_tasker_widget.dart' show CreateProfileTaskerWidget;
import 'package:flutter/material.dart';

class CreateProfileTaskerModel
    extends FlutterFlowModel<CreateProfileTaskerWidget> {
  ///  Local state fields for this page.

  bool clicou = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - API (createaccountstripe all)] action in Icon widget.
  ApiCallResponse? accountStriper;
  bool isDataUploading_uploadDataSfu = false;
  FFUploadedFile uploadedLocalFile_uploadDataSfu =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataSfu = '';

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Backend Call - API (createaccountstripe all)] action in IconButton widget.
  ApiCallResponse? accountStripe;
  // Stores action output result for [Backend Call - API (createaccountstripe all)] action in IconButton widget.
  ApiCallResponse? accountStripee;

  @override
  void initState(BuildContext context) {
    passwordVisibility = false;
  }

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    emailTextController?.dispose();

    textFieldFocusNode4?.dispose();
    passwordTextController?.dispose();
  }
}
