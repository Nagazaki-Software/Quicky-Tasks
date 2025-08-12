import '/components/events_componente_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'feedback_events_taskee_widget.dart' show FeedbackEventsTaskeeWidget;
import 'package:flutter/material.dart';

class FeedbackEventsTaskeeModel
    extends FlutterFlowModel<FeedbackEventsTaskeeWidget> {
  ///  Local state fields for this page.

  int? feedback1;

  int? feedback2;

  int? feedback3;

  int? feedback4;

  int? feedback5;

  int? indexs = 0;

  bool aboutTaskeeandTasker = false;

  ///  State fields for stateful widgets in this page.

  // Model for eventsComponente component.
  late EventsComponenteModel eventsComponenteModel;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    eventsComponenteModel = createModel(context, () => EventsComponenteModel());
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    eventsComponenteModel.dispose();
    navBarModel.dispose();
  }
}
