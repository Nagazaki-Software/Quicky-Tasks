import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'walkthroght_current_page_step2_copy_model.dart';
export 'walkthroght_current_page_step2_copy_model.dart';

class WalkthroghtCurrentPageStep2CopyWidget extends StatefulWidget {
  const WalkthroghtCurrentPageStep2CopyWidget({super.key});

  @override
  State<WalkthroghtCurrentPageStep2CopyWidget> createState() =>
      _WalkthroghtCurrentPageStep2CopyWidgetState();
}

class _WalkthroghtCurrentPageStep2CopyWidgetState
    extends State<WalkthroghtCurrentPageStep2CopyWidget> {
  late WalkthroghtCurrentPageStep2CopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WalkthroghtCurrentPageStep2CopyModel());

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
      'Your tasks completed',
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
