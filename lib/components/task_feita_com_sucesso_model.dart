import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'task_feita_com_sucesso_widget.dart' show TaskFeitaComSucessoWidget;
import 'package:flutter/material.dart';

class TaskFeitaComSucessoModel
    extends FlutterFlowModel<TaskFeitaComSucessoWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
