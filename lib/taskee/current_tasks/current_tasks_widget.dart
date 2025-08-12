import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/noactivechats_copy_widget.dart';
import '/components/noactivechats_widget.dart';
import '/components/noactivetask_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/walkthroughs/current_task_help.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart'
    show TutorialCoachMark;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';
import 'current_tasks_model.dart';
export 'current_tasks_model.dart';

class CurrentTasksWidget extends StatefulWidget {
  const CurrentTasksWidget({super.key});

  static String routeName = 'currentTasks';
  static String routePath = '/currentTasks';

  @override
  State<CurrentTasksWidget> createState() => _CurrentTasksWidgetState();
}

class _CurrentTasksWidgetState extends State<CurrentTasksWidget>
    with TickerProviderStateMixin {
  late CurrentTasksModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasStackTriggered1 = false;
  var hasStackTriggered2 = false;
  var hasStackTriggered3 = false;
  var hasStackTriggered4 = false;
  var hasStackTriggered5 = false;
  var hasStackTriggered6 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CurrentTasksModel());

    logFirebaseEvent('screen_view',
        parameters: {'screen_name': 'currentTasks'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('CURRENT_TASKS_currentTasks_ON_INIT_STATE');
      logFirebaseEvent('currentTasks_clear_query_cache');
      FFAppState().clearCacheActiveTaskeeCache();
      logFirebaseEvent('currentTasks_clear_query_cache');
      FFAppState().clearCacheActiveTaskerCache();
    });

    animationsMap.addAll({
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'textOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 1440.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'textOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 840.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'columnOnPageLoadAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 690.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'stackOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 310.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: PopScope(
          canPop: false,
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: valueOrDefault<Color>(
              valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
              FlutterFlowTheme.of(context).primaryBackground,
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                children: [
                  if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                      'Tasker')
                    Container(
                      width: double.infinity,
                      height: double.infinity,
                      child: Stack(
                        children: [
                          Align(
                            alignment: AlignmentDirectional(0.0, -1.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (FFAppState().selectedTabName ==
                                    'Active Tasks')
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      16.0, 24.0, 16.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      StreamBuilder<
                                                          List<TasksRecord>>(
                                                        stream:
                                                            queryTasksRecord(
                                                          queryBuilder:
                                                              (tasksRecord) =>
                                                                  tasksRecord
                                                                      .where(
                                                            'usuarioQueAceitouaTask',
                                                            isEqualTo:
                                                                currentUserReference,
                                                          ),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<TasksRecord>
                                                              textTasksRecordList =
                                                              snapshot.data!;
                                                          // Return an empty Container when the item does not exist.
                                                          if (snapshot
                                                              .data!.isEmpty) {
                                                            return Container();
                                                          }
                                                          final textTasksRecord =
                                                              textTasksRecordList
                                                                      .isNotEmpty
                                                                  ? textTasksRecordList
                                                                      .first
                                                                  : null;

                                                          return Text(
                                                            'Active Tasks',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineMedium
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 16.0)),
                                                  ),
                                                  Expanded(
                                                    child: StreamBuilder<
                                                        List<TasksRecord>>(
                                                      stream: FFAppState()
                                                          .cacheActiveTaskee(
                                                        requestFn: () =>
                                                            queryTasksRecord(
                                                          queryBuilder:
                                                              (tasksRecord) =>
                                                                  tasksRecord
                                                                      .where(
                                                                        'usuarioQueAceitouaTask',
                                                                        isEqualTo:
                                                                            currentUserReference,
                                                                      )
                                                                      .where(
                                                                        'status',
                                                                        isEqualTo:
                                                                            'approved',
                                                                      ),
                                                        ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        List<TasksRecord>
                                                            columnTasksRecordList =
                                                            snapshot.data!;
                                                        if (columnTasksRecordList
                                                            .isEmpty) {
                                                          return NoactivetaskWidget();
                                                        }

                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: List.generate(
                                                              columnTasksRecordList
                                                                  .length,
                                                              (columnIndex) {
                                                            final columnTasksRecord =
                                                                columnTasksRecordList[
                                                                    columnIndex];
                                                            return Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                  child: Text(
                                                                    columnTasksRecord
                                                                        .categoria,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                      color: Color(
                                                                          0xFF6B9080),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                      shadows: [
                                                                        Shadow(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          offset: Offset(
                                                                              0.6,
                                                                              0.6),
                                                                          blurRadius:
                                                                              0.0,
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      0.8,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Container(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height:
                                                                            125.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                          borderRadius:
                                                                              BorderRadius.circular(12.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                Color(0xFFC1C1C1),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                ClipRRect(
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(12.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(12.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                  child: Image.network(
                                                                                    columnTasksRecord.foto.firstOrNull!,
                                                                                    width: 130.0,
                                                                                    height: 125.0,
                                                                                    fit: BoxFit.cover,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            Flexible(
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                child: Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: FutureBuilder<UsersRecord>(
                                                                                        future: UsersRecord.getDocumentOnce(columnTasksRecord.userReference!),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                child: SpinKitPulse(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 50.0,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }

                                                                                          final rowUsersRecord = snapshot.data!;

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  rowUsersRecord.photoUrl,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      rowUsersRecord.displayName,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            font: GoogleFonts.poppins(
                                                                                                              fontWeight: FontWeight.w500,
                                                                                                              fontStyle: FontStyle.italic,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                            fontSize: 10.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w500,
                                                                                                            fontStyle: FontStyle.italic,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.star_rate_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '4.2',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.poppins(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          fontSize: 8.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                '572 reviews',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 6.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                      child: Text(
                                                                                        'Quick tidy-up to make your space\npresentable.',
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.poppins(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 8.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: Container(
                                                                                        width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                        height: 30.0,
                                                                                        decoration: BoxDecoration(),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Align(
                                                                                                alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                child: InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    logFirebaseEvent('CURRENT_TASKS_Container_l4q9b0cs_ON_TAP');
                                                                                                    logFirebaseEvent('Container_navigate_to');

                                                                                                    context.pushNamed(
                                                                                                      TaskOverviewTaskerWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'task': serializeParam(
                                                                                                          columnTasksRecord.reference,
                                                                                                          ParamType.DocumentReference,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                    );
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    width: 70.0,
                                                                                                    height: 40.0,
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      borderRadius: BorderRadius.only(
                                                                                                        bottomLeft: Radius.circular(5.0),
                                                                                                        bottomRight: Radius.circular(5.0),
                                                                                                        topLeft: Radius.circular(5.0),
                                                                                                        topRight: Radius.circular(5.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                    child: Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'View Task',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              font: GoogleFonts.poppins(
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FontStyle.italic,
                                                                                                              ),
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FontStyle.italic,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          TasksPreProntasRecord>(
                                                                        future:
                                                                            TasksPreProntasRecord.getDocumentOnce(columnTasksRecord.taskPrePronta!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitPulse(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final progressBarTasksPreProntasRecord =
                                                                              snapshot.data!;

                                                                          return LinearPercentIndicator(
                                                                            percent:
                                                                                valueOrDefault<double>(
                                                                              functions.progressBar(progressBarTasksPreProntasRecord.steps.length, columnTasksRecord.stepsFinalizadas),
                                                                              0.0,
                                                                            ),
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 0.75,
                                                                            lineHeight:
                                                                                8.0,
                                                                            animation:
                                                                                true,
                                                                            animateFromLastPercent:
                                                                                true,
                                                                            progressColor:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            backgroundColor:
                                                                                Color(0x4098B28E),
                                                                            barRadius:
                                                                                Radius.circular(12.0),
                                                                            padding:
                                                                                EdgeInsets.zero,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            8.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            );
                                                          }).divide(SizedBox(
                                                              height: 12.0)),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 16.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation1']!),
                                    ),
                                  ),
                                if (FFAppState().selectedTabName ==
                                    'Messages & Calendar')
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 40.0, 0.0, 0.0),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.86,
                                                child: Stack(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        30.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          30.0,
                                                                          0.0,
                                                                          0.0,
                                                                          8.0),
                                                                  child: Text(
                                                                    'Chats',
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .headlineMedium
                                                                        .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        0.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: StreamBuilder<
                                                                List<
                                                                    ChatRecord>>(
                                                              stream: FFAppState()
                                                                  .cachechattasker(
                                                                requestFn: () =>
                                                                    queryChatRecord(
                                                                  queryBuilder:
                                                                      (chatRecord) =>
                                                                          chatRecord
                                                                              .where(
                                                                    'user2Document',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitPulse(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<ChatRecord>
                                                                    columnChatRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: List.generate(
                                                                      columnChatRecordList
                                                                          .length,
                                                                      (columnIndex) {
                                                                    final columnChatRecord =
                                                                        columnChatRecordList[
                                                                            columnIndex];
                                                                    return Container(
                                                                      width: double
                                                                          .infinity,
                                                                      decoration:
                                                                          BoxDecoration(),
                                                                      child: FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(columnChatRecord.userDocument!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitPulse(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final rowUsersRecord =
                                                                              snapshot.data!;

                                                                          return InkWell(
                                                                            splashColor:
                                                                                Colors.transparent,
                                                                            focusColor:
                                                                                Colors.transparent,
                                                                            hoverColor:
                                                                                Colors.transparent,
                                                                            highlightColor:
                                                                                Colors.transparent,
                                                                            onTap:
                                                                                () async {
                                                                              logFirebaseEvent('CURRENT_TASKS_PAGE_Row_rkzp0t8v_ON_TAP');
                                                                              logFirebaseEvent('Row_navigate_to');

                                                                              context.pushNamed(
                                                                                ChatTaskerWidget.routeName,
                                                                                queryParameters: {
                                                                                  'chat': serializeParam(
                                                                                    columnChatRecord.reference,
                                                                                    ParamType.DocumentReference,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Container(
                                                                                  width: 40.0,
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFF0F0F0),
                                                                                    image: DecorationImage(
                                                                                      fit: BoxFit.cover,
                                                                                      image: Image.network(
                                                                                        rowUsersRecord.photoUrl,
                                                                                      ).image,
                                                                                    ),
                                                                                    shape: BoxShape.circle,
                                                                                  ),
                                                                                ),
                                                                                Flexible(
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Flexible(
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  rowUsersRecord.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FontStyle.italic,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.star,
                                                                                                    color: Color(0xFFFFC107),
                                                                                                    size: 16.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '4.8',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          font: GoogleFonts.poppins(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 4.0)),
                                                                                              ),
                                                                                              Text(
                                                                                                '5/2 reviews',
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 12.0)),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 12.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                            child: Text(
                                                                                              'Task',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                font: GoogleFonts.poppins(
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                                color: Color(0xFF6B9080),
                                                                                                fontSize: 12.0,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w500,
                                                                                                fontStyle: FontStyle.italic,
                                                                                                shadows: [
                                                                                                  Shadow(
                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                    offset: Offset(0.4, 0.4),
                                                                                                    blurRadius: 0.0,
                                                                                                  )
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          FutureBuilder<TasksRecord>(
                                                                                            future: TasksRecord.getDocumentOnce(columnChatRecord.referenceTask!),
                                                                                            builder: (context, snapshot) {
                                                                                              // Customize what your widget looks like when it's loading.
                                                                                              if (!snapshot.hasData) {
                                                                                                return Center(
                                                                                                  child: SizedBox(
                                                                                                    width: 50.0,
                                                                                                    height: 50.0,
                                                                                                    child: SpinKitPulse(
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 50.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              }

                                                                                              final textTasksRecord = snapshot.data!;

                                                                                              return Text(
                                                                                                textTasksRecord.titulo,
                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                    ),
                                                                                              );
                                                                                            },
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 4.0)),
                                                                            ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    );
                                                                  }).divide(SizedBox(
                                                                      height:
                                                                          20.0)),
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    16.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'My Tasks Calendar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            StreamBuilder<
                                                                List<
                                                                    TasksRecord>>(
                                                              stream:
                                                                  queryTasksRecord(
                                                                queryBuilder:
                                                                    (tasksRecord) =>
                                                                        tasksRecord
                                                                            .where(
                                                                  'usuarioQueAceitouaTask',
                                                                  isEqualTo:
                                                                      currentUserReference,
                                                                ),
                                                              ),
                                                              builder: (context,
                                                                  snapshot) {
                                                                // Customize what your widget looks like when it's loading.
                                                                if (!snapshot
                                                                    .hasData) {
                                                                  return Center(
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      child:
                                                                          SpinKitPulse(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            50.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<TasksRecord>
                                                                    containerTasksRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  width: MediaQuery.sizeOf(
                                                                              context)
                                                                          .width *
                                                                      1.0,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.135,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child: Stack(
                                                                    children: [
                                                                      if (containerTasksRecordList
                                                                          .isNotEmpty)
                                                                        Container(
                                                                          width:
                                                                              MediaQuery.sizeOf(context).width * 1.0,
                                                                          height:
                                                                              MediaQuery.sizeOf(context).height * 0.08,
                                                                          child:
                                                                              custom_widgets.TimeList30MinHorizontal(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            height:
                                                                                MediaQuery.sizeOf(context).height * 0.08,
                                                                            tasks:
                                                                                containerTasksRecordList,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            onTimeSelected:
                                                                                (selectedTime) async {},
                                                                          ),
                                                                        ),
                                                                      if (!(containerTasksRecordList
                                                                          .isNotEmpty))
                                                                        Text(
                                                                          'You have no active tasks.',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                    ],
                                                                  ),
                                                                );
                                                              },
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 8.0)),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ).animateOnPageLoad(animationsMap[
                                            'columnOnPageLoadAnimation2']!),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().selectedTabName ==
                                    'Completed Tasks')
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 60.0, 0.0, 0.0),
                                        child: StreamBuilder<List<TasksRecord>>(
                                          stream: queryTasksRecord(
                                            queryBuilder: (tasksRecord) =>
                                                tasksRecord
                                                    .where(
                                                      'userReference',
                                                      isEqualTo:
                                                          currentUserReference,
                                                    )
                                                    .where(
                                                      'status',
                                                      isEqualTo: 'completed',
                                                    ),
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50.0,
                                                  height: 50.0,
                                                  child: SpinKitPulse(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 50.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TasksRecord>
                                                columnTasksRecordList =
                                                snapshot.data!;
                                            final columnTasksRecord =
                                                columnTasksRecordList.isNotEmpty
                                                    ? columnTasksRecordList
                                                        .first
                                                    : null;

                                            return SingleChildScrollView(
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  SingleChildScrollView(
                                                    primary: false,
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      14.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                'Completed Tasks',
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                      fontSize:
                                                                          24.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      0.0,
                                                                      16.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                              ),
                                                            ].divide(SizedBox(
                                                                height: 16.0)),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  if (columnTasksRecord != null)
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  18.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: FutureBuilder<int>(
                                                        future:
                                                            queryTasksRecordCount(
                                                          queryBuilder:
                                                              (tasksRecord) =>
                                                                  tasksRecord
                                                                      .where(
                                                                        'userReference',
                                                                        isEqualTo:
                                                                            currentUserReference,
                                                                      )
                                                                      .where(
                                                                        'status',
                                                                        isEqualTo:
                                                                            'completed',
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    SpinKitPulse(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 50.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int rowCount =
                                                              snapshot.data!;

                                                          return SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Container(
                                                                  width:
                                                                      100.0,
                                                                  height:
                                                                      90.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(14.0),
                                                                      bottomRight:
                                                                          Radius.circular(14.0),
                                                                      topLeft:
                                                                          Radius.circular(14.0),
                                                                      topRight:
                                                                          Radius.circular(14.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional.fromSTEB(
                                                                        0.0,
                                                                        5.0,
                                                                        0.0,
                                                                        5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize.max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment.center,
                                                                      children: [
                                                                        Text(
                                                                          'Total Tasks',
                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<String>(
                                                                            rowCount.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 50.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        TasksRecord>>(
                                                                  stream:
                                                                      queryTasksRecord(
                                                                    queryBuilder: (tasksRecord) => tasksRecord
                                                                        .where(
                                                                          'userReference',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo:
                                                                              'completed',
                                                                        ),
                                                                  ),
                                                                  builder:
                                                                      (context,
                                                                          snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                            size: 50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<TasksRecord>
                                                                        containerTasksRecordList =
                                                                        snapshot
                                                                            .data!;

                                                                    return Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(14.0),
                                                                          bottomRight:
                                                                              Radius.circular(14.0),
                                                                          topLeft:
                                                                              Radius.circular(14.0),
                                                                          topRight:
                                                                              Radius.circular(14.0),
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            4.0,
                                                                            10.0,
                                                                            4.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Text(
                                                                              'Task to Prize',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 12.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              '15',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 50.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.bold,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                                if ((currentUserDocument
                                                                            ?.mostOrded
                                                                            .toList() ??
                                                                        [])
                                                                    .isNotEmpty)
                                                                  Container(
                                                                    width:
                                                                        100.0,
                                                                    height:
                                                                        90.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondary,
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .only(
                                                                        bottomLeft:
                                                                            Radius.circular(14.0),
                                                                        bottomRight:
                                                                            Radius.circular(14.0),
                                                                        topLeft:
                                                                            Radius.circular(14.0),
                                                                        topRight:
                                                                            Radius.circular(14.0),
                                                                      ),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          5.0,
                                                                          0.0,
                                                                          5.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Text(
                                                                            'Most Ordered\ncategory',
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                          Text(
                                                                            functions.retorneAstringmaisadicionada((currentUserDocument?.mostOrded.toList() ?? []).toList()),
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                                  color: Colors.white,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                              ].divide(SizedBox(
                                                                  width: 10.0)),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  StreamBuilder<
                                                      List<TasksRecord>>(
                                                    stream: FFAppState()
                                                        .cacheCompletedTasker(
                                                      requestFn: () =>
                                                          queryTasksRecord(
                                                        queryBuilder:
                                                            (tasksRecord) =>
                                                                tasksRecord
                                                                    .where(
                                                                      'usuarioQueAceitouaTask',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'completed',
                                                                    ),
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TasksRecord>
                                                          columnTasksRecordList =
                                                          snapshot.data!;
                                                      if (columnTasksRecordList
                                                          .isEmpty) {
                                                        return NoactivechatsCopyWidget();
                                                      }

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            columnTasksRecordList
                                                                .length,
                                                            (columnIndex) {
                                                          final columnTasksRecord =
                                                              columnTasksRecordList[
                                                                  columnIndex];
                                                          return Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        12.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          14.0,
                                                                          6.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                45.0,
                                                                            height:
                                                                                38.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(12.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(12.0),
                                                                              ),
                                                                              border: Border.all(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                width: 3.0,
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.indexList1(columnIndex.toString()).toString(),
                                                                                  '1',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      fontSize: 22.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(-1.0, -1.0),
                                                                            child:
                                                                                Text(
                                                                              'Info',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Color(0xFF6B9080),
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FontStyle.italic,
                                                                                shadows: [
                                                                                  Shadow(
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    offset: Offset(0.4, 0.4),
                                                                                    blurRadius: 0.0,
                                                                                  )
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Flexible(
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.end,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                              child: Text(
                                                                                columnTasksRecord.categoria,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontStyle: FontStyle.italic,
                                                                                      ),
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      fontSize: 16.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 0.0, 8.0),
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                height: 0.5,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            FutureBuilder<UsersRecord>(
                                                                              future: UsersRecord.getDocumentOnce(columnTasksRecord.userReference!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: SpinKitPulse(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                final rowUsersRecord = snapshot.data!;

                                                                                return Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                                                  children: [
                                                                                    Container(
                                                                                      width: 20.0,
                                                                                      height: 20.0,
                                                                                      clipBehavior: Clip.antiAlias,
                                                                                      decoration: BoxDecoration(
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                      child: Image.network(
                                                                                        rowUsersRecord.photoUrl,
                                                                                        fit: BoxFit.cover,
                                                                                      ),
                                                                                    ),
                                                                                    Text(
                                                                                      rowUsersRecord.displayName,
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            font: GoogleFonts.poppins(
                                                                                              fontWeight: FontWeight.w500,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                            color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                            fontSize: 12.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w500,
                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                          ),
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 6.0)),
                                                                                );
                                                                              },
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        width:
                                                                            79.0,
                                                                        height:
                                                                            54.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(16.0),
                                                                            bottomRight:
                                                                                Radius.circular(16.0),
                                                                            topLeft:
                                                                                Radius.circular(16.0),
                                                                            topRight:
                                                                                Radius.circular(16.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                14.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Profit ${columnTasksRecord.valor}',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            12.0)),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 190.0,
                                                                  height: 0.7,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        }),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                            ).animateOnPageLoad(animationsMap[
                                                'columnOnPageLoadAnimation3']!);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(1.0, 0.0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 4.0, 0.0),
                                    child: Container(
                                      width: 35.0,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.64,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Container(
                                              width: 45.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              decoration: BoxDecoration(
                                                color: () {
                                                  if (FFAppState()
                                                          .selectedTabName ==
                                                      'Active Tasks') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .secondary;
                                                  } else if (FFAppState()
                                                          .selectedTabName ==
                                                      'Completed Tasks') {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .tertiary;
                                                  } else {
                                                    return FlutterFlowTheme.of(
                                                            context)
                                                        .primary;
                                                  }
                                                }(),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, -1.0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 10.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 20.0,
                                                                0.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Icon(
                                                          Icons.circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 12.0,
                                                        ),
                                                        Icon(
                                                          Icons.circle,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          size: 12.0,
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 8.0)),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CURRENT_TASKS_StackActiveTask_ON_TAP');
                                                          logFirebaseEvent(
                                                              'StackActiveTask_widget_animation');
                                                          if (animationsMap[
                                                                  'stackOnActionTriggerAnimation1'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasStackTriggered1 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'stackOnActionTriggerAnimation1']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                          logFirebaseEvent(
                                                              'StackActiveTask_update_app_state');
                                                          FFAppState()
                                                                  .selectedTabName =
                                                              'Active Tasks';
                                                          safeSetState(() {});
                                                        },
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          children: [
                                                            if (FFAppState()
                                                                    .selectedTabName ==
                                                                'Active Tasks')
                                                              Container(
                                                                width: 40.0,
                                                                height: 120.0,
                                                                child: custom_widgets
                                                                    .VerticalOvalTab(
                                                                  width: 40.0,
                                                                  height: 120.0,
                                                                  isSelected:
                                                                      true,
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  borderWidth:
                                                                      2.0,
                                                                ),
                                                              ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1.0, 0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 90.0,
                                                                child: custom_widgets
                                                                    .RotatedTaskTexts(
                                                                  width: 50.0,
                                                                  height: 90.0,
                                                                  text:
                                                                      'Active Tasks',
                                                                  cor: FFAppState()
                                                                              .selectedTabName ==
                                                                          'Active Tasks'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ).addWalkthrough(
                                                                containerB60ulmry,
                                                                _model
                                                                    .currentTaskHelpController,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'stackOnActionTriggerAnimation1']!,
                                                          hasBeenTriggered:
                                                              hasStackTriggered1),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CURRENT_TASKS_PAGE_Stack_d0fcjyz4_ON_TAP');
                                                          logFirebaseEvent(
                                                              'Stack_widget_animation');
                                                          if (animationsMap[
                                                                  'stackOnActionTriggerAnimation2'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasStackTriggered2 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'stackOnActionTriggerAnimation2']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                          logFirebaseEvent(
                                                              'Stack_update_app_state');
                                                          FFAppState()
                                                                  .selectedTabName =
                                                              'Messages & Calendar';
                                                          safeSetState(() {});
                                                        },
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          children: [
                                                            if ((String var1) {
                                                              return var1 ==
                                                                  'Messages & Calendar';
                                                            }(FFAppState()
                                                                .selectedTabName))
                                                              Container(
                                                                width: 40.0,
                                                                height: 185.0,
                                                                child: custom_widgets
                                                                    .VerticalOvalTab(
                                                                  width: 40.0,
                                                                  height: 185.0,
                                                                  isSelected:
                                                                      true,
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  borderWidth:
                                                                      2.0,
                                                                ),
                                                              ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 170.0,
                                                                child: custom_widgets
                                                                    .RotatedTaskTexts(
                                                                  width: 50.0,
                                                                  height: 170.0,
                                                                  text:
                                                                      'Messages & Calendar',
                                                                  cor: (String
                                                                          var1) {
                                                                    return var1 ==
                                                                        'Messages & Calendar';
                                                                  }(FFAppState()
                                                                          .selectedTabName)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ).addWalkthrough(
                                                                containerLw45w487,
                                                                _model
                                                                    .currentTaskHelpController,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'stackOnActionTriggerAnimation2']!,
                                                          hasBeenTriggered:
                                                              hasStackTriggered2),
                                                    ),
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  4.0,
                                                                  0.0,
                                                                  4.0,
                                                                  0.0),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          logFirebaseEvent(
                                                              'CURRENT_TASKS_PAGE_StackCompleted_ON_TAP');
                                                          logFirebaseEvent(
                                                              'StackCompleted_widget_animation');
                                                          if (animationsMap[
                                                                  'stackOnActionTriggerAnimation3'] !=
                                                              null) {
                                                            safeSetState(() =>
                                                                hasStackTriggered3 =
                                                                    true);
                                                            SchedulerBinding
                                                                .instance
                                                                .addPostFrameCallback((_) async => await animationsMap[
                                                                        'stackOnActionTriggerAnimation3']!
                                                                    .controller
                                                                    .forward(
                                                                        from:
                                                                            0.0));
                                                          }
                                                          logFirebaseEvent(
                                                              'StackCompleted_update_app_state');
                                                          FFAppState()
                                                                  .selectedTabName =
                                                              'Completed Tasks';
                                                          safeSetState(() {});
                                                        },
                                                        child: Stack(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  -1.0, 0.0),
                                                          children: [
                                                            if (FFAppState()
                                                                    .selectedTabName ==
                                                                'Completed Tasks')
                                                              Container(
                                                                width: 40.0,
                                                                height: 160.0,
                                                                child: custom_widgets
                                                                    .VerticalOvalTab(
                                                                  width: 40.0,
                                                                  height: 160.0,
                                                                  isSelected:
                                                                      true,
                                                                  activeColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  inactiveColor:
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  borderWidth:
                                                                      2.0,
                                                                ),
                                                              ),
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 130.0,
                                                                child: custom_widgets
                                                                    .RotatedTaskTexts(
                                                                  width: 50.0,
                                                                  height: 130.0,
                                                                  text:
                                                                      'Completed Tasks',
                                                                  cor: FFAppState()
                                                                              .selectedTabName ==
                                                                          'Completed Tasks'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ).addWalkthrough(
                                                                containerXszd9e48,
                                                                _model
                                                                    .currentTaskHelpController,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ).animateOnActionTrigger(
                                                          animationsMap[
                                                              'stackOnActionTriggerAnimation3']!,
                                                          hasBeenTriggered:
                                                              hasStackTriggered3),
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 10.0)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Container(
                              height: 70.0,
                              child: Stack(
                                children: [
                                  wrapWithModel(
                                    model: _model.navBarCopyModel,
                                    updateCallback: () => safeSetState(() {}),
                                    child: NavBarCopyWidget(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                      'Taskee')
                    Stack(
                      children: [
                        Align(
                          alignment: AlignmentDirectional(0.0, -1.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (FFAppState().selectedTabName ==
                                  'Active Tasks')
                                Flexible(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 65.0, 16.0, 70.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  StreamBuilder<
                                                      List<TasksRecord>>(
                                                    stream: queryTasksRecord(
                                                      queryBuilder:
                                                          (tasksRecord) =>
                                                              tasksRecord.where(
                                                        'userReference',
                                                        isEqualTo:
                                                            currentUserReference,
                                                      ),
                                                      singleRecord: true,
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 50.0,
                                                            height: 50.0,
                                                            child: SpinKitPulse(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 50.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<TasksRecord>
                                                          textTasksRecordList =
                                                          snapshot.data!;
                                                      // Return an empty Container when the item does not exist.
                                                      if (snapshot
                                                          .data!.isEmpty) {
                                                        return Container();
                                                      }
                                                      final textTasksRecord =
                                                          textTasksRecordList
                                                                  .isNotEmpty
                                                              ? textTasksRecordList
                                                                  .first
                                                              : null;

                                                      return Text(
                                                        'Active Tasks',
                                                        style: FlutterFlowTheme
                                                                .of(context)
                                                            .headlineMedium
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FontStyle
                                                                        .italic,
                                                              ),
                                                              fontSize: 24.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      );
                                                    },
                                                  ),
                                                ].divide(SizedBox(width: 16.0)),
                                              ),
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    0.0, 0.0),
                                                child: StreamBuilder<
                                                    List<TasksRecord>>(
                                                  stream: FFAppState()
                                                      .cacheActiveTasker(
                                                    requestFn: () =>
                                                        queryTasksRecord(
                                                      queryBuilder:
                                                          (tasksRecord) =>
                                                              tasksRecord
                                                                  .where(
                                                                    'userReference',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  )
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        'approved',
                                                                  ),
                                                    ),
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 50.0,
                                                          height: 50.0,
                                                          child: SpinKitPulse(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 50.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<TasksRecord>
                                                        columnTasksRecordList =
                                                        snapshot.data!;
                                                    if (columnTasksRecordList
                                                        .isEmpty) {
                                                      return NoactivetaskWidget();
                                                    }

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          columnTasksRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnTasksRecord =
                                                            columnTasksRecordList[
                                                                columnIndex];
                                                        return Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      -1.0),
                                                              child: Text(
                                                                columnTasksRecord
                                                                    .categoria,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                                  color: Color(
                                                                      0xFF6B9080),
                                                                  fontSize:
                                                                      20.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontStyle:
                                                                      FontStyle
                                                                          .italic,
                                                                  shadows: [
                                                                    Shadow(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      offset: Offset(
                                                                          0.6,
                                                                          0.6),
                                                                      blurRadius:
                                                                          0.0,
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.8,
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height:
                                                                        125.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .alternate,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              12.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Color(
                                                                            0xFFC1C1C1),
                                                                      ),
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            ClipRRect(
                                                                              borderRadius: BorderRadius.only(
                                                                                bottomLeft: Radius.circular(12.0),
                                                                                bottomRight: Radius.circular(0.0),
                                                                                topLeft: Radius.circular(12.0),
                                                                                topRight: Radius.circular(0.0),
                                                                              ),
                                                                              child: Image.network(
                                                                                columnTasksRecord.foto.firstOrNull!,
                                                                                width: 130.0,
                                                                                height: 125.0,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        Flexible(
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                8.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                if (columnTasksRecord.usuarioQueAceitouaTask != null)
                                                                                  Flexible(
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                      child: FutureBuilder<UsersRecord>(
                                                                                        future: UsersRecord.getDocumentOnce(columnTasksRecord.usuarioQueAceitouaTask!),
                                                                                        builder: (context, snapshot) {
                                                                                          // Customize what your widget looks like when it's loading.
                                                                                          if (!snapshot.hasData) {
                                                                                            return Center(
                                                                                              child: SizedBox(
                                                                                                width: 50.0,
                                                                                                height: 50.0,
                                                                                                child: SpinKitPulse(
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 50.0,
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          }

                                                                                          final rowUsersRecord = snapshot.data!;

                                                                                          return Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                            children: [
                                                                                              Container(
                                                                                                width: 20.0,
                                                                                                height: 20.0,
                                                                                                clipBehavior: Clip.antiAlias,
                                                                                                decoration: BoxDecoration(
                                                                                                  shape: BoxShape.circle,
                                                                                                ),
                                                                                                child: Image.network(
                                                                                                  rowUsersRecord.photoUrl,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              ),
                                                                                              Flexible(
                                                                                                child: Text(
                                                                                                  rowUsersRecord.displayName,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FontWeight.w500,
                                                                                                          fontStyle: FontStyle.italic,
                                                                                                        ),
                                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Icon(
                                                                                                    Icons.star_rate_rounded,
                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                    size: 10.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    '4.2',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.poppins(
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                          ),
                                                                                                          color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                          fontSize: 8.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                          fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Text(
                                                                                                '572 reviews',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                      fontSize: 6.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 4.0)),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                if (columnTasksRecord.usuarioQueAceitouaTask == null)
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            'Waiting for tasker',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation1']!),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                if (!columnTasksRecord.acceptRenegociate && (columnTasksRecord.usuarioQueAceitouaTask != null))
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                      children: [
                                                                                        Flexible(
                                                                                          child: Text(
                                                                                            'Waiting for approval',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.w500,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w500,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ).animateOnPageLoad(animationsMap['textOnPageLoadAnimation2']!),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                  child: StreamBuilder<TasksPreProntasRecord>(
                                                                                    stream: TasksPreProntasRecord.getDocument(columnTasksRecord.taskPrePronta!),
                                                                                    builder: (context, snapshot) {
                                                                                      // Customize what your widget looks like when it's loading.
                                                                                      if (!snapshot.hasData) {
                                                                                        return Center(
                                                                                          child: SizedBox(
                                                                                            width: 50.0,
                                                                                            height: 50.0,
                                                                                            child: SpinKitPulse(
                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                              size: 50.0,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      }

                                                                                      final textTasksPreProntasRecord = snapshot.data!;

                                                                                      return Text(
                                                                                        textTasksPreProntasRecord.descricao,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              font: GoogleFonts.poppins(
                                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 8.0,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                                                                                  child: Container(
                                                                                    width: MediaQuery.sizeOf(context).width * 0.4,
                                                                                    height: 30.0,
                                                                                    decoration: BoxDecoration(),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 14.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Align(
                                                                                            alignment: AlignmentDirectional(1.0, 1.0),
                                                                                            child: InkWell(
                                                                                              splashColor: Colors.transparent,
                                                                                              focusColor: Colors.transparent,
                                                                                              hoverColor: Colors.transparent,
                                                                                              highlightColor: Colors.transparent,
                                                                                              onTap: () async {
                                                                                                logFirebaseEvent('CURRENT_TASKS_Container_yv8tbs7k_ON_TAP');
                                                                                                if (!columnTasksRecord.acceptRenegociate && (columnTasksRecord.usuarioQueAceitouaTask != null)) {
                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    FinalRequestTaskWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'taskdo': serializeParam(
                                                                                                        columnTasksRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                } else if (columnTasksRecord.usuarioQueAceitouaTask != null) {
                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    ProgressWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'task': serializeParam(
                                                                                                        columnTasksRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                } else if (columnTasksRecord.status == 'approved') {
                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    LookingTaskerWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'task': serializeParam(
                                                                                                        columnTasksRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                } else {
                                                                                                  logFirebaseEvent('Container_navigate_to');

                                                                                                  context.pushNamed(
                                                                                                    RequestEvaluationWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'task': serializeParam(
                                                                                                        columnTasksRecord.reference,
                                                                                                        ParamType.DocumentReference,
                                                                                                      ),
                                                                                                      'momento': serializeParam(
                                                                                                        'active',
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                }
                                                                                              },
                                                                                              child: Container(
                                                                                                width: 70.0,
                                                                                                height: 40.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  borderRadius: BorderRadius.only(
                                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                                    bottomRight: Radius.circular(5.0),
                                                                                                    topLeft: Radius.circular(5.0),
                                                                                                    topRight: Radius.circular(5.0),
                                                                                                  ),
                                                                                                ),
                                                                                                child: Align(
                                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'View Task',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          font: GoogleFonts.poppins(
                                                                                                            fontWeight: FontWeight.bold,
                                                                                                            fontStyle: FontStyle.italic,
                                                                                                          ),
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FontStyle.italic,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  FutureBuilder<
                                                                      TasksPreProntasRecord>(
                                                                    future: TasksPreProntasRecord.getDocumentOnce(
                                                                        columnTasksRecord
                                                                            .taskPrePronta!),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50.0,
                                                                            height:
                                                                                50.0,
                                                                            child:
                                                                                SpinKitPulse(
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              size: 50.0,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }

                                                                      final progressBarTasksPreProntasRecord =
                                                                          snapshot
                                                                              .data!;

                                                                      return LinearPercentIndicator(
                                                                        percent:
                                                                            valueOrDefault<double>(
                                                                          functions.progressBar(
                                                                              progressBarTasksPreProntasRecord.steps.length,
                                                                              columnTasksRecord.stepsFinalizadas),
                                                                          0.0,
                                                                        ),
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.75,
                                                                        lineHeight:
                                                                            8.0,
                                                                        animation:
                                                                            true,
                                                                        animateFromLastPercent:
                                                                            true,
                                                                        progressColor:
                                                                            FlutterFlowTheme.of(context).tertiary,
                                                                        backgroundColor:
                                                                            Color(0x4098B28E),
                                                                        barRadius:
                                                                            Radius.circular(12.0),
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                      );
                                                                    },
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        8.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        );
                                                      }).divide(SizedBox(
                                                          height: 12.0)),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 16.0)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ).animateOnPageLoad(animationsMap[
                                      'columnOnPageLoadAnimation4']!),
                                ),
                              if (FFAppState().selectedTabName ==
                                  'Messages & Calendar')
                                Flexible(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 40.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 95.0),
                                              child: Container(
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.9,
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0.0, 1.0),
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 1.0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    0.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'My Tasks Calendar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineSmall
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      TasksRecord>>(
                                                                stream:
                                                                    queryTasksRecord(
                                                                  queryBuilder:
                                                                      (tasksRecord) =>
                                                                          tasksRecord
                                                                              .where(
                                                                    'userReference',
                                                                    isEqualTo:
                                                                        currentUserReference,
                                                                  ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50.0,
                                                                        height:
                                                                            50.0,
                                                                        child:
                                                                            SpinKitPulse(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              50.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<TasksRecord>
                                                                      containerTasksRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    height: MediaQuery.sizeOf(context)
                                                                            .height *
                                                                        0.135,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        Container(
                                                                      width: MediaQuery.sizeOf(context)
                                                                              .width *
                                                                          1.0,
                                                                      height: MediaQuery.sizeOf(context)
                                                                              .height *
                                                                          0.08,
                                                                      child: custom_widgets
                                                                          .TimeList30MinHorizontal(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            1.0,
                                                                        height: MediaQuery.sizeOf(context).height *
                                                                            0.08,
                                                                        tasks:
                                                                            containerTasksRecordList,
                                                                        onTimeSelected:
                                                                            (selectedTime) async {},
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              height: 16.0)),
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, -1.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        30.0,
                                                                        16.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text(
                                                                  'Chats',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FontStyle.italic,
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          StreamBuilder<
                                                              List<ChatRecord>>(
                                                            stream:
                                                                queryChatRecord(
                                                              queryBuilder:
                                                                  (chatRecord) =>
                                                                      chatRecord
                                                                          .where(
                                                                'userDocument',
                                                                isEqualTo:
                                                                    currentUserReference,
                                                              ),
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 50.0,
                                                                    height:
                                                                        50.0,
                                                                    child:
                                                                        SpinKitPulse(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          50.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<ChatRecord>
                                                                  containerChatRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final containerVar =
                                                                          containerChatRecordList
                                                                              .toList();
                                                                      if (containerVar
                                                                          .isEmpty) {
                                                                        return NoactivechatsWidget();
                                                                      }

                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: List.generate(
                                                                            containerVar.length,
                                                                            (containerVarIndex) {
                                                                          final containerVarItem =
                                                                              containerVar[containerVarIndex];
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                FutureBuilder<UsersRecord>(
                                                                              future: UsersRecord.getDocumentOnce(containerVarItem.user2Document!),
                                                                              builder: (context, snapshot) {
                                                                                // Customize what your widget looks like when it's loading.
                                                                                if (!snapshot.hasData) {
                                                                                  return Center(
                                                                                    child: SizedBox(
                                                                                      width: 50.0,
                                                                                      height: 50.0,
                                                                                      child: SpinKitPulse(
                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                        size: 50.0,
                                                                                      ),
                                                                                    ),
                                                                                  );
                                                                                }

                                                                                final rowUsersRecord = snapshot.data!;

                                                                                return InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    logFirebaseEvent('CURRENT_TASKS_PAGE_Row_ld0lwe66_ON_TAP');
                                                                                    logFirebaseEvent('Row_navigate_to');

                                                                                    context.pushNamed(
                                                                                      ChatWidget.routeName,
                                                                                      queryParameters: {
                                                                                        'chat': serializeParam(
                                                                                          containerVarItem.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                    );
                                                                                  },
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Container(
                                                                                        width: 40.0,
                                                                                        height: 40.0,
                                                                                        decoration: BoxDecoration(
                                                                                          color: Color(0xFFF0F0F0),
                                                                                          image: DecorationImage(
                                                                                            fit: BoxFit.cover,
                                                                                            image: Image.network(
                                                                                              rowUsersRecord.photoUrl,
                                                                                            ).image,
                                                                                          ),
                                                                                          shape: BoxShape.circle,
                                                                                        ),
                                                                                      ),
                                                                                      Flexible(
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Flexible(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        rowUsersRecord.displayName,
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              font: GoogleFonts.poppins(
                                                                                                                fontWeight: FontWeight.bold,
                                                                                                                fontStyle: FontStyle.italic,
                                                                                                              ),
                                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.bold,
                                                                                                              fontStyle: FontStyle.italic,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                                      children: [
                                                                                                        Icon(
                                                                                                          Icons.star,
                                                                                                          color: Color(0xFFFFC107),
                                                                                                          size: 16.0,
                                                                                                        ),
                                                                                                        Text(
                                                                                                          '4.8',
                                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                font: GoogleFonts.poppins(
                                                                                                                  fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                  fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                                ),
                                                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                                fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 4.0)),
                                                                                                    ),
                                                                                                    Text(
                                                                                                      '5/2 reviews',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            font: GoogleFonts.poppins(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 12.0)),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 12.0)),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(-1.0, -1.0),
                                                                                                  child: Text(
                                                                                                    'Task',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FontWeight.w500,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                      color: Color(0xFF6B9080),
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w500,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                      shadows: [
                                                                                                        Shadow(
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          offset: Offset(0.4, 0.4),
                                                                                                          blurRadius: 0.0,
                                                                                                        )
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                FutureBuilder<TasksRecord>(
                                                                                                  future: TasksRecord.getDocumentOnce(containerVarItem.referenceTask!),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 50.0,
                                                                                                          height: 50.0,
                                                                                                          child: SpinKitPulse(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 50.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }

                                                                                                    final textTasksRecord = snapshot.data!;

                                                                                                    return Text(
                                                                                                      textTasksRecord.titulo,
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            font: GoogleFonts.poppins(
                                                                                                              fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                              fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                            ),
                                                                                                            color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FlutterFlowTheme.of(context).bodySmall.fontWeight,
                                                                                                            fontStyle: FlutterFlowTheme.of(context).bodySmall.fontStyle,
                                                                                                          ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 4.0)),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ),
                                                                          );
                                                                        }).divide(SizedBox(
                                                                            height:
                                                                                20.0)),
                                                                      );
                                                                    },
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 12.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation5']!),
                                    ),
                                  ),
                                ),
                              if (FFAppState().selectedTabName ==
                                  'Completed Tasks')
                                Expanded(
                                  child: Align(
                                    alignment: AlignmentDirectional(0.0, -1.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            SingleChildScrollView(
                                              primary: false,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 14.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        StreamBuilder<
                                                            List<TasksRecord>>(
                                                          stream:
                                                              queryTasksRecord(
                                                            queryBuilder:
                                                                (tasksRecord) =>
                                                                    tasksRecord
                                                                        .where(
                                                                          'userReference',
                                                                          isEqualTo:
                                                                              currentUserReference,
                                                                        )
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo:
                                                                              'completed',
                                                                        ),
                                                            singleRecord: true,
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 50.0,
                                                                  height: 50.0,
                                                                  child:
                                                                      SpinKitPulse(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    size: 50.0,
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TasksRecord>
                                                                textTasksRecordList =
                                                                snapshot.data!;
                                                            // Return an empty Container when the item does not exist.
                                                            if (snapshot.data!
                                                                .isEmpty) {
                                                              return Container();
                                                            }
                                                            final textTasksRecord =
                                                                textTasksRecordList
                                                                        .isNotEmpty
                                                                    ? textTasksRecordList
                                                                        .first
                                                                    : null;

                                                            return Text(
                                                              'Completed Tasks',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle:
                                                                          FontStyle
                                                                              .italic,
                                                                    ),
                                                                    fontSize:
                                                                        24.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                  ),
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(16.0, 0.0,
                                                                16.0, 0.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(),
                                                        ),
                                                      ].divide(SizedBox(
                                                          height: 16.0)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            StreamBuilder<List<TasksRecord>>(
                                              stream: queryTasksRecord(
                                                queryBuilder: (tasksRecord) =>
                                                    tasksRecord
                                                        .where(
                                                          'userReference',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'status',
                                                          isEqualTo:
                                                              'completed',
                                                        ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<TasksRecord>
                                                    containerTasksRecordList =
                                                    snapshot.data!;

                                                return Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(18.0, 0.0,
                                                                0.0, 0.0),
                                                    child: FutureBuilder<int>(
                                                      future:
                                                          queryTasksRecordCount(
                                                        queryBuilder:
                                                            (tasksRecord) =>
                                                                tasksRecord
                                                                    .where(
                                                                      'userReference',
                                                                      isEqualTo:
                                                                          currentUserReference,
                                                                    )
                                                                    .where(
                                                                      'status',
                                                                      isEqualTo:
                                                                          'completed',
                                                                    ),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
                                                          return Center(
                                                            child: SizedBox(
                                                              width: 50.0,
                                                              height: 50.0,
                                                              child:
                                                                  SpinKitPulse(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                                size: 50.0,
                                                              ),
                                                            ),
                                                          );
                                                        }
                                                        int rowCount =
                                                            snapshot.data!;

                                                        return SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              if (containerTasksRecordList
                                                                  .isNotEmpty)
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 90.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Total Tasks',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            rowCount.toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 50.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if (containerTasksRecordList
                                                                  .isNotEmpty)
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            4.0,
                                                                            10.0,
                                                                            4.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Task to Prize',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          '15',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 50.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              if ((currentUserDocument
                                                                          ?.mostOrded
                                                                          .toList() ??
                                                                      [])
                                                                  .isNotEmpty)
                                                                Container(
                                                                  width: 100.0,
                                                                  height: 90.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                      bottomLeft:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      bottomRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                              14.0),
                                                                      topRight:
                                                                          Radius.circular(
                                                                              14.0),
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            5.0,
                                                                            0.0,
                                                                            5.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Text(
                                                                          'Most Ordered\ncategory',
                                                                          textAlign:
                                                                              TextAlign.center,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          functions
                                                                              .retorneAstringmaisadicionada((currentUserDocument?.mostOrded.toList() ?? []).toList()),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                            StreamBuilder<List<TasksRecord>>(
                                              stream: queryTasksRecord(
                                                queryBuilder: (tasksRecord) =>
                                                    tasksRecord
                                                        .where(
                                                          'userReference',
                                                          isEqualTo:
                                                              currentUserReference,
                                                        )
                                                        .where(
                                                          'status',
                                                          isEqualTo:
                                                              'completed',
                                                        ),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: SpinKitPulse(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        size: 50.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<TasksRecord>
                                                    columnTasksRecordList =
                                                    snapshot.data!;
                                                if (columnTasksRecordList
                                                    .isEmpty) {
                                                  return NoactivechatsCopyWidget();
                                                }

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: List.generate(
                                                      columnTasksRecordList
                                                          .length,
                                                      (columnIndex) {
                                                    final columnTasksRecord =
                                                        columnTasksRecordList[
                                                            columnIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        14.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          45.0,
                                                                      height:
                                                                          38.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.only(
                                                                          bottomLeft:
                                                                              Radius.circular(12.0),
                                                                          bottomRight:
                                                                              Radius.circular(12.0),
                                                                          topLeft:
                                                                              Radius.circular(12.0),
                                                                          topRight:
                                                                              Radius.circular(12.0),
                                                                        ),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          width:
                                                                              3.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Align(
                                                                        alignment: AlignmentDirectional(
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            functions.indexList1(columnIndex.toString()).toString(),
                                                                            '1',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                color: Colors.white,
                                                                                fontSize: 22.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment: AlignmentDirectional(
                                                                          -1.0,
                                                                          -1.0),
                                                                      child:
                                                                          Text(
                                                                        'Info',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                          font:
                                                                              GoogleFonts.poppins(
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                          color:
                                                                              Color(0xFF6B9080),
                                                                          fontSize:
                                                                              14.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          fontStyle:
                                                                              FontStyle.italic,
                                                                          shadows: [
                                                                            Shadow(
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              offset: Offset(0.4, 0.4),
                                                                              blurRadius: 0.0,
                                                                            )
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Flexible(
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Text(
                                                                          columnTasksRecord
                                                                              .categoria,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w800,
                                                                                  fontStyle: FontStyle.italic,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w800,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            6.0,
                                                                            0.0,
                                                                            0.0,
                                                                            8.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              0.5,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(columnTasksRecord.usuarioQueAceitouaTask!),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
                                                                            return Center(
                                                                              child: SizedBox(
                                                                                width: 50.0,
                                                                                height: 50.0,
                                                                                child: SpinKitPulse(
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                  size: 50.0,
                                                                                ),
                                                                              ),
                                                                            );
                                                                          }

                                                                          final rowUsersRecord =
                                                                              snapshot.data!;

                                                                          return Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.end,
                                                                            children:
                                                                                [
                                                                              Container(
                                                                                width: 20.0,
                                                                                height: 20.0,
                                                                                clipBehavior: Clip.antiAlias,
                                                                                decoration: BoxDecoration(
                                                                                  shape: BoxShape.circle,
                                                                                ),
                                                                                child: Image.network(
                                                                                  rowUsersRecord.photoUrl,
                                                                                  fit: BoxFit.cover,
                                                                                ),
                                                                              ),
                                                                              Text(
                                                                                rowUsersRecord.displayName,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FontWeight.w500,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 6.0)),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StreamBuilder<
                                                                    List<
                                                                        ChatRecord>>(
                                                                  stream:
                                                                      queryChatRecord(
                                                                    queryBuilder:
                                                                        (chatRecord) =>
                                                                            chatRecord.where(
                                                                      'referenceTask',
                                                                      isEqualTo:
                                                                          columnTasksRecord
                                                                              .reference,
                                                                    ),
                                                                    singleRecord:
                                                                        true,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              50.0,
                                                                          child:
                                                                              SpinKitPulse(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            size:
                                                                                50.0,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    List<ChatRecord>
                                                                        containerChatRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    final containerChatRecord = containerChatRecordList
                                                                            .isNotEmpty
                                                                        ? containerChatRecordList
                                                                            .first
                                                                        : null;

                                                                    return InkWell(
                                                                      splashColor:
                                                                          Colors
                                                                              .transparent,
                                                                      focusColor:
                                                                          Colors
                                                                              .transparent,
                                                                      hoverColor:
                                                                          Colors
                                                                              .transparent,
                                                                      highlightColor:
                                                                          Colors
                                                                              .transparent,
                                                                      onTap:
                                                                          () async {
                                                                        logFirebaseEvent(
                                                                            'CURRENT_TASKS_Container_lmhgrkc9_ON_TAP');
                                                                        logFirebaseEvent(
                                                                            'Container_trigger_push_notification');
                                                                        triggerPushNotification(
                                                                          notificationTitle:
                                                                              'New request to perform a task!',
                                                                          notificationText:
                                                                              '${currentUserDisplayName} asked you again to perform the ${columnTasksRecord.titulo} task, go to the app to accept.',
                                                                          notificationSound:
                                                                              'default',
                                                                          userRefs: [
                                                                            columnTasksRecord.usuarioQueAceitouaTask!
                                                                          ],
                                                                          initialPageName:
                                                                              'ChatTasker',
                                                                          parameterData: {
                                                                            'chat':
                                                                                containerChatRecord?.reference,
                                                                          },
                                                                        );
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');
                                                                        _model.pretasksrpotnas =
                                                                            await TasksPreProntasRecord.getDocumentOnce(columnTasksRecord.taskPrePronta!);
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        var tasksRecordReference = TasksRecord
                                                                            .collection
                                                                            .doc();
                                                                        await tasksRecordReference
                                                                            .set({
                                                                          ...createTasksRecordData(
                                                                            titulo:
                                                                                columnTasksRecord.titulo,
                                                                            descricao:
                                                                                columnTasksRecord.descricao,
                                                                            categoria:
                                                                                columnTasksRecord.categoria,
                                                                            materiaisNecessarios:
                                                                                columnTasksRecord.materiaisNecessarios,
                                                                            userReference:
                                                                                currentUserReference,
                                                                            tempo:
                                                                                getCurrentTimestamp,
                                                                            data:
                                                                                getCurrentTimestamp,
                                                                            status:
                                                                                'notPaid',
                                                                            location:
                                                                                columnTasksRecord.location,
                                                                            datadecriacaodatask:
                                                                                getCurrentTimestamp,
                                                                            fastpass:
                                                                                columnTasksRecord.fastpass,
                                                                            taskPrePronta:
                                                                                columnTasksRecord.taskPrePronta,
                                                                            usuarioQueAceitouaTask:
                                                                                columnTasksRecord.usuarioQueAceitouaTask,
                                                                            orderAgain:
                                                                                true,
                                                                            valor:
                                                                                columnTasksRecord.valor,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'Foto': columnTasksRecord.foto,
                                                                            },
                                                                          ),
                                                                        });
                                                                        _model.newTaskref =
                                                                            TasksRecord.getDocumentFromData({
                                                                          ...createTasksRecordData(
                                                                            titulo:
                                                                                columnTasksRecord.titulo,
                                                                            descricao:
                                                                                columnTasksRecord.descricao,
                                                                            categoria:
                                                                                columnTasksRecord.categoria,
                                                                            materiaisNecessarios:
                                                                                columnTasksRecord.materiaisNecessarios,
                                                                            userReference:
                                                                                currentUserReference,
                                                                            tempo:
                                                                                getCurrentTimestamp,
                                                                            data:
                                                                                getCurrentTimestamp,
                                                                            status:
                                                                                'notPaid',
                                                                            location:
                                                                                columnTasksRecord.location,
                                                                            datadecriacaodatask:
                                                                                getCurrentTimestamp,
                                                                            fastpass:
                                                                                columnTasksRecord.fastpass,
                                                                            taskPrePronta:
                                                                                columnTasksRecord.taskPrePronta,
                                                                            usuarioQueAceitouaTask:
                                                                                columnTasksRecord.usuarioQueAceitouaTask,
                                                                            orderAgain:
                                                                                true,
                                                                            valor:
                                                                                columnTasksRecord.valor,
                                                                          ),
                                                                          ...mapToFirestore(
                                                                            {
                                                                              'Foto': columnTasksRecord.foto,
                                                                            },
                                                                          ),
                                                                        }, tasksRecordReference);
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        await containerChatRecord!
                                                                            .reference
                                                                            .update(createChatRecordData(
                                                                          taskRefOrderAgain: _model
                                                                              .newTaskref
                                                                              ?.reference,
                                                                        ));
                                                                        logFirebaseEvent(
                                                                            'Container_backend_call');

                                                                        await ChatHistoryRecord.createDoc(containerChatRecord.reference)
                                                                            .set(createChatHistoryRecordData(
                                                                          msg:
                                                                              '${currentUserDisplayName} would like you to perform the ${columnTasksRecord.titulo} task again for him.',
                                                                          orderAgain:
                                                                              true,
                                                                        ));

                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            79.0,
                                                                        height:
                                                                            54.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            bottomLeft:
                                                                                Radius.circular(16.0),
                                                                            bottomRight:
                                                                                Radius.circular(16.0),
                                                                            topLeft:
                                                                                Radius.circular(16.0),
                                                                            topRight:
                                                                                Radius.circular(16.0),
                                                                          ),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).tertiary,
                                                                            width:
                                                                                3.0,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                14.0,
                                                                                0.0,
                                                                                0.0,
                                                                                0.0),
                                                                            child:
                                                                                Text(
                                                                              'Order Again',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FontWeight.w500,
                                                                                      fontStyle: FontStyle.italic,
                                                                                    ),
                                                                                    color: Colors.white,
                                                                                    fontSize: 16.0,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w500,
                                                                                    fontStyle: FontStyle.italic,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                ),
                                                              ].divide(SizedBox(
                                                                  width: 12.0)),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 190.0,
                                                            height: 0.7,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    );
                                                  }),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      ).animateOnPageLoad(animationsMap[
                                          'columnOnPageLoadAnimation6']!),
                                    ),
                                  ),
                                ),
                              Align(
                                alignment: AlignmentDirectional(1.0, 0.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 4.0, 0.0),
                                  child: Container(
                                    width: 35.0,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.64,
                                    child: Stack(
                                      children: [
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Container(
                                            width: 45.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            decoration: BoxDecoration(
                                              color: () {
                                                if (FFAppState()
                                                        .selectedTabName ==
                                                    'Active Tasks') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .secondary;
                                                } else if (FFAppState()
                                                        .selectedTabName ==
                                                    'Completed Tasks') {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .tertiary;
                                                } else {
                                                  return FlutterFlowTheme.of(
                                                          context)
                                                      .primary;
                                                }
                                              }(),
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                        Align(
                                          alignment:
                                              AlignmentDirectional(1.0, -1.0),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 18.0, 0.0, 0.0),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 12.0,
                                                      ),
                                                      Icon(
                                                        Icons.circle,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 12.0,
                                                      ),
                                                    ].divide(
                                                        SizedBox(height: 8.0)),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 10.0,
                                                                4.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CURRENT_TASKS_PAGE_StackActive_ON_TAP');
                                                        logFirebaseEvent(
                                                            'StackActive_widget_animation');
                                                        if (animationsMap[
                                                                'stackOnActionTriggerAnimation4'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasStackTriggered4 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'stackOnActionTriggerAnimation4']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        logFirebaseEvent(
                                                            'StackActive_update_app_state');
                                                        FFAppState()
                                                                .selectedTabName =
                                                            'Active Tasks';
                                                        FFAppState()
                                                            .update(() {});
                                                      },
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        children: [
                                                          if (FFAppState()
                                                                  .selectedTabName ==
                                                              'Active Tasks')
                                                            Container(
                                                              width: 40.0,
                                                              height: 120.0,
                                                              child: custom_widgets
                                                                  .VerticalOvalTab(
                                                                width: 40.0,
                                                                height: 120.0,
                                                                isSelected:
                                                                    true,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                inactiveColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 90.0,
                                                              child: custom_widgets
                                                                  .RotatedTaskTexts(
                                                                width: 50.0,
                                                                height: 90.0,
                                                                text:
                                                                    'Active Tasks',
                                                                cor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'stackOnActionTriggerAnimation4']!,
                                                        hasBeenTriggered:
                                                            hasStackTriggered4),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CURRENT_TASKS_PAGE_StackMensages_ON_TAP');
                                                        logFirebaseEvent(
                                                            'StackMensages_widget_animation');
                                                        if (animationsMap[
                                                                'stackOnActionTriggerAnimation5'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasStackTriggered5 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'stackOnActionTriggerAnimation5']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        logFirebaseEvent(
                                                            'StackMensages_update_app_state');
                                                        FFAppState()
                                                                .selectedTabName =
                                                            'Messages & Calendar';
                                                        safeSetState(() {});
                                                      },
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        children: [
                                                          if ((String var1) {
                                                            return var1 ==
                                                                'Messages & Calendar';
                                                          }(FFAppState()
                                                              .selectedTabName))
                                                            Container(
                                                              width: 40.0,
                                                              height: 185.0,
                                                              child: custom_widgets
                                                                  .VerticalOvalTab(
                                                                width: 40.0,
                                                                height: 185.0,
                                                                isSelected:
                                                                    true,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                inactiveColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          1.0,
                                                                          0.0),
                                                              child: Container(
                                                                width: 50.0,
                                                                height: 170.0,
                                                                child: custom_widgets
                                                                    .RotatedTaskTexts(
                                                                  width: 50.0,
                                                                  height: 170.0,
                                                                  text:
                                                                      'Messages & Calendar',
                                                                  cor: (String
                                                                          var1) {
                                                                    return var1 ==
                                                                        'Messages & Calendar';
                                                                  }(FFAppState()
                                                                          .selectedTabName)
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'stackOnActionTriggerAnimation5']!,
                                                        hasBeenTriggered:
                                                            hasStackTriggered5),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1.0, 0.0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(4.0, 0.0,
                                                                4.0, 0.0),
                                                    child: InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        logFirebaseEvent(
                                                            'CURRENT_TASKS_StackCompletTask_ON_TAP');
                                                        logFirebaseEvent(
                                                            'StackCompletTask_widget_animation');
                                                        if (animationsMap[
                                                                'stackOnActionTriggerAnimation6'] !=
                                                            null) {
                                                          safeSetState(() =>
                                                              hasStackTriggered6 =
                                                                  true);
                                                          SchedulerBinding
                                                              .instance
                                                              .addPostFrameCallback((_) async =>
                                                                  await animationsMap[
                                                                          'stackOnActionTriggerAnimation6']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                        }
                                                        logFirebaseEvent(
                                                            'StackCompletTask_update_app_state');
                                                        FFAppState()
                                                                .selectedTabName =
                                                            'Completed Tasks';
                                                        safeSetState(() {});
                                                      },
                                                      child: Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                -1.0, 0.0),
                                                        children: [
                                                          if (FFAppState()
                                                                  .selectedTabName ==
                                                              'Completed Tasks')
                                                            Container(
                                                              width: 40.0,
                                                              height: 160.0,
                                                              child: custom_widgets
                                                                  .VerticalOvalTab(
                                                                width: 40.0,
                                                                height: 160.0,
                                                                isSelected:
                                                                    true,
                                                                activeColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                inactiveColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                borderWidth:
                                                                    2.0,
                                                              ),
                                                            ),
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, 0.0),
                                                            child: Container(
                                                              width: 50.0,
                                                              height: 130.0,
                                                              child: custom_widgets
                                                                  .RotatedTaskTexts(
                                                                width: 50.0,
                                                                height: 130.0,
                                                                text:
                                                                    'Completed Tasks',
                                                                cor: FFAppState()
                                                                            .selectedTabName ==
                                                                        'Completed Tasks'
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ).animateOnActionTrigger(
                                                        animationsMap[
                                                            'stackOnActionTriggerAnimation6']!,
                                                        hasBeenTriggered:
                                                            hasStackTriggered6),
                                                  ),
                                                ),
                                              ].divide(SizedBox(height: 10.0)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Container(
                            height: 70.0,
                            child: Stack(
                              children: [
                                wrapWithModel(
                                  model: _model.navBarModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: NavBarWidget(),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if ((FFAppState().selectedTabName ==
                                'Completed Tasks') ||
                            (FFAppState().selectedTabName == 'Active Tasks'))
                          Align(
                            alignment: AlignmentDirectional(-1.07, 0.61),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                logFirebaseEvent(
                                    'CURRENT_TASKS_Container_zrzhygjj_ON_TAP');
                                logFirebaseEvent('Container_navigate_to');

                                context.pushNamed(SelectTaskWidget.routeName);
                              },
                              child: Container(
                                width: 160.0,
                                height: 36.0,
                                decoration: BoxDecoration(
                                  color: FFAppState().selectedTabName ==
                                          'Completed Tasks'
                                      ? FlutterFlowTheme.of(context).primary
                                      : FlutterFlowTheme.of(context).secondary,
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(0.0),
                                    bottomRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(0.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                ),
                                child: Align(
                                  alignment: AlignmentDirectional(0.0, 0.0),
                                  child: Text(
                                    'Create New Task',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight: FontWeight.bold,
                                            fontStyle: FontStyle.italic,
                                          ),
                                          fontSize: 16.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TutorialCoachMark createPageWalkthrough(BuildContext context) =>
      TutorialCoachMark(
        targets: createWalkthroughTargets(context),
        onFinish: () async {
          safeSetState(() => _model.currentTaskHelpController = null);
        },
        onSkip: () {
          return true;
        },
      );
}
