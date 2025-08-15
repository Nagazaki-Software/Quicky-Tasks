import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'payment_erorr_model.dart';
export 'payment_erorr_model.dart';

/// crie um componente para quando não for pago
class PaymentErorrWidget extends StatefulWidget {
  const PaymentErorrWidget({super.key});

  @override
  State<PaymentErorrWidget> createState() => _PaymentErorrWidgetState();
}

class _PaymentErorrWidgetState extends State<PaymentErorrWidget> {
  late PaymentErorrModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentErorrModel());

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
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFEBEE),
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Color(0xFFF90817),
                    size: 24.0,
                  ),
                  Text(
                    'Payment Failed',
                    style: FlutterFlowTheme.of(context).titleMedium.override(
                          font: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          fontSize: 24.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                  ),
                ].divide(SizedBox(width: 8.0)),
              ),
              Text(
                'Looks like your payment didn’t go through. You can try again with a different card, and if the issue continues, our support team is here to help!',
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
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).alternate,
                ),
              ),
              FFButtonWidget(
                onPressed: () async {
                  logFirebaseEvent('PAYMENT_ERORR_COMP_OK_BTN_ON_TAP');
                  logFirebaseEvent('Button_navigate_to');

                  context.pushNamed(SwipeTaskerWidget.routeName);
                },
                text: 'OK',
                options: FFButtonOptions(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                  height: 40.0,
                  padding: EdgeInsets.all(8.0),
                  iconPadding:
                      EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                        ),
                        color: FlutterFlowTheme.of(context).info,
                        letterSpacing: 4.0,
                        fontWeight: FontWeight.w300,
                        fontStyle: FontStyle.italic,
                      ),
                  elevation: 0.0,
                  borderSide: BorderSide(
                    color: Colors.transparent,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ].divide(SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
