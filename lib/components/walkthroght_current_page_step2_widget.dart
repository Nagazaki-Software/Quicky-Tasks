import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'walkthroght_current_page_step2_model.dart';
export 'walkthroght_current_page_step2_model.dart';

class WalkthroghtCurrentPageStep2Widget extends StatefulWidget {
  const WalkthroghtCurrentPageStep2Widget({super.key});

  @override
  State<WalkthroghtCurrentPageStep2Widget> createState() =>
      _WalkthroghtCurrentPageStep2WidgetState();
}

class _WalkthroghtCurrentPageStep2WidgetState
    extends State<WalkthroghtCurrentPageStep2Widget> {
  late WalkthroghtCurrentPageStep2Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroghtCurrentPageStep2Model());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      'Your chats',
      style: FlutterFlowTheme.of(context).bodyMedium.override(
            font: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
            ),
            color: FlutterFlowTheme.of(context).primaryBackground,
            fontSize: 20.0,
            letterSpacing: 0.0,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
    );
  }
}
