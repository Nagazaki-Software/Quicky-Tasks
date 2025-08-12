import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'evaluate_task_before_copy_model.dart';
export 'evaluate_task_before_copy_model.dart';

/// crie um componente com tasker sendo aprovado aguarde
class EvaluateTaskBeforeCopyWidget extends StatefulWidget {
  const EvaluateTaskBeforeCopyWidget({super.key});

  @override
  State<EvaluateTaskBeforeCopyWidget> createState() =>
      _EvaluateTaskBeforeCopyWidgetState();
}

class _EvaluateTaskBeforeCopyWidgetState
    extends State<EvaluateTaskBeforeCopyWidget> {
  late EvaluateTaskBeforeCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EvaluateTaskBeforeCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: AuthUserStreamWidget(
        builder: (context) => Container(
          decoration: BoxDecoration(
            color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                    'Taskee'
                ? FlutterFlowTheme.of(context).primaryBackground
                : FlutterFlowTheme.of(context).secondaryBackground,
            boxShadow: [
              BoxShadow(
                blurRadius: 8.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  -2.0,
                ),
                spreadRadius: 0.0,
              )
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(0.0),
              bottomRight: Radius.circular(0.0),
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40.0,
                  height: 4.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).alternate,
                    borderRadius: BorderRadius.circular(2.0),
                  ),
                  alignment: AlignmentDirectional(0.0, 0.0),
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).alternate,
                            borderRadius: BorderRadius.circular(24.0),
                          ),
                          child: Align(
                            alignment: AlignmentDirectional(0.0, 0.0),
                            child: FaIcon(
                              FontAwesomeIcons.exclamationTriangle,
                              color: Color(0xFFD31E29),
                              size: 24.0,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Oops again...',
                                style: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                      ),
                                      color: valueOrDefault(
                                                  currentUserDocument
                                                      ?.taskOrTaskee,
                                                  '') ==
                                              'Taskee'
                                          ? FlutterFlowTheme.of(context)
                                              .secondaryBackground
                                          : FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                      fontSize: 24.0,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w600,
                                      fontStyle: FontStyle.italic,
                                    ),
                              ),
                              Text(
                                'Rate the taskee then come back and rate other tasks.',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      font: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w300,
                                        fontStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .fontStyle,
                                      ),
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                              ),
                            ],
                          ),
                        ),
                      ].divide(SizedBox(width: 12.0)),
                    ),
                  ].divide(SizedBox(height: 16.0)),
                ),
                FFButtonWidget(
                  onPressed: () async {
                    logFirebaseEvent(
                        'EVALUATE_TASK_BEFORE_COPY_OKAY_ILL_EVALU');
                    logFirebaseEvent('Button_bottom_sheet');
                    Navigator.pop(context);
                  },
                  text: 'Okay, I\'ll evaluate',
                  options: FFButtonOptions(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color:
                        valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                                'Taskee'
                            ? FlutterFlowTheme.of(context).secondaryBackground
                            : FlutterFlowTheme.of(context).primaryBackground,
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic,
                          ),
                          color: valueOrDefault<Color>(
                            valueOrDefault(currentUserDocument?.taskOrTaskee,
                                        '') ==
                                    'Taskee'
                                ? FlutterFlowTheme.of(context).primaryBackground
                                : FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                            FlutterFlowTheme.of(context).primaryBackground,
                          ),
                          fontSize: 18.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.normal,
                          fontStyle: FontStyle.italic,
                        ),
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ].divide(SizedBox(height: 20.0)),
            ),
          ),
        ),
      ),
    );
  }
}
