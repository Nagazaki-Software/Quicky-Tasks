import '/backend/backend.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'current_tasks_widget.dart' show CurrentTasksWidget;
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';

class CurrentTasksModel extends FlutterFlowModel<CurrentTasksWidget> {
  ///  Local state fields for this page.

  DateTime? hora;

  ///  State fields for stateful widgets in this page.

  TutorialCoachMark? currentTaskHelpController;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // Stores action output result for [Backend Call - Read Document] action in Container widget.
  TasksPreProntasRecord? pretasksrpotnas;
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TasksRecord? newTaskref;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    currentTaskHelpController?.finish();
    navBarCopyModel.dispose();
    navBarModel.dispose();
  }
}
