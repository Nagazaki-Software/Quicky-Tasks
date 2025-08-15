import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'text_field_raties_model.dart';
export 'text_field_raties_model.dart';

class TextFieldRatiesWidget extends StatefulWidget {
  const TextFieldRatiesWidget({
    super.key,
    this.time,
  });

  final String? time;

  @override
  State<TextFieldRatiesWidget> createState() => _TextFieldRatiesWidgetState();
}

class _TextFieldRatiesWidgetState extends State<TextFieldRatiesWidget> {
  late TextFieldRatiesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TextFieldRatiesModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      builder: (context) => Container(
        width: double.infinity,
        child: TextFormField(
          controller: _model.textController,
          focusNode: _model.textFieldFocusNode,
          onChanged: (_) => EasyDebounce.debounce(
            '_model.textController',
            Duration(milliseconds: 2000),
            () async {
              logFirebaseEvent('TEXT_FIELD_RATIES_TextField_obw4niya_ON_');
              if (widget.time == 'taskeefeedback1') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().taskeefeedback1 = _model.textController.text;
                safeSetState(() {});
              } else if (widget.time == 'taskeefeedback2') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().taskeefeedback2 = _model.textController.text;
                safeSetState(() {});
              } else if (widget.time == 'taskeefeedback3') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().taskeefeedback3 = _model.textController.text;
                safeSetState(() {});
              } else if (widget.time == 'taskeefeedback4') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().taskeefeedback4 = _model.textController.text;
                safeSetState(() {});
              } else if (widget.time == 'taskeefeedback5') {
                logFirebaseEvent('TextField_update_app_state');
                FFAppState().taskeefeedback5 = _model.textController.text;
                safeSetState(() {});
              }
            },
          ),
          autofocus: false,
          obscureText: false,
          decoration: InputDecoration(
            isDense: true,
            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color: FlutterFlowTheme.of(context).primaryText,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
            hintText: 'Add Comment',
            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                  font: GoogleFonts.poppins(
                    fontWeight:
                        FlutterFlowTheme.of(context).labelMedium.fontWeight,
                    fontStyle:
                        FlutterFlowTheme.of(context).labelMedium.fontStyle,
                  ),
                  color:
                      valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                              'Taskee'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primaryBackground,
                  fontSize: 8.0,
                  letterSpacing: 0.0,
                  fontWeight:
                      FlutterFlowTheme.of(context).labelMedium.fontWeight,
                  fontStyle: FlutterFlowTheme.of(context).labelMedium.fontStyle,
                ),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
          ),
          style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                fontSize: 10.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.w500,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
          maxLines: null,
          cursorColor: FlutterFlowTheme.of(context).primaryText,
          validator: _model.textControllerValidator.asValidator(context),
        ),
      ),
    );
  }
}
