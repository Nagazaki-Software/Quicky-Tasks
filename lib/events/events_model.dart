import '/components/events_componente_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'events_widget.dart' show EventsWidget;
import 'package:flutter/material.dart';

class EventsModel extends FlutterFlowModel<EventsWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for eventsComponente component.
  late EventsComponenteModel eventsComponenteModel;

  @override
  void initState(BuildContext context) {
    eventsComponenteModel = createModel(context, () => EventsComponenteModel());
  }

  @override
  void dispose() {
    eventsComponenteModel.dispose();
  }
}
