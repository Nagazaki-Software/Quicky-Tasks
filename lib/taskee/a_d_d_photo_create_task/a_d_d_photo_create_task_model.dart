import '/backend/backend.dart';
import '/components/navbar_create_tasks_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'a_d_d_photo_create_task_widget.dart' show ADDPhotoCreateTaskWidget;
import 'package:flutter/material.dart';

class ADDPhotoCreateTaskModel
    extends FlutterFlowModel<ADDPhotoCreateTaskWidget> {
  ///  Local state fields for this page.

  bool addphoto = false;

  ///  State fields for stateful widgets in this page.

  // Model for navbarCreateTasks component.
  late NavbarCreateTasksModel navbarCreateTasksModel;
  bool isDataUploading_uploadData52v = false;
  FFUploadedFile uploadedLocalFile_uploadData52v =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData52v = '';

  bool isDataUploading_uploadData528v = false;
  FFUploadedFile uploadedLocalFile_uploadData528v =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData528v = '';

  bool isDataUploading_uploadData5v = false;
  FFUploadedFile uploadedLocalFile_uploadData5v =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData5v = '';

  bool isDataUploading_uploadData572v = false;
  FFUploadedFile uploadedLocalFile_uploadData572v =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData572v = '';

  // Stores action output result for [Backend Call - Read Document] action in Icon widget.
  TasksPreProntasRecord? pretasks;

  @override
  void initState(BuildContext context) {
    navbarCreateTasksModel =
        createModel(context, () => NavbarCreateTasksModel());
  }

  @override
  void dispose() {
    navbarCreateTasksModel.dispose();
  }
}
