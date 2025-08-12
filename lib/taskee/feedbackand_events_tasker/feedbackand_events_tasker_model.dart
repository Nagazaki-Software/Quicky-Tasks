import '/backend/backend.dart';
import '/components/events_componente_widget.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'feedbackand_events_tasker_widget.dart'
    show FeedbackandEventsTaskerWidget;
import 'package:flutter/material.dart';

class FeedbackandEventsTaskerModel
    extends FlutterFlowModel<FeedbackandEventsTaskerWidget> {
  ///  Local state fields for this page.

  int? feedback1;

  int? feedback2;

  int? feedback3;

  int? feedback4;

  int? feedback5;

  int? indexs = 0;

  bool aboutTaskandTaskee = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<TasksRecord>? queryTasksForIndexs;
  // Model for eventsComponente component.
  late EventsComponenteModel eventsComponenteModel;
  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;

  @override
  void initState(BuildContext context) {
    eventsComponenteModel = createModel(context, () => EventsComponenteModel());
    navBarModel = createModel(context, () => NavBarModel());
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    eventsComponenteModel.dispose();
    navBarModel.dispose();
    navBarCopyModel.dispose();
  }
}
