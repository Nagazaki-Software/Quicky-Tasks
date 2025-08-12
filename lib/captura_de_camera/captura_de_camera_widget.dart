import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import 'package:flutter/material.dart';
import 'captura_de_camera_model.dart';
export 'captura_de_camera_model.dart';

class CapturaDeCameraWidget extends StatefulWidget {
  const CapturaDeCameraWidget({super.key});

  static String routeName = 'capturaDeCamera';
  static String routePath = '/capturaDeCamera';

  @override
  State<CapturaDeCameraWidget> createState() => _CapturaDeCameraWidgetState();
}

class _CapturaDeCameraWidgetState extends State<CapturaDeCameraWidget> {
  late CapturaDeCameraModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CapturaDeCameraModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'capturaDeCamera'});
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              AuthUserStreamWidget(
                builder: (context) => Container(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: MediaQuery.sizeOf(context).height * 1.0,
                  child: custom_widgets.DocumentCapturePage(
                    width: MediaQuery.sizeOf(context).width * 1.0,
                    height: MediaQuery.sizeOf(context).height * 1.0,
                    accountId: valueOrDefault(
                        currentUserDocument?.clienteStripeId, ''),
                    uid: currentUserUid,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
