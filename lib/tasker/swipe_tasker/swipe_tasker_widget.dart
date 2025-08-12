import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/push_notifications/push_notifications_util.dart';
import '/components/card_swipead_widget.dart';
import '/components/endereco_widget.dart';
import '/components/filterdistancetask_widget.dart';
import '/components/filterpricetask_widget.dart';
import '/components/filtertasks_widget.dart';
import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/components/notasksavaliate_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/permissions_util.dart';
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'swipe_tasker_model.dart';
export 'swipe_tasker_model.dart';

class SwipeTaskerWidget extends StatefulWidget {
  const SwipeTaskerWidget({super.key});

  static String routeName = 'swipeTasker';
  static String routePath = '/FinalRequestTaskCopy';

  @override
  State<SwipeTaskerWidget> createState() => _SwipeTaskerWidgetState();
}

class _SwipeTaskerWidgetState extends State<SwipeTaskerWidget>
    with TickerProviderStateMixin {
  late SwipeTaskerModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SwipeTaskerModel());

    logFirebaseEvent('screen_view', parameters: {'screen_name': 'swipeTasker'});
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      logFirebaseEvent('SWIPE_TASKER_swipeTasker_ON_INIT_STATE');
      if (currentUserDocument?.location == null) {
        logFirebaseEvent('swipeTasker_request_permissions');
        await requestPermission(locationPermission);
        logFirebaseEvent('swipeTasker_request_permissions');
        await requestPermission(notificationsPermission);
        logFirebaseEvent('swipeTasker_bottom_sheet');
        await showModalBottomSheet(
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          enableDrag: false,
          context: context,
          builder: (context) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Padding(
                padding: MediaQuery.viewInsetsOf(context),
                child: EnderecoWidget(),
              ),
            );
          },
        ).then((value) => safeSetState(() {}));
      }
      if (_model.swipeTask != null) {
        logFirebaseEvent('swipeTasker_backend_call');

        await _model.swipeTask!.update({
          ...mapToFirestore(
            {
              'viewes': FieldValue.increment(1),
            },
          ),
        });
      }
    });

    _model.textController1 ??= TextEditingController();
    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textController2 ??= TextEditingController();
    _model.textFieldFocusNode2 ??= FocusNode();

    animationsMap.addAll({
      'containerOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.linear,
            delay: 0.0.ms,
            duration: 700.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 730.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 730.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 730.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'columnOnPageLoadAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 730.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });

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
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor:
              valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                  ? FlutterFlowTheme.of(context).primaryBackground
                  : FlutterFlowTheme.of(context).secondaryBackground,
          body: Stack(
            children: [
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Tasker')
                Stack(
                  children: [
                    StreamBuilder<List<ComunitysRecord>>(
                      stream: queryComunitysRecord(
                        queryBuilder: (comunitysRecord) =>
                            comunitysRecord.where(
                          'comunityName',
                          isEqualTo: valueOrDefault(
                              currentUserDocument?.comunnity, ''),
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
                                color: FlutterFlowTheme.of(context).primary,
                                size: 50.0,
                              ),
                            ),
                          );
                        }
                        List<ComunitysRecord> containerComunitysRecordList =
                            snapshot.data!;

                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 110.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                StreamBuilder<List<TasksRecord>>(
                                  stream: queryTasksRecord(
                                    queryBuilder: (tasksRecord) => tasksRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'approved',
                                        )
                                        .where(
                                          'aceito',
                                          isEqualTo: false,
                                        )
                                        .where(
                                          'userReference',
                                          isNotEqualTo: currentUserReference,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 50.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<TasksRecord> containerTasksRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.8,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                      ),
                                      child: Stack(
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    18.0, 0.0, 18.0, 0.0),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.76,
                                              child: custom_widgets
                                                  .FlutterTaskSwiper(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.76,
                                                tasks: functions.buscarRegiao(
                                                    containerTasksRecordList
                                                        .toList(),
                                                    currentUserDocument!
                                                        .location!,
                                                    valueOrDefault<double>(
                                                      FFAppState().distance,
                                                      30.0,
                                                    ),
                                                    containerComunitysRecordList
                                                        .map((e) =>
                                                            e.locationComunity)
                                                        .withoutNulls
                                                        .toList(),
                                                    FFAppState()
                                                        .priceFilterDouble,
                                                    FFAppState()
                                                        .filtercategory)!,
                                                onSelectableButton:
                                                    (buttonPressioned,
                                                        taskRef) async {
                                                  logFirebaseEvent(
                                                      'SWIPE_TASKER_Container_s4rrq7i4_CALLBACK');
                                                  if (buttonPressioned ==
                                                      'confirm') {
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');
                                                    _model.taskref =
                                                        await TasksRecord
                                                            .getDocumentOnce(
                                                                taskRef);
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    var chatRecordReference =
                                                        ChatRecord.collection
                                                            .doc();
                                                    await chatRecordReference
                                                        .set(
                                                            createChatRecordData(
                                                      user2Document:
                                                          currentUserReference,
                                                      referenceTask: taskRef,
                                                      ultimaMsg:
                                                          getCurrentTimestamp,
                                                      userDocument: _model
                                                          .taskref
                                                          ?.userReference,
                                                    ));
                                                    _model.chat = ChatRecord
                                                        .getDocumentFromData(
                                                            createChatRecordData(
                                                              user2Document:
                                                                  currentUserReference,
                                                              referenceTask:
                                                                  taskRef,
                                                              ultimaMsg:
                                                                  getCurrentTimestamp,
                                                              userDocument: _model
                                                                  .taskref
                                                                  ?.userReference,
                                                            ),
                                                            chatRecordReference);
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    await ChatHistoryRecord
                                                            .createDoc(_model
                                                                .chat!
                                                                .reference)
                                                        .set(
                                                            createChatHistoryRecordData(
                                                      msg:
                                                          '${currentUserDisplayName} accept task.',
                                                      horario:
                                                          getCurrentTimestamp,
                                                      msgdosystema: true,
                                                    ));
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_backend_call');

                                                    await taskRef.update(
                                                        createTasksRecordData(
                                                      usuarioQueAceitouaTask:
                                                          currentUserReference,
                                                      aceito: true,
                                                      dataqueaceitou:
                                                          getCurrentTimestamp,
                                                    ));
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_update_page_state');
                                                    _model.swipeTask = taskRef;
                                                    safeSetState(() {});
                                                    logFirebaseEvent(
                                                        'FlutterTaskSwiper_trigger_push_notificat');
                                                    triggerPushNotification(
                                                      notificationTitle:
                                                          'Your task has been accepted!',
                                                      notificationText:
                                                          '${currentUserDisplayName} agreed to carry out your task, enter the app to chat and see the progress of the task.',
                                                      notificationImageUrl:
                                                          _model.taskref?.foto
                                                              .firstOrNull,
                                                      notificationSound:
                                                          'default',
                                                      userRefs: [
                                                        _model.taskref!
                                                            .userReference!
                                                      ],
                                                      initialPageName:
                                                          'currentTasks',
                                                      parameterData: {},
                                                    );
                                                  } else if (buttonPressioned ==
                                                      'reject') {}

                                                  safeSetState(() {});
                                                },
                                                notasksdisponiveis: () =>
                                                    NotasksavaliateWidget(),
                                                visualSwipe:
                                                    (DocumentReference task) =>
                                                        CardSwipeadWidget(
                                                  tasks: task,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ].divide(SizedBox(height: 20.0)),
                            ),
                          ),
                        ).animateOnPageLoad(
                            animationsMap['containerOnPageLoadAnimation']!);
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                      child: Container(
                        width: double.infinity,
                        height: 120.0,
                        decoration: BoxDecoration(),
                        child: Stack(
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, 0.0),
                                        child: Icon(
                                          Icons.sort_outlined,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          size: 24.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SWIPE_TASKER_Container_xplu4c9m_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FiltertasksWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: FFAppState().filtercategory !=
                                                    ''
                                            ? FlutterFlowTheme.of(context)
                                                .tertiary
                                            : FlutterFlowTheme.of(context)
                                                .alternate,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            4.0, 0.0, 4.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Text(
                                                FFAppState()
                                                                .filtercategory !=
                                                            ''
                                                    ? FFAppState()
                                                        .filtercategory
                                                    : 'All Tasks',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyMedium
                                                    .override(
                                                      font: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .primaryBackground,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SWIPE_TASKER_Container_fxy8g1e3_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FilterdistancetaskWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 104.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          FFAppState().distance.toString() !=
                                                  '0'
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Distance',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      logFirebaseEvent(
                                          'SWIPE_TASKER_Container_l8jbspbk_ON_TAP');
                                      logFirebaseEvent(
                                          'Container_bottom_sheet');
                                      await showModalBottomSheet(
                                        isScrollControlled: true,
                                        backgroundColor: Colors.transparent,
                                        enableDrag: false,
                                        context: context,
                                        builder: (context) {
                                          return GestureDetector(
                                            onTap: () {
                                              FocusScope.of(context).unfocus();
                                              FocusManager.instance.primaryFocus
                                                  ?.unfocus();
                                            },
                                            child: Padding(
                                              padding: MediaQuery.viewInsetsOf(
                                                  context),
                                              child: FilterpricetaskWidget(),
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(() {}));
                                    },
                                    child: Container(
                                      width: 104.0,
                                      height: 28.0,
                                      decoration: BoxDecoration(
                                        color: valueOrDefault<Color>(
                                          FFAppState()
                                                      .priceFilterDouble
                                                      .toString() !=
                                                  '0'
                                              ? FlutterFlowTheme.of(context)
                                                  .tertiary
                                              : FlutterFlowTheme.of(context)
                                                  .alternate,
                                          FlutterFlowTheme.of(context)
                                              .alternate,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0),
                                          topLeft: Radius.circular(5.0),
                                          topRight: Radius.circular(5.0),
                                        ),
                                      ),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(0.0, 0.0),
                                        child: Text(
                                          'Price',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                font: GoogleFonts.poppins(
                                                  fontWeight: FontWeight.w300,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .fontStyle,
                                                ),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .fontStyle,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]
                                    .divide(SizedBox(width: 12.0))
                                    .addToStart(SizedBox(width: 12.0))
                                    .addToEnd(SizedBox(width: 12.0)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.0,
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: wrapWithModel(
                                model: _model.navBarCopyModel,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBarCopyWidget(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              if (valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                  'Taskee')
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    children: [
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: Container(
                          width: MediaQuery.sizeOf(context).width * 1.0,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    14.0, 0.0, 14.0, 0.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [],
                                ),
                              ),
                              wrapWithModel(
                                model: _model.navBarModel1,
                                updateCallback: () => safeSetState(() {}),
                                child: NavBarWidget(),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        child: Stack(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (FFAppState().selectTaskSeletable ==
                                    'AllTasks')
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'All Taskers',
                                                        style: FlutterFlowTheme
                                                                .of(context)
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
                                                              fontSize: 28.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController1,
                                                          focusNode: _model
                                                              .textFieldFocusNode1,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            hintText:
                                                                'Searching tasks...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .search_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textController1Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons
                                                              .not_listed_location,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          size: 20.0,
                                                        ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Text(
                                                              'Request a quick and easy task from an available Tasker.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 38.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Property & Grounds',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            if (_model
                                                                    .openPage ==
                                                                'Property & Grounds')
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_TASKER_PAGE_Icon_tntx7wix_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_update_page_state');

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronUp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .openPage !=
                                                                'Property & Grounds')
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_TASKER_PAGE_Icon_ly5g1mot_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_update_page_state');

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronDown,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Visibility(
                                                          visible: (_model
                                                                      .openPage ==
                                                                  'All') ||
                                                              (_model.openPage ==
                                                                  'Property & Grounds'),
                                                          child: FutureBuilder<
                                                              List<
                                                                  TasksPreProntasRecord>>(
                                                            future:
                                                                queryTasksPreProntasRecordOnce(
                                                              queryBuilder:
                                                                  (tasksPreProntasRecord) =>
                                                                      tasksPreProntasRecord
                                                                          .where(
                                                                'titulo',
                                                                isEqualTo:
                                                                    'Property & Grounds',
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
                                                              List<TasksPreProntasRecord>
                                                                  columnTasksPreProntasRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    columnTasksPreProntasRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnTasksPreProntasRecord =
                                                                      columnTasksPreProntasRecordList[
                                                                          columnIndex];
                                                                  return FlipCard(
                                                                    fill: Fill
                                                                        .fillBack,
                                                                    direction:
                                                                        FlipDirection
                                                                            .HORIZONTAL,
                                                                    speed: 400,
                                                                    front:
                                                                        Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFFC1C1C1),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                        'https://picsum.photos/seed/468/600',
                                                                                        width: 135.0,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.categoria,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.descricao,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                          child: Text(
                                                                                            'Details in the back',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 10.0,
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 14.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                    child: Icon(
                                                                                                      Icons.favorite,
                                                                                                      color: Color(0xFFDB4B54),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('SWIPE_TASKER_Container_gldftahz_ON_TAP');
                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          ADDPhotoCreateTaskWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'pretasks': serializeParam(
                                                                                                              columnTasksPreProntasRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 64.0,
                                                                                                        height: 20.0,
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
                                                                                                            'Book now',
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 55.0,
                                                                              height: 22.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(5.0),
                                                                                  bottomRight: Radius.circular(5.0),
                                                                                  topLeft: Radius.circular(5.0),
                                                                                  topRight: Radius.circular(5.0),
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(4.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                      '0',
                                                                                    )} Qs',
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
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    back:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                16.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 150.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC1C1C1),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'More About the task',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              '• Wiping surfaces and counters',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('SWIPE_TASKER_Container_uy59kyo6_ON_TAP');
                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                            context.pushNamed(
                                                                                              ADDPhotoCreateTaskWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'pretasks': serializeParam(
                                                                                                  columnTasksPreProntasRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 72.03,
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(15.0),
                                                                                                bottomRight: Radius.circular(15.0),
                                                                                                topLeft: Radius.circular(15.0),
                                                                                                topRight: Radius.circular(15.0),
                                                                                              ),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Book\nNow',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                              child: Container(
                                                                                width: 55.0,
                                                                                height: 22.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                        '0',
                                                                                      )} Qs',
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'columnOnPageLoadAnimation1']!);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    12.0,
                                                                    0.0,
                                                                    12.0,
                                                                    0.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'Concierge ',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                            if (_model
                                                                    .openPage ==
                                                                'Concierge & Errands')
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_TASKER_PAGE_Icon_l7egvvd1_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_update_page_state');

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronDown,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                            if (_model
                                                                    .openPage !=
                                                                'Concierge & Errands')
                                                              InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  logFirebaseEvent(
                                                                      'SWIPE_TASKER_PAGE_Icon_gmod8uzq_ON_TAP');
                                                                  logFirebaseEvent(
                                                                      'Icon_update_page_state');

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: FaIcon(
                                                                  FontAwesomeIcons
                                                                      .chevronDown,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  size: 25.0,
                                                                ),
                                                              ),
                                                          ],
                                                        ),
                                                      ),
                                                      Container(
                                                        child: Visibility(
                                                          visible: (_model
                                                                      .openPage ==
                                                                  'All') ||
                                                              (_model.openPage ==
                                                                  'Concierge & Errands'),
                                                          child: FutureBuilder<
                                                              List<
                                                                  TasksPreProntasRecord>>(
                                                            future:
                                                                queryTasksPreProntasRecordOnce(
                                                              queryBuilder:
                                                                  (tasksPreProntasRecord) =>
                                                                      tasksPreProntasRecord
                                                                          .where(
                                                                'titulo',
                                                                isEqualTo:
                                                                    'Concierge & Errands',
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
                                                              List<TasksPreProntasRecord>
                                                                  columnTasksPreProntasRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    columnTasksPreProntasRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnTasksPreProntasRecord =
                                                                      columnTasksPreProntasRecordList[
                                                                          columnIndex];
                                                                  return FlipCard(
                                                                    fill: Fill
                                                                        .fillBack,
                                                                    direction:
                                                                        FlipDirection
                                                                            .HORIZONTAL,
                                                                    speed: 400,
                                                                    front:
                                                                        Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              16.0,
                                                                              16.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFFC1C1C1),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                        'https://picsum.photos/seed/468/600',
                                                                                        width: 160.0,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.categoria,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.descricao,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                          child: Text(
                                                                                            'Details in the back',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 10.0,
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
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                    child: Icon(
                                                                                                      Icons.favorite,
                                                                                                      color: Color(0xFFDB4B54),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('SWIPE_TASKER_Container_o949ncu7_ON_TAP');
                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          ADDPhotoCreateTaskWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'pretasks': serializeParam(
                                                                                                              columnTasksPreProntasRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 64.0,
                                                                                                        height: 20.0,
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
                                                                                                            'Book now',
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                10.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 55.0,
                                                                              height: 22.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(5.0),
                                                                                  bottomRight: Radius.circular(5.0),
                                                                                  topLeft: Radius.circular(5.0),
                                                                                  topRight: Radius.circular(5.0),
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(4.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                      '0',
                                                                                    )} Qs',
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
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    back:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                16.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 150.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC1C1C1),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'More About the task',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              '• Wiping surfaces and counters',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('SWIPE_TASKER_Container_7z0jr0ds_ON_TAP');
                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                            context.pushNamed(
                                                                                              ADDPhotoCreateTaskWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'pretasks': serializeParam(
                                                                                                  columnTasksPreProntasRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 72.03,
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(15.0),
                                                                                                bottomRight: Radius.circular(15.0),
                                                                                                topLeft: Radius.circular(15.0),
                                                                                                topRight: Radius.circular(15.0),
                                                                                              ),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Book\nNow',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                              child: Container(
                                                                                width: 55.0,
                                                                                height: 22.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                        '0',
                                                                                      )} Qs',
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'columnOnPageLoadAnimation2']!);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 80.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                'Errands',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      fontSize:
                                                                          20.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                              ),
                                                              if (_model
                                                                      .openPage ==
                                                                  'Events & Other')
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SWIPE_TASKER_PAGE_Icon_c8twqge9_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_update_page_state');

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .chevronDown,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              if (_model
                                                                      .openPage !=
                                                                  'Events & Other')
                                                                InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {
                                                                    logFirebaseEvent(
                                                                        'SWIPE_TASKER_PAGE_Icon_9d4wm654_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Icon_update_page_state');

                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child: FaIcon(
                                                                    FontAwesomeIcons
                                                                        .chevronDown,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          child: Visibility(
                                                            visible: (_model
                                                                        .openPage ==
                                                                    'All') ||
                                                                (_model.openPage ==
                                                                    'Events & Other'),
                                                            child: FutureBuilder<
                                                                List<
                                                                    TasksPreProntasRecord>>(
                                                              future:
                                                                  queryTasksPreProntasRecordOnce(
                                                                queryBuilder:
                                                                    (tasksPreProntasRecord) =>
                                                                        tasksPreProntasRecord
                                                                            .where(
                                                                  'titulo',
                                                                  isEqualTo:
                                                                      'Events & Other',
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
                                                                List<TasksPreProntasRecord>
                                                                    columnTasksPreProntasRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List.generate(
                                                                      columnTasksPreProntasRecordList
                                                                          .length,
                                                                      (columnIndex) {
                                                                    final columnTasksPreProntasRecord =
                                                                        columnTasksPreProntasRecordList[
                                                                            columnIndex];
                                                                    return FlipCard(
                                                                      fill: Fill
                                                                          .fillBack,
                                                                      direction:
                                                                          FlipDirection
                                                                              .HORIZONTAL,
                                                                      speed:
                                                                          400,
                                                                      front:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                16.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: MediaQuery.sizeOf(context).width * 1.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC1C1C1),
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
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
                                                                                          'https://picsum.photos/seed/468/600',
                                                                                          width: 160.0,
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 4.0),
                                                                                            child: Text(
                                                                                              columnTasksPreProntasRecord.categoria,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                    ),
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                            child: Text(
                                                                                              columnTasksPreProntasRecord.descricao,
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
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                            child: Text(
                                                                                              'Details in the back',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    fontSize: 10.0,
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
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                      child: Icon(
                                                                                                        Icons.favorite,
                                                                                                        color: Color(0xFFDB4B54),
                                                                                                        size: 18.0,
                                                                                                      ),
                                                                                                    ),
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                      child: InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {
                                                                                                          logFirebaseEvent('SWIPE_TASKER_Container_wswtce8k_ON_TAP');
                                                                                                          logFirebaseEvent('Container_navigate_to');

                                                                                                          context.pushNamed(
                                                                                                            ADDPhotoCreateTaskWidget.routeName,
                                                                                                            queryParameters: {
                                                                                                              'pretasks': serializeParam(
                                                                                                                columnTasksPreProntasRecord.reference,
                                                                                                                ParamType.DocumentReference,
                                                                                                              ),
                                                                                                            }.withoutNulls,
                                                                                                          );
                                                                                                        },
                                                                                                        child: Container(
                                                                                                          width: 64.0,
                                                                                                          height: 20.0,
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
                                                                                                              'Book now',
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
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                              child: Container(
                                                                                width: 55.0,
                                                                                height: 22.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                        '0',
                                                                                      )} Qs',
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      back:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
                                                                              child: Container(
                                                                                width: double.infinity,
                                                                                height: 150.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  boxShadow: [
                                                                                    BoxShadow(
                                                                                      blurRadius: 4.0,
                                                                                      color: Color(0x33000000),
                                                                                      offset: Offset(
                                                                                        0.0,
                                                                                        2.0,
                                                                                      ),
                                                                                    )
                                                                                  ],
                                                                                  borderRadius: BorderRadius.circular(12.0),
                                                                                  border: Border.all(
                                                                                    color: Color(0xFFC1C1C1),
                                                                                    width: 1.0,
                                                                                  ),
                                                                                ),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                            child: Text(
                                                                                              'More About the task',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                    ),
                                                                                                    fontSize: 18.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                          Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                '• Wiping surfaces and counters',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                      ),
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ].divide(SizedBox(height: 4.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          InkWell(
                                                                                            splashColor: Colors.transparent,
                                                                                            focusColor: Colors.transparent,
                                                                                            hoverColor: Colors.transparent,
                                                                                            highlightColor: Colors.transparent,
                                                                                            onTap: () async {
                                                                                              logFirebaseEvent('SWIPE_TASKER_Container_gqv2xz8b_ON_TAP');
                                                                                              logFirebaseEvent('Container_navigate_to');

                                                                                              context.pushNamed(
                                                                                                ADDPhotoCreateTaskWidget.routeName,
                                                                                                queryParameters: {
                                                                                                  'pretasks': serializeParam(
                                                                                                    columnTasksPreProntasRecord.reference,
                                                                                                    ParamType.DocumentReference,
                                                                                                  ),
                                                                                                }.withoutNulls,
                                                                                              );
                                                                                            },
                                                                                            child: Container(
                                                                                              width: 72.03,
                                                                                              height: 50.0,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                                borderRadius: BorderRadius.only(
                                                                                                  bottomLeft: Radius.circular(15.0),
                                                                                                  bottomRight: Radius.circular(15.0),
                                                                                                  topLeft: Radius.circular(15.0),
                                                                                                  topRight: Radius.circular(15.0),
                                                                                                ),
                                                                                              ),
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  'Book\nNow',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        font: GoogleFonts.poppins(
                                                                                                          fontWeight: FontWeight.bold,
                                                                                                          fontStyle: FontStyle.italic,
                                                                                                        ),
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                        lineHeight: 1.0,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Align(
                                                                              alignment: AlignmentDirectional(1.0, -1.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                                child: Container(
                                                                                  width: 55.0,
                                                                                  height: 22.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).tertiary,
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(5.0),
                                                                                      bottomRight: Radius.circular(5.0),
                                                                                      topLeft: Radius.circular(5.0),
                                                                                      topRight: Radius.circular(5.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(4.0),
                                                                                      child: Text(
                                                                                        '${valueOrDefault<String>(
                                                                                          functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                          '0',
                                                                                        )} Qs',
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
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }),
                                                                ).animateOnPageLoad(
                                                                    animationsMap[
                                                                        'columnOnPageLoadAnimation3']!);
                                                              },
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 18.0)),
                                              ),
                                            ),
                                          ].divide(SizedBox(height: 20.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                if (FFAppState().selectTaskSeletable ==
                                    'ProfissionalHelp')
                                  Flexible(
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 60.0, 0.0, 0.0),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, -1.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        16.0, 0.0, 16.0, 0.0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              -1.0, 0.0),
                                                      child: Text(
                                                        'Profissionals Help',
                                                        style: FlutterFlowTheme
                                                                .of(context)
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
                                                              fontSize: 28.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic,
                                                            ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: double.infinity,
                                                      height: 45.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .tertiary,
                                                          width: 2.0,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: 200.0,
                                                        child: TextFormField(
                                                          controller: _model
                                                              .textController2,
                                                          focusNode: _model
                                                              .textFieldFocusNode2,
                                                          autofocus: false,
                                                          obscureText: false,
                                                          decoration:
                                                              InputDecoration(
                                                            isDense: true,
                                                            labelStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            hintText:
                                                                'Searching profissionals...',
                                                            hintStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      font: GoogleFonts
                                                                          .poppins(
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .labelMedium
                                                                            .fontStyle,
                                                                      ),
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontWeight,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelMedium
                                                                          .fontStyle,
                                                                    ),
                                                            enabledBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: Color(
                                                                    0x00000000),
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            errorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            focusedErrorBorder:
                                                                OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .error,
                                                                width: 1.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                            suffixIcon: Icon(
                                                              Icons
                                                                  .search_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                          ),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                font: GoogleFonts
                                                                    .poppins(
                                                                  fontWeight: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontWeight,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                                ),
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontWeight,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                              ),
                                                          cursorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primaryText,
                                                          validator: _model
                                                              .textController2Validator
                                                              .asValidator(
                                                                  context),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                          Icons.verified,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondary,
                                                          size: 20.0,
                                                        ),
                                                        Flexible(
                                                          child: Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    -1.0, -1.0),
                                                            child: Text(
                                                              'Meet our verified professional to get your job done.',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    font: GoogleFonts
                                                                        .poppins(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w300,
                                                                      fontStyle: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .fontStyle,
                                                                    ),
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondary,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 8.0)),
                                                    ),
                                                  ].divide(
                                                      SizedBox(height: 8.0)),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 38.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        child: Visibility(
                                                          visible: (_model
                                                                      .openPage ==
                                                                  'All') ||
                                                              (_model.openPage ==
                                                                  'Property & Grounds'),
                                                          child: FutureBuilder<
                                                              List<
                                                                  TasksPreProntasRecord>>(
                                                            future:
                                                                queryTasksPreProntasRecordOnce(
                                                              queryBuilder:
                                                                  (tasksPreProntasRecord) =>
                                                                      tasksPreProntasRecord
                                                                          .where(
                                                                'titulo',
                                                                isEqualTo:
                                                                    'Property & Grounds',
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
                                                              List<TasksPreProntasRecord>
                                                                  columnTasksPreProntasRecordList =
                                                                  snapshot
                                                                      .data!;

                                                              return Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: List.generate(
                                                                    columnTasksPreProntasRecordList
                                                                        .length,
                                                                    (columnIndex) {
                                                                  final columnTasksPreProntasRecord =
                                                                      columnTasksPreProntasRecordList[
                                                                          columnIndex];
                                                                  return FlipCard(
                                                                    fill: Fill
                                                                        .fillBack,
                                                                    direction:
                                                                        FlipDirection
                                                                            .HORIZONTAL,
                                                                    speed: 400,
                                                                    front:
                                                                        Stack(
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              16.0,
                                                                              8.0,
                                                                              12.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                MediaQuery.sizeOf(context).width * 1.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).alternate,
                                                                              borderRadius: BorderRadius.circular(12.0),
                                                                              border: Border.all(
                                                                                color: Color(0xFFC1C1C1),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                        'https://picsum.photos/seed/468/600',
                                                                                        width: 135.0,
                                                                                        height: 120.0,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.categoria,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 4.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            columnTasksPreProntasRecord.descricao,
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
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                          child: Text(
                                                                                            'Details in the back',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                                  fontSize: 10.0,
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
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(-1.0, 1.0),
                                                                                                    child: Icon(
                                                                                                      Icons.favorite,
                                                                                                      color: Color(0xFFDB4B54),
                                                                                                      size: 18.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                    child: InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {
                                                                                                        logFirebaseEvent('SWIPE_TASKER_Container_579gl941_ON_TAP');
                                                                                                        logFirebaseEvent('Container_navigate_to');

                                                                                                        context.pushNamed(
                                                                                                          ADDPhotoCreateTaskWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'pretasks': serializeParam(
                                                                                                              columnTasksPreProntasRecord.reference,
                                                                                                              ParamType.DocumentReference,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                                      child: Container(
                                                                                                        width: 64.0,
                                                                                                        height: 20.0,
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
                                                                                                            'Book now',
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
                                                                        ),
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              1.0,
                                                                              -1.0),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                10.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: 55.0,
                                                                              height: 22.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                borderRadius: BorderRadius.only(
                                                                                  bottomLeft: Radius.circular(5.0),
                                                                                  bottomRight: Radius.circular(5.0),
                                                                                  topLeft: Radius.circular(5.0),
                                                                                  topRight: Radius.circular(5.0),
                                                                                ),
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(4.0),
                                                                                  child: Text(
                                                                                    '${valueOrDefault<String>(
                                                                                      functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                      '0',
                                                                                    )} Qs',
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
                                                                        ),
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              18.0,
                                                                              16.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                24.0,
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              shape: BoxShape.rectangle,
                                                                            ),
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 6.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: 10.0,
                                                                                      height: 10.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                        shape: BoxShape.circle,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Icon(
                                                                                    Icons.verified,
                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    back:
                                                                        Container(
                                                                      width: double
                                                                          .infinity,
                                                                      child:
                                                                          Stack(
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                16.0,
                                                                                16.0,
                                                                                0.0),
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 150.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                boxShadow: [
                                                                                  BoxShadow(
                                                                                    blurRadius: 4.0,
                                                                                    color: Color(0x33000000),
                                                                                    offset: Offset(
                                                                                      0.0,
                                                                                      2.0,
                                                                                    ),
                                                                                  )
                                                                                ],
                                                                                borderRadius: BorderRadius.circular(12.0),
                                                                                border: Border.all(
                                                                                  color: Color(0xFFC1C1C1),
                                                                                  width: 1.0,
                                                                                ),
                                                                              ),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            'More About the task',
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  font: GoogleFonts.poppins(
                                                                                                    fontWeight: FontWeight.bold,
                                                                                                    fontStyle: FontStyle.italic,
                                                                                                  ),
                                                                                                  fontSize: 18.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              '• Wiping surfaces and counters',
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    font: GoogleFonts.poppins(
                                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                    ),
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 10.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 4.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 24.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            logFirebaseEvent('SWIPE_TASKER_Container_wepg9byt_ON_TAP');
                                                                                            logFirebaseEvent('Container_navigate_to');

                                                                                            context.pushNamed(
                                                                                              ADDPhotoCreateTaskWidget.routeName,
                                                                                              queryParameters: {
                                                                                                'pretasks': serializeParam(
                                                                                                  columnTasksPreProntasRecord.reference,
                                                                                                  ParamType.DocumentReference,
                                                                                                ),
                                                                                              }.withoutNulls,
                                                                                            );
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 72.03,
                                                                                            height: 50.0,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              borderRadius: BorderRadius.only(
                                                                                                bottomLeft: Radius.circular(15.0),
                                                                                                bottomRight: Radius.circular(15.0),
                                                                                                topLeft: Radius.circular(15.0),
                                                                                                topRight: Radius.circular(15.0),
                                                                                              ),
                                                                                            ),
                                                                                            alignment: AlignmentDirectional(0.0, 0.0),
                                                                                            child: Align(
                                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                                              child: Text(
                                                                                                'Book\nNow',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      font: GoogleFonts.poppins(
                                                                                                        fontWeight: FontWeight.bold,
                                                                                                        fontStyle: FontStyle.italic,
                                                                                                      ),
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.bold,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                      lineHeight: 1.0,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(1.0, -1.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 10.0, 0.0),
                                                                              child: Container(
                                                                                width: 55.0,
                                                                                height: 22.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(5.0),
                                                                                    bottomRight: Radius.circular(5.0),
                                                                                    topLeft: Radius.circular(5.0),
                                                                                    topRight: Radius.circular(5.0),
                                                                                  ),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 0.0),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(4.0),
                                                                                    child: Text(
                                                                                      '${valueOrDefault<String>(
                                                                                        functions.quantodetokentem(columnTasksPreProntasRecord.preco).toString(),
                                                                                        '0',
                                                                                      )} Qs',
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
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  );
                                                                }).divide(SizedBox(
                                                                    height:
                                                                        16.0)),
                                                              ).animateOnPageLoad(
                                                                  animationsMap[
                                                                      'columnOnPageLoadAnimation4']!);
                                                            },
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(),
                                                    ],
                                                  ),
                                                ].divide(
                                                    SizedBox(height: 12.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 1.0),
                              child: Container(
                                width: MediaQuery.sizeOf(context).width * 1.0,
                                height: 100.0,
                                decoration: BoxDecoration(),
                                child: Stack(
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          14.0, 0.0, 14.0, 0.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [],
                                      ),
                                    ),
                                    wrapWithModel(
                                      model: _model.navBarModel2,
                                      updateCallback: () => safeSetState(() {}),
                                      child: NavBarWidget(),
                                    ),
                                  ],
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
                                      MediaQuery.sizeOf(context).height * 0.45,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            AlignmentDirectional(1.0, -1.0),
                                        child: Container(
                                          width: 35.0,
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.6,
                                          decoration: BoxDecoration(
                                            color: () {
                                              if (FFAppState()
                                                      .selectedRakingPages ==
                                                  'About the task') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .tertiary;
                                              } else if (FFAppState()
                                                      .selectedRakingPages ==
                                                  'About the tasker') {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .secondary;
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
                                            AlignmentDirectional(1.0, 0.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 20.0, 0.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Icon(
                                                    Icons.circle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 12.0,
                                                  ),
                                                  Icon(
                                                    Icons.circle,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 12.0,
                                                  ),
                                                ].divide(SizedBox(height: 8.0)),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  -1.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
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
                                                        'SWIPE_TASKER_PAGE_Stack_ekujx29m_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Stack_update_app_state');
                                                    FFAppState()
                                                            .selectTaskSeletable =
                                                        'AllTasks';
                                                    safeSetState(() {});
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1.0, 0.0),
                                                    children: [
                                                      if (FFAppState()
                                                              .selectTaskSeletable ==
                                                          'AllTasks')
                                                        Container(
                                                          width: 40.0,
                                                          height: 120.0,
                                                          child: custom_widgets
                                                              .VerticalOvalTab(
                                                            width: 40.0,
                                                            height: 120.0,
                                                            isSelected: true,
                                                            activeColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            inactiveColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                            borderWidth: 2.0,
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
                                                            text: 'All Taskers',
                                                            cor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        4.0, 0.0, 4.0, 0.0),
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
                                                        'SWIPE_TASKER_PAGE_Stack_kkyekdr5_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Stack_update_app_state');
                                                    FFAppState()
                                                            .selectTaskSeletable =
                                                        'ProfissionalHelp';
                                                    safeSetState(() {});
                                                  },
                                                  child: Stack(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    children: [
                                                      if ((String var1) {
                                                        return var1 ==
                                                            'ProfissionalHelp';
                                                      }(FFAppState()
                                                          .selectTaskSeletable))
                                                        Align(
                                                          alignment:
                                                              AlignmentDirectional(
                                                                  0.0, 0.0),
                                                          child: Container(
                                                            width: 40.0,
                                                            height: 125.0,
                                                            child: custom_widgets
                                                                .VerticalOvalTab(
                                                              width: 40.0,
                                                              height: 125.0,
                                                              isSelected: true,
                                                              activeColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              inactiveColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderWidth: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0.0, 0.0),
                                                        child: Container(
                                                          width: 40.0,
                                                          height: 90.0,
                                                          child: custom_widgets
                                                              .RotatedTaskTexts(
                                                            width: 40.0,
                                                            height: 90.0,
                                                            text:
                                                                ' About Tasker',
                                                            cor: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBackground,
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
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
