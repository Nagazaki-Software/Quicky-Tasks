import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_widget.dart' show ChatWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ChatModel extends FlutterFlowModel<ChatWidget> {
  ///  Local state fields for this page.

  bool recorder = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData4jcc2 = false;
  FFUploadedFile uploadedLocalFile_uploadData4jcc2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData4jcc2 = '';

  String? audio;
  FFUploadedFile recordedFileBytes =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  AudioRecorder? audioRecorder;

  @override
  void initState(BuildContext context) {
    listViewController = ScrollController();
  }

  @override
  void dispose() {
    listViewController?.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
