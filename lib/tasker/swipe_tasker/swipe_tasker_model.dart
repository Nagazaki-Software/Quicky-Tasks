import '/backend/backend.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'swipe_tasker_widget.dart' show SwipeTaskerWidget;
import 'package:flutter/material.dart';

class SwipeTaskerModel extends FlutterFlowModel<SwipeTaskerWidget> {
  ///  Local state fields for this page.

  String openPage = 'All';

  DocumentReference? swipeTask;

  String estadoDoIcon = 'All';

  String estadoDoIcon2 = 'All';

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Backend Call - Read Document] action in FlutterTaskSwiper widget.
  TasksRecord? taskref;
  // Stores action output result for [Backend Call - Create Document] action in FlutterTaskSwiper widget.
  ChatRecord? chat;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // Model for navBar component.
  late NavBarModel navBarModel1;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Model for navBar component.
  late NavBarModel navBarModel2;

  @override
  void initState(BuildContext context) {
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
    navBarModel1 = createModel(context, () => NavBarModel());
    navBarModel2 = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarCopyModel.dispose();
    navBarModel1.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    navBarModel2.dispose();
  }
}
