import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import 'youraccontfoiverificadocomsucesso_widget.dart'
    show YouraccontfoiverificadocomsucessoWidget;
import 'package:flutter/material.dart';

class YouraccontfoiverificadocomsucessoModel
    extends FlutterFlowModel<YouraccontfoiverificadocomsucessoWidget> {
  ///  State fields for stateful widgets in this component.

  InstantTimer? instantTimer;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    instantTimer?.cancel();
  }
}
