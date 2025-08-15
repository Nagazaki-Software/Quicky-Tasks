import '/flutter_flow/flutter_flow_util.dart';
import 'fazendo_task_widget.dart' show FazendoTaskWidget;
import 'package:flutter/material.dart';

class FazendoTaskModel extends FlutterFlowModel<FazendoTaskWidget> {
  ///  Local state fields for this page.

  List<String> fotos = [];
  void addToFotos(String item) => fotos.add(item);
  void removeFromFotos(String item) => fotos.remove(item);
  void removeAtIndexFromFotos(int index) => fotos.removeAt(index);
  void insertAtIndexInFotos(int index, String item) =>
      fotos.insert(index, item);
  void updateFotosAtIndex(int index, Function(String) updateFn) =>
      fotos[index] = updateFn(fotos[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData93q = false;
  FFUploadedFile uploadedLocalFile_uploadData93q =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData93q = '';

  bool isDataUploading_uploadData93qewr = false;
  FFUploadedFile uploadedLocalFile_uploadData93qewr =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData93qewr = '';

  bool isDataUploading_uploadData9gf3q = false;
  FFUploadedFile uploadedLocalFile_uploadData9gf3q =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData9gf3q = '';

  bool isDataUploading_uploadData9fdgd = false;
  FFUploadedFile uploadedLocalFile_uploadData9fdgd =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadData9fdgd = '';

  bool isDataUploading_uploadDataEr46 = false;
  FFUploadedFile uploadedLocalFile_uploadDataEr46 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl_uploadDataEr46 = '';

  // State field(s) for Checkbox widget.
  Map<String, bool> checkboxValueMap = {};
  List<String> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
