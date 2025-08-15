import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'chat_tasker_widget.dart' show ChatTaskerWidget;
import 'package:flutter/material.dart';
import 'package:record/record.dart';

class ChatTaskerModel extends FlutterFlowModel<ChatTaskerWidget> {
  ///  Local state fields for this page.

  bool recorder = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.
  ScrollController? listViewController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  bool isDataUploading_uploadData4jcc = false;
  FFUploadedFile uploadedLocalFile_uploadData4jcc =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData4jcc = '';

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
