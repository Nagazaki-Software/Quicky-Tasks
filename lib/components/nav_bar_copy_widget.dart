import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'nav_bar_copy_model.dart';
export 'nav_bar_copy_model.dart';

class NavBarCopyWidget extends StatefulWidget {
  const NavBarCopyWidget({super.key});

  @override
  State<NavBarCopyWidget> createState() => _NavBarCopyWidgetState();
}

class _NavBarCopyWidgetState extends State<NavBarCopyWidget> {
  late NavBarCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavBarCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Align(
      alignment: AlignmentDirectional(0.0, 1.0),
      child: Container(
        width: MediaQuery.sizeOf(context).width * 1.0,
        height: 65.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          boxShadow: [
            BoxShadow(
              blurRadius: 4.0,
              color: Color(0x4C98B28E),
              offset: Offset(
                0.0,
                2.0,
              ),
            )
          ],
          borderRadius: BorderRadius.circular(0.0),
        ),
        child: Stack(
          children: [
            Align(
              alignment: AlignmentDirectional(0.0, -1.0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 0.8,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).tertiary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BAR_COPY_COMP_Column_54nfkd28_ON_TAP');
                    logFirebaseEvent('Column_update_app_state');
                    FFAppState().pages = 'scoreboardTasker';
                    safeSetState(() {});
                    logFirebaseEvent('Column_navigate_to');

                    context.goNamed(
                      TaskeeRankingTaskerWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FaIcon(
                        FontAwesomeIcons.trophy,
                        color: FFAppState().pages == 'scoreboardTasker'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 22.0,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BAR_COPY_COMP_Column_0244ylbj_ON_TAP');
                    logFirebaseEvent('Column_update_app_state');
                    FFAppState().pages = 'ratingsTasker';
                    safeSetState(() {});
                    logFirebaseEvent('Column_navigate_to');

                    context.goNamed(
                      FeedbackandEventsTaskerWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star_half,
                        color: FFAppState().pages == 'ratingsTasker'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 28.0,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BAR_COPY_COMP_Column_e4cz6l60_ON_TAP');
                    logFirebaseEvent('Column_update_app_state');
                    FFAppState().pages = 'swipePage';
                    safeSetState(() {});
                    logFirebaseEvent('Column_navigate_to');

                    context.goNamed(
                      SwipeTaskerWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.swipe_up,
                        color: FFAppState().pages == 'swipePage'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 28.0,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BAR_COPY_COMP_Column_twmx1e8h_ON_TAP');
                    logFirebaseEvent('Column_update_app_state');
                    FFAppState().pages = 'currentTasksTasker';
                    safeSetState(() {});
                    logFirebaseEvent('Column_navigate_to');

                    context.goNamed(
                      CurrentTasksWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.menu_open_rounded,
                        color: FFAppState().pages == 'currentTasksTasker'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 28.0,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () async {
                    logFirebaseEvent(
                        'NAV_BAR_COPY_COMP_Column_8uks1vus_ON_TAP');
                    logFirebaseEvent('Column_update_app_state');
                    FFAppState().pages = 'profilePageTasker';
                    safeSetState(() {});
                    logFirebaseEvent('Column_navigate_to');

                    context.goNamed(
                      ProfilePageWidget.routeName,
                      extra: <String, dynamic>{
                        kTransitionInfoKey: TransitionInfo(
                          hasTransition: true,
                          transitionType: PageTransitionType.fade,
                          duration: Duration(milliseconds: 0),
                        ),
                      },
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person_sharp,
                        color: FFAppState().pages == 'profilePageTasker'
                            ? FlutterFlowTheme.of(context).alternate
                            : FlutterFlowTheme.of(context).primaryBackground,
                        size: 28.0,
                      ),
                    ],
                  ),
                ),
              ].divide(SizedBox(width: 20.0)).around(SizedBox(width: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
