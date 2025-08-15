import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'verifiyaccounturgent_model.dart';
export 'verifiyaccounturgent_model.dart';

class VerifiyaccounturgentWidget extends StatefulWidget {
  const VerifiyaccounturgentWidget({super.key});

  @override
  State<VerifiyaccounturgentWidget> createState() =>
      _VerifiyaccounturgentWidgetState();
}

class _VerifiyaccounturgentWidgetState
    extends State<VerifiyaccounturgentWidget> {
  late VerifiyaccounturgentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerifiyaccounturgentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FaIcon(
            FontAwesomeIcons.exclamationTriangle,
            color: FlutterFlowTheme.of(context).secondary,
            size: 30.0,
          ),
          Flexible(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'VERIFY YOUR ACCOUNT',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FontStyle.italic,
                      ),
                ),
                Text(
                  '!',
                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FlutterFlowTheme.of(context)
                              .headlineMedium
                              .fontWeight,
                          fontStyle: FontStyle.italic,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .fontWeight,
                        fontStyle: FontStyle.italic,
                      ),
                ),
              ],
            ),
          ),
          Text(
            'Your account hasn\'t been verified by our platform. You will only be able to perform tasks when you verify your account on Quicky®',
            textAlign: TextAlign.center,
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).secondaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
          ),
          FFButtonWidget(
            onPressed: () async {
              logFirebaseEvent('VERIFIYACCOUNTURGENT_GO_THERE_BTN_ON_TAP');
              logFirebaseEvent('Button_navigate_to');

              context.pushNamed(PhoneNumberCopy2Widget.routeName);
            },
            text: 'GO THERE',
            icon: Icon(
              Icons.chevron_right_sharp,
              size: 22.0,
            ),
            options: FFButtonOptions(
              width: MediaQuery.sizeOf(context).width * 0.5,
              height: 40.0,
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconAlignment: IconAlignment.end,
              iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              iconColor: FlutterFlowTheme.of(context).secondaryBackground,
              color: FlutterFlowTheme.of(context).primaryBackground,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.poppins(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                    ),
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    fontSize: 18.0,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ].divide(SizedBox(height: 16.0)),
      ),
    );
  }
}
