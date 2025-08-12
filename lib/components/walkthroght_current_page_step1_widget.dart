import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'walkthroght_current_page_step1_model.dart';
export 'walkthroght_current_page_step1_model.dart';

class WalkthroghtCurrentPageStep1Widget extends StatefulWidget {
  const WalkthroghtCurrentPageStep1Widget({super.key});

  @override
  State<WalkthroghtCurrentPageStep1Widget> createState() =>
      _WalkthroghtCurrentPageStep1WidgetState();
}

class _WalkthroghtCurrentPageStep1WidgetState
    extends State<WalkthroghtCurrentPageStep1Widget> {
  late WalkthroghtCurrentPageStep1Model _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroghtCurrentPageStep1Model());

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
      'Tasks in progress',
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
