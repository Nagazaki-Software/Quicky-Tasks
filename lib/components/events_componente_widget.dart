import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/event_containmer_widget.dart';
import '/components/foremptylist_widget.dart';
import '/components/interesseconfirmado_widget.dart';
import '/components/taskcanceled_copy_widget.dart';
import '/components/taskerinapproval_copy_widget.dart';
import '/components/vcquerirnesseevent_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:text_search/text_search.dart';
import 'events_componente_model.dart';
export 'events_componente_model.dart';

class EventsComponenteWidget extends StatefulWidget {
  const EventsComponenteWidget({super.key});

  @override
  State<EventsComponenteWidget> createState() => _EventsComponenteWidgetState();
}

class _EventsComponenteWidgetState extends State<EventsComponenteWidget>
    with TickerProviderStateMixin {
  late EventsComponenteModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => EventsComponenteModel());

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();
    _model.textFieldFocusNode!.addListener(() => safeSetState(() {}));
    _model.tabBarController = TabController(
      vsync: this,
      length: 4,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
          child: AuthUserStreamWidget(
            builder: (context) => Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              child: TextFormField(
                controller: _model.textController,
                focusNode: _model.textFieldFocusNode,
                onChanged: (_) => EasyDebounce.debounce(
                  '_model.textController',
                  Duration(milliseconds: 2000),
                  () async {
                    logFirebaseEvent(
                        'EVENTS_COMPONENTE_TextField_755fyg0b_ON_');
                    logFirebaseEvent('TextField_simple_search');
                    await queryEventsRecordOnce()
                        .then(
                          (records) => _model.simpleSearchResults = TextSearch(
                            records
                                .map(
                                  (record) => TextSearchItem.fromTerms(record, [
                                    record.eventDescription,
                                    record.complement
                                  ]),
                                )
                                .toList(),
                          )
                              .search(_model.textController.text)
                              .map((r) => r.object)
                              .toList(),
                        )
                        .onError((_, __) => _model.simpleSearchResults = [])
                        .whenComplete(() => safeSetState(() {}));
                  },
                ),
                autofocus: false,
                textCapitalization: TextCapitalization.sentences,
                obscureText: false,
                decoration: InputDecoration(
                  labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: valueOrDefault(
                                    currentUserDocument?.taskOrTaskee, '') ==
                                'Taskee'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  hintText: 'Search events...',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                        font: GoogleFonts.poppins(
                          fontWeight: FontWeight.w300,
                          fontStyle: FlutterFlowTheme.of(context)
                              .labelMedium
                              .fontStyle,
                        ),
                        color: valueOrDefault(
                                    currentUserDocument?.taskOrTaskee, '') ==
                                'Taskee'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).labelMedium.fontStyle,
                      ),
                  errorStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.figtree(
                          fontWeight: FontWeight.w600,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: valueOrDefault(
                                    currentUserDocument?.taskOrTaskee, '') ==
                                'Taskee'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).secondaryBackground,
                        fontSize: 12.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFD0BB8C),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF6F61EF),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5963),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFFFF5963),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor:
                      valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                              'Taskee'
                          ? FlutterFlowTheme.of(context).secondaryBackground
                          : FlutterFlowTheme.of(context).primaryBackground,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color:
                        valueOrDefault(currentUserDocument?.taskOrTaskee, '') ==
                                'Taskee'
                            ? FlutterFlowTheme.of(context).primaryBackground
                            : FlutterFlowTheme.of(context).secondaryBackground,
                    size: 24.0,
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.poppins(
                        fontWeight: FontWeight.w300,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: valueOrDefault(
                                  currentUserDocument?.taskOrTaskee, '') ==
                              'Taskee'
                          ? FlutterFlowTheme.of(context).primaryBackground
                          : FlutterFlowTheme.of(context).secondaryBackground,
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w300,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                cursorColor: Color(0xFF6F61EF),
                validator: _model.textControllerValidator.asValidator(context),
                inputFormatters: [
                  if (!isAndroid && !isiOS)
                    TextInputFormatter.withFunction((oldValue, newValue) {
                      return TextEditingValue(
                        selection: newValue.selection,
                        text: newValue.text
                            .toCapitalization(TextCapitalization.sentences),
                      );
                    }),
                ],
              ),
            ),
          ),
        ),
        if (!(_model.simpleSearchResults.isNotEmpty) ||
            (/* NOT RECOMMENDED */ _model.textController.text == 'true'))
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 50.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * 1.0,
                height: MediaQuery.sizeOf(context).height * 1.0,
                decoration: BoxDecoration(),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment(0.0, 0),
                      child: TabBar(
                        isScrollable: true,
                        tabAlignment: TabAlignment.center,
                        labelColor: FlutterFlowTheme.of(context).tertiary,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).alternate,
                        labelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w500,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        unselectedLabelStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontWeight,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .fontStyle,
                                  ),
                                  letterSpacing: 0.0,
                                  fontWeight: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontWeight,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .titleMedium
                                      .fontStyle,
                                ),
                        indicatorColor: FlutterFlowTheme.of(context).tertiary,
                        tabs: [
                          Tab(
                            text: 'List',
                          ),
                          Tab(
                            text: 'Calendar',
                          ),
                          Tab(
                            text: 'My Events',
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 4.0, 0.0),
                                child: Icon(
                                  Icons.radio_button_checked_rounded,
                                  color: FlutterFlowTheme.of(context).secondary,
                                  size: 14.0,
                                ),
                              ),
                              Tab(
                                text: 'Live',
                              ),
                            ],
                          ),
                        ],
                        controller: _model.tabBarController,
                        onTap: (i) async {
                          [
                            () async {},
                            () async {},
                            () async {},
                            () async {}
                          ][i]();
                        },
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _model.tabBarController,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 4.0, 0.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(),
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
                                    List<EventsRecord>
                                        containerEventsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10.0, 0.0, 38.0, 55.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => Container(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        1.0,
                                                height:
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        1.0,
                                                child: custom_widgets.EventList(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          1.0,
                                                  eventList:
                                                      containerEventsRecordList,
                                                  colorText: valueOrDefault(
                                                              currentUserDocument
                                                                  ?.taskOrTaskee,
                                                              '') ==
                                                          'Taskee'
                                                      ? FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground
                                                      : FlutterFlowTheme.of(
                                                              context)
                                                          .primaryBackground,
                                                  containerEvent:
                                                      (DocumentReference
                                                              eventRef) =>
                                                          EventContainmerWidget(
                                                    event: eventRef,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 35.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                AuthUserStreamWidget(
                                  builder: (context) => FlutterFlowCalendar(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    iconColor: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    weekFormat: true,
                                    weekStartsMonday: true,
                                    initialDate: getCurrentTimestamp,
                                    rowHeight: 48.0,
                                    onChange: (DateTimeRange? newSelectedDate) {
                                      safeSetState(() =>
                                          _model.calendarSelectedDay =
                                              newSelectedDate);
                                    },
                                    titleStyle: FlutterFlowTheme.of(context)
                                        .titleLarge
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleLarge
                                                    .fontStyle,
                                          ),
                                          color: valueOrDefault<Color>(
                                            valueOrDefault(
                                                        currentUserDocument
                                                            ?.taskOrTaskee,
                                                        '') ==
                                                    'Taskee'
                                                ? FlutterFlowTheme.of(context)
                                                    .secondaryBackground
                                                : FlutterFlowTheme.of(context)
                                                    .primaryBackground,
                                            FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                          fontSize: 22.0,
                                          letterSpacing: 4.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .titleLarge
                                                  .fontStyle,
                                        ),
                                    dayOfWeekStyle: FlutterFlowTheme.of(context)
                                        .bodyLarge
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLarge
                                                    .fontStyle,
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
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyLarge
                                                  .fontStyle,
                                        ),
                                    dateStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          font: GoogleFonts.poppins(
                                            fontWeight:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontWeight,
                                            fontStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMedium
                                                    .fontStyle,
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
                                          letterSpacing: 0.0,
                                          fontWeight:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .fontStyle,
                                        ),
                                    selectedDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmall
                                                      .fontStyle,
                                            ),
                                    inactiveDateStyle:
                                        FlutterFlowTheme.of(context)
                                            .labelMedium
                                            .override(
                                              font: GoogleFonts.poppins(
                                                fontWeight:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .labelMedium
                                                        .fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .fontStyle,
                                            ),
                                    locale: FFLocalizations.of(context)
                                        .languageCode,
                                  ),
                                ),
                                if (valueOrDefault(
                                        currentUserDocument?.taskOrTaskee,
                                        '') ==
                                    'Taskee')
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventsRecord>
                                            containerEventsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child:
                                              // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                              //
                                              // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                              Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final containerVar = functions
                                                    .newCustomFunction2(
                                                        containerEventsRecordList
                                                            .toList(),
                                                        _model.calendarSelectedDay !=
                                                                null
                                                            ? _model
                                                                .calendarSelectedDay!
                                                                .end
                                                            : getCurrentTimestamp,
                                                        currentUserReference!)
                                                    .toList();
                                                if (containerVar.isEmpty) {
                                                  return ForemptylistWidget(
                                                    text:
                                                        'You don\'t have any events scheduled for this day yet.',
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.fromLTRB(
                                                    0,
                                                    0,
                                                    0,
                                                    44.0,
                                                  ),
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      containerVar.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      containerVarIndex) {
                                                    final containerVarItem =
                                                        containerVar[
                                                            containerVarIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
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
                                                              'EVENTS_COMPONENTE_Container_zd7qrqre_ON_');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            EventdetailsWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'envet':
                                                                  serializeParam(
                                                                containerVarItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  containerVarItem
                                                                      .eventFoto,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: LantlngForStringCall
                                                                          .call(
                                                                        latlng: containerVarItem
                                                                            .location
                                                                            ?.toString(),
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final textLantlngForStringResponse =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          '${LantlngForStringCall.formatAddress(
                                                                            textLantlngForStringResponse.jsonBody,
                                                                          )?.lastOrNull} - ${dateTimeFormat(
                                                                            "M/d h:mm a",
                                                                            containerVarItem.horario,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      containerVarItem
                                                                          .eventDescription,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                                                                                ? FlutterFlowTheme.of(context).primaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                    FutureBuilder<
                                                                        UsersRecord>(
                                                                      future: UsersRecord.getDocumentOnce(
                                                                          containerVarItem
                                                                              .user!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        final textUsersRecord =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          'By ${textUsersRecord.displayName}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.place_sharp,
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 16.0,
                                                                            ),
                                                                            Text(
                                                                              containerVarItem.complement,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.person,
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 16.0,
                                                                            ),
                                                                            Text(
                                                                              '${valueOrDefault<String>(
                                                                                containerVarItem.usersRegistration.length.toString(),
                                                                                '0',
                                                                              )} Attending',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                if (valueOrDefault(
                                        currentUserDocument?.taskOrTaskee,
                                        '') ==
                                    'Tasker')
                                  AuthUserStreamWidget(
                                    builder: (context) =>
                                        StreamBuilder<List<EventsRecord>>(
                                      stream: queryEventsRecord(),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 50.0,
                                              height: 50.0,
                                              child: SpinKitPulse(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 50.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<EventsRecord>
                                            containerEventsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child:
                                              // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                              //
                                              // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                              Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 8.0, 0.0, 70.0),
                                            child: Builder(
                                              builder: (context) {
                                                final containerVar = functions
                                                    .newCustomFunction2Copy(
                                                        containerEventsRecordList
                                                            .toList(),
                                                        _model.calendarSelectedDay !=
                                                                null
                                                            ? _model
                                                                .calendarSelectedDay!
                                                                .end
                                                            : getCurrentTimestamp,
                                                        currentUserReference!)
                                                    .toList();
                                                if (containerVar.isEmpty) {
                                                  return ForemptylistWidget(
                                                    text:
                                                        'You don\'t have any events scheduled for this day yet.',
                                                  );
                                                }

                                                return ListView.separated(
                                                  padding: EdgeInsets.zero,
                                                  primary: false,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      containerVar.length,
                                                  separatorBuilder: (_, __) =>
                                                      SizedBox(height: 8.0),
                                                  itemBuilder: (context,
                                                      containerVarIndex) {
                                                    final containerVarItem =
                                                        containerVar[
                                                            containerVarIndex];
                                                    return Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16.0,
                                                                  4.0,
                                                                  16.0,
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
                                                              'EVENTS_COMPONENTE_Container_dp8vmtvk_ON_');
                                                          logFirebaseEvent(
                                                              'Container_navigate_to');

                                                          context.pushNamed(
                                                            EventdetailsCopyWidget
                                                                .routeName,
                                                            queryParameters: {
                                                              'envet':
                                                                  serializeParam(
                                                                containerVarItem
                                                                    .reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                valueOrDefault<
                                                                    Color>(
                                                              valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondaryBackground,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            border: Border.all(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .alternate,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                  bottomLeft: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  bottomRight: Radius
                                                                      .circular(
                                                                          0.0),
                                                                  topLeft: Radius
                                                                      .circular(
                                                                          8.0),
                                                                  topRight: Radius
                                                                      .circular(
                                                                          8.0),
                                                                ),
                                                                child: Image
                                                                    .network(
                                                                  containerVarItem
                                                                      .eventFoto,
                                                                  width: double
                                                                      .infinity,
                                                                  height: 150.0,
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            12.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    FutureBuilder<
                                                                        ApiCallResponse>(
                                                                      future: LantlngForStringCall
                                                                          .call(
                                                                        latlng: containerVarItem
                                                                            .location
                                                                            ?.toString(),
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
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }
                                                                        final textLantlngForStringResponse =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          '${LantlngForStringCall.formatAddress(
                                                                            textLantlngForStringResponse.jsonBody,
                                                                          )?.lastOrNull} - ${dateTimeFormat(
                                                                            "M/d h:mm a",
                                                                            containerVarItem.horario,
                                                                            locale:
                                                                                FFLocalizations.of(context).languageCode,
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelSmall
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Text(
                                                                      containerVarItem
                                                                          .eventDescription,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleLarge
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.poppins(
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                            color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee'
                                                                                ? FlutterFlowTheme.of(context).primaryBackground
                                                                                : FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontSize:
                                                                                22.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontStyle:
                                                                                FontStyle.italic,
                                                                          ),
                                                                    ),
                                                                    FutureBuilder<
                                                                        UsersRecord>(
                                                                      future: UsersRecord.getDocumentOnce(
                                                                          containerVarItem
                                                                              .user!),
                                                                      builder:
                                                                          (context,
                                                                              snapshot) {
                                                                        // Customize what your widget looks like when it's loading.
                                                                        if (!snapshot
                                                                            .hasData) {
                                                                          return Center(
                                                                            child:
                                                                                SizedBox(
                                                                              width: 50.0,
                                                                              height: 50.0,
                                                                              child: SpinKitPulse(
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                size: 50.0,
                                                                              ),
                                                                            ),
                                                                          );
                                                                        }

                                                                        final textUsersRecord =
                                                                            snapshot.data!;

                                                                        return Text(
                                                                          'By ${textUsersRecord.displayName}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleLarge
                                                                              .override(
                                                                                font: GoogleFonts.poppins(
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                                fontSize: 14.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w300,
                                                                                fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                              ),
                                                                        );
                                                                      },
                                                                    ),
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.place_sharp,
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 16.0,
                                                                            ),
                                                                            Text(
                                                                              containerVarItem.complement,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children:
                                                                              [
                                                                            Icon(
                                                                              Icons.person,
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              size: 16.0,
                                                                            ),
                                                                            Text(
                                                                              '${valueOrDefault<String>(
                                                                                containerVarItem.usersRegistration.length.toString(),
                                                                                '0',
                                                                              )} Attending',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    font: GoogleFonts.poppins(
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                                    color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                    fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                  ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 4.0)),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      height:
                                                                          4.0)),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 38.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                if (valueOrDefault(
                                        currentUserDocument?.taskOrTaskee,
                                        '') ==
                                    'Taskee')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Events I\'m Interested In',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.taskOrTaskee,
                                                                      '') ==
                                                                  'Taskee'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.eventsinterested)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_2b5muob4_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.chevronUp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                              if (!_model.eventsinterested)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_4ceyq9ip_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronDown,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                            ],
                                          ),

                                          // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                          //
                                          // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                          if (_model.eventsinterested)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<EventsRecord>>(
                                                stream: queryEventsRecord(
                                                  queryBuilder:
                                                      (eventsRecord) =>
                                                          eventsRecord.where(
                                                    'interesseUsers',
                                                    arrayContains:
                                                        currentUserReference,
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
                                                  List<EventsRecord>
                                                      listViewEventsRecordList =
                                                      snapshot.data!;
                                                  if (listViewEventsRecordList
                                                      .isEmpty) {
                                                    return ForemptylistWidget(
                                                      text:
                                                          'You are not interested in any event yet.',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEventsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEventsRecord =
                                                          listViewEventsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EVENTS_COMPONENTE_Container_097nca49_ON_');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              EventdetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'envet':
                                                                    serializeParam(
                                                                  listViewEventsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    listViewEventsRecord
                                                                        .eventFoto,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future:
                                                                            LantlngForStringCall.call(
                                                                          latlng: listViewEventsRecord
                                                                              .location
                                                                              ?.toString(),
                                                                        ),
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
                                                                          final textLantlngForStringResponse =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              LantlngForStringCall.formatAddress(
                                                                                textLantlngForStringResponse.jsonBody,
                                                                              )?.firstOrNull,
                                                                              'error',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        listViewEventsRecord
                                                                            .eventDescription,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(listViewEventsRecord.user!),
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

                                                                          final textUsersRecord =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            'By ${textUsersRecord.displayName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.place_sharp,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                listViewEventsRecord.complement,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  listViewEventsRecord.usersRegistration.length.toString(),
                                                                                  '0',
                                                                                )} Attending',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Events I Atended',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.taskOrTaskee,
                                                                      '') ==
                                                                  'Taskee'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.eventscofirmed)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_fy4h9zxc_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventscofirmed =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.chevronUp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                              if (!_model.eventscofirmed)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_gq57ppch_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronDown,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                            ],
                                          ),

                                          // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                          //
                                          // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                          if (_model.eventscofirmed)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<EventsRecord>>(
                                                stream: queryEventsRecord(
                                                  queryBuilder:
                                                      (eventsRecord) =>
                                                          eventsRecord.where(
                                                    'usersRegistration',
                                                    arrayContains:
                                                        currentUserReference,
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
                                                  List<EventsRecord>
                                                      listViewEventsRecordList =
                                                      snapshot.data!;
                                                  if (listViewEventsRecordList
                                                      .isEmpty) {
                                                    return ForemptylistWidget(
                                                      text:
                                                          'You are not participating in any events yet.',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEventsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEventsRecord =
                                                          listViewEventsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EVENTS_COMPONENTE_Container_zznjtt06_ON_');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              EventdetailsWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'envet':
                                                                    serializeParam(
                                                                  listViewEventsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    listViewEventsRecord
                                                                        .eventFoto,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future:
                                                                            LantlngForStringCall.call(
                                                                          latlng: listViewEventsRecord
                                                                              .location
                                                                              ?.toString(),
                                                                        ),
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
                                                                          final textLantlngForStringResponse =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              LantlngForStringCall.formatAddress(
                                                                                textLantlngForStringResponse.jsonBody,
                                                                              )?.firstOrNull,
                                                                              'error',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        listViewEventsRecord
                                                                            .eventDescription,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(listViewEventsRecord.user!),
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

                                                                          final textUsersRecord =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            'By ${textUsersRecord.displayName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.place_sharp,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                listViewEventsRecord.complement,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  listViewEventsRecord.usersRegistration.length.toString(),
                                                                                  '0',
                                                                                )} Attending',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                if (valueOrDefault(
                                        currentUserDocument?.taskOrTaskee,
                                        '') ==
                                    'Tasker')
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 12.0, 0.0, 0.0),
                                    child: AuthUserStreamWidget(
                                      builder: (context) => Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Event I\'m an Instructor',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.taskOrTaskee,
                                                                      '') ==
                                                                  'Taskee'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.eventsinterested)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_35tow8jf_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.chevronUp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                              if (!_model.eventsinterested)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_7swiz3g3_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronDown,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                            ],
                                          ),

                                          // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                          //
                                          // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                          if (_model.eventsinterested)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<EventsRecord>>(
                                                stream: queryEventsRecord(
                                                  queryBuilder:
                                                      (eventsRecord) =>
                                                          eventsRecord.where(
                                                    'instrutorAccept',
                                                    arrayContains:
                                                        currentUserReference,
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
                                                  List<EventsRecord>
                                                      listViewEventsRecordList =
                                                      snapshot.data!;
                                                  if (listViewEventsRecordList
                                                      .isEmpty) {
                                                    return ForemptylistWidget(
                                                      text:
                                                          'You are not interested in any event yet.',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEventsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEventsRecord =
                                                          listViewEventsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EVENTS_COMPONENTE_Container_et16xq0d_ON_');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              EventdetailsCopyWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'envet':
                                                                    serializeParam(
                                                                  listViewEventsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    listViewEventsRecord
                                                                        .eventFoto,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future:
                                                                            LantlngForStringCall.call(
                                                                          latlng: listViewEventsRecord
                                                                              .location
                                                                              ?.toString(),
                                                                        ),
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
                                                                          final textLantlngForStringResponse =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              LantlngForStringCall.formatAddress(
                                                                                textLantlngForStringResponse.jsonBody,
                                                                              )?.firstOrNull,
                                                                              'error',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        listViewEventsRecord
                                                                            .eventDescription,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(listViewEventsRecord.user!),
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

                                                                          final textUsersRecord =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            'By ${textUsersRecord.displayName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.place_sharp,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                listViewEventsRecord.complement,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  listViewEventsRecord.usersRegistration.length.toString(),
                                                                                  '0',
                                                                                )} Attending',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Align(
                                                alignment: AlignmentDirectional(
                                                    -1.0, -1.0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          12.0, 0.0, 0.0, 0.0),
                                                  child: Text(
                                                    'Event I\'m a Helper',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.taskOrTaskee,
                                                                      '') ==
                                                                  'Taskee'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .secondaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                          fontSize: 20.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                              if (_model.eventscofirmed)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_1dvaqv6b_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventscofirmed =
                                                        false;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons.chevronUp,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                              if (!_model.eventscofirmed)
                                                InkWell(
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
                                                        'EVENTS_COMPONENTE_Icon_cpxiksc0_ON_TAP');
                                                    logFirebaseEvent(
                                                        'Icon_update_component_state');
                                                    _model.eventsinterested =
                                                        true;
                                                    safeSetState(() {});
                                                  },
                                                  child: FaIcon(
                                                    FontAwesomeIcons
                                                        .chevronDown,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    size: 19.0,
                                                  ),
                                                ),
                                            ],
                                          ),

                                          // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                                          //
                                          // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                                          if (_model.eventscofirmed)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 8.0, 0.0, 0.0),
                                              child: StreamBuilder<
                                                  List<EventsRecord>>(
                                                stream: queryEventsRecord(
                                                  queryBuilder:
                                                      (eventsRecord) =>
                                                          eventsRecord.where(
                                                    'performers',
                                                    arrayContains:
                                                        currentUserReference,
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
                                                  List<EventsRecord>
                                                      listViewEventsRecordList =
                                                      snapshot.data!;
                                                  if (listViewEventsRecordList
                                                      .isEmpty) {
                                                    return ForemptylistWidget(
                                                      text:
                                                          'You are not participating in any events yet.',
                                                    );
                                                  }

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    primary: false,
                                                    shrinkWrap: true,
                                                    scrollDirection:
                                                        Axis.vertical,
                                                    itemCount:
                                                        listViewEventsRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(height: 8.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewEventsRecord =
                                                          listViewEventsRecordList[
                                                              listViewIndex];
                                                      return Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    16.0,
                                                                    4.0,
                                                                    16.0,
                                                                    0.0),
                                                        child: InkWell(
                                                          splashColor: Colors
                                                              .transparent,
                                                          focusColor: Colors
                                                              .transparent,
                                                          hoverColor: Colors
                                                              .transparent,
                                                          highlightColor: Colors
                                                              .transparent,
                                                          onTap: () async {
                                                            logFirebaseEvent(
                                                                'EVENTS_COMPONENTE_Container_n1692sd5_ON_');
                                                            logFirebaseEvent(
                                                                'Container_navigate_to');

                                                            context.pushNamed(
                                                              EventdetailsCopyWidget
                                                                  .routeName,
                                                              queryParameters: {
                                                                'envet':
                                                                    serializeParam(
                                                                  listViewEventsRecord
                                                                      .reference,
                                                                  ParamType
                                                                      .DocumentReference,
                                                                ),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                              border:
                                                                  Border.all(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                width: 1.0,
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    bottomRight:
                                                                        Radius.circular(
                                                                            0.0),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            8.0),
                                                                    topRight: Radius
                                                                        .circular(
                                                                            8.0),
                                                                  ),
                                                                  child: Image
                                                                      .network(
                                                                    listViewEventsRecord
                                                                        .eventFoto,
                                                                    width: double
                                                                        .infinity,
                                                                    height:
                                                                        100.0,
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              12.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      FutureBuilder<
                                                                          ApiCallResponse>(
                                                                        future:
                                                                            LantlngForStringCall.call(
                                                                          latlng: listViewEventsRecord
                                                                              .location
                                                                              ?.toString(),
                                                                        ),
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
                                                                          final textLantlngForStringResponse =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              LantlngForStringCall.formatAddress(
                                                                                textLantlngForStringResponse.jsonBody,
                                                                              )?.firstOrNull,
                                                                              'error',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                  ),
                                                                                  color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  fontSize: 12.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).labelSmall.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Text(
                                                                        listViewEventsRecord
                                                                            .eventDescription,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .titleLarge
                                                                            .override(
                                                                              font: GoogleFonts.poppins(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontStyle: FontStyle.italic,
                                                                              ),
                                                                              color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                              fontSize: 22.0,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              fontStyle: FontStyle.italic,
                                                                            ),
                                                                      ),
                                                                      FutureBuilder<
                                                                          UsersRecord>(
                                                                        future:
                                                                            UsersRecord.getDocumentOnce(listViewEventsRecord.user!),
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

                                                                          final textUsersRecord =
                                                                              snapshot.data!;

                                                                          return Text(
                                                                            'By ${textUsersRecord.displayName}',
                                                                            style: FlutterFlowTheme.of(context).titleLarge.override(
                                                                                  font: GoogleFonts.poppins(
                                                                                    fontWeight: FontWeight.w300,
                                                                                    fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                  ),
                                                                                  color: FlutterFlowTheme.of(context).alternate,
                                                                                  fontSize: 14.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w300,
                                                                                  fontStyle: FlutterFlowTheme.of(context).titleLarge.fontStyle,
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.place_sharp,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                listViewEventsRecord.complement,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                [
                                                                              Icon(
                                                                                Icons.person,
                                                                                color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 16.0,
                                                                              ),
                                                                              Text(
                                                                                '${valueOrDefault<String>(
                                                                                  listViewEventsRecord.usersRegistration.length.toString(),
                                                                                  '0',
                                                                                )} Attending',
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      font: GoogleFonts.poppins(
                                                                                        fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                        fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                      ),
                                                                                      color: valueOrDefault(currentUserDocument?.taskOrTaskee, '') == 'Taskee' ? FlutterFlowTheme.of(context).primaryBackground : FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                      fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 4.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        height:
                                                                            4.0)),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 35.0, 0.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                StreamBuilder<List<EventsRecord>>(
                                  stream: queryEventsRecord(
                                    queryBuilder: (eventsRecord) =>
                                        eventsRecord.where(
                                      'user',
                                      isEqualTo: currentUserReference,
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
                                    List<EventsRecord>
                                        containerEventsRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 0.0, 12.0, 0.0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                1.0,
                                            child: custom_widgets.EventLive(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  1.0,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  1.0,
                                              eventList:
                                                  containerEventsRecordList,
                                              colors: valueOrDefault(
                                                          currentUserDocument
                                                              ?.taskOrTaskee,
                                                          '') ==
                                                      'Taskee'
                                                  ? FlutterFlowTheme.of(context)
                                                      .secondaryBackground
                                                  : FlutterFlowTheme.of(context)
                                                      .primaryBackground,
                                              containerEvent: (DocumentReference
                                                      eventRef) =>
                                                  EventContainmerWidget(
                                                event: eventRef,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
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
          ),
        if (_model.simpleSearchResults.isNotEmpty)
          Expanded(
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 12.0, 35.0, 0.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 12.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 0.0, 0.0),
                            child: Text(
                              '${valueOrDefault<String>(
                                _model.simpleSearchResults.length.toString(),
                                '0',
                              )} options in the search.',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w300,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                    fontSize: 10.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // This list view is "shrink wrapped" this can affect your app performance, we would suggest limiting the number of items you query in this list view.
                  //
                  // The list view is shrink wrapped to prevent the page from having two scrollable elements. The parent column is the element that is scrollable and it provides a smooth user experience.
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                    child: Builder(
                      builder: (context) {
                        final search = _model.simpleSearchResults.toList();

                        return ListView.separated(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            0,
                            0,
                            44.0,
                          ),
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: search.length,
                          separatorBuilder: (_, __) => SizedBox(height: 8.0),
                          itemBuilder: (context, searchIndex) {
                            final searchItem = search[searchIndex];
                            return Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  8.0, 4.0, 8.0, 0.0),
                              child: AuthUserStreamWidget(
                                builder: (context) =>
                                    FutureBuilder<EventsRecord>(
                                  future: EventsRecord.getDocumentOnce(
                                      searchItem.reference),
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

                                    final containerEventsRecord =
                                        snapshot.data!;

                                    return InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        logFirebaseEvent(
                                            'EVENTS_COMPONENTE_Container_yptgohpd_ON_');
                                        if (valueOrDefault(
                                                currentUserDocument
                                                    ?.taskOrTaskee,
                                                '') ==
                                            'Taskee') {
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            EventdetailsWidget.routeName,
                                            queryParameters: {
                                              'envet': serializeParam(
                                                containerEventsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        } else {
                                          logFirebaseEvent(
                                              'Container_navigate_to');

                                          context.pushNamed(
                                            EventdetailsCopyWidget.routeName,
                                            queryParameters: {
                                              'envet': serializeParam(
                                                containerEventsRecord.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: valueOrDefault(
                                                      currentUserDocument
                                                          ?.taskOrTaskee,
                                                      '') ==
                                                  'Taskee'
                                              ? FlutterFlowTheme.of(context)
                                                  .secondaryBackground
                                              : FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          border: Border.all(
                                            color: Color(0xFFE5E7EB),
                                            width: 1.0,
                                          ),
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(0.0),
                                                bottomRight:
                                                    Radius.circular(0.0),
                                                topLeft: Radius.circular(8.0),
                                                topRight: Radius.circular(8.0),
                                              ),
                                              child: Image.network(
                                                containerEventsRecord.eventFoto,
                                                width: double.infinity,
                                                height: 100.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.all(12.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Austin, Texas',
                                                    style:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelSmall
                                                            .override(
                                                              font: GoogleFonts
                                                                  .poppins(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                                fontStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .fontStyle,
                                                              ),
                                                              color: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.taskOrTaskee,
                                                                          '') ==
                                                                      'Taskee'
                                                                  ? FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground
                                                                  : FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              fontSize: 12.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .fontStyle,
                                                            ),
                                                  ),
                                                  Text(
                                                    containerEventsRecord
                                                        .eventDescription,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleLarge
                                                        .override(
                                                          font: GoogleFonts
                                                              .poppins(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                          ),
                                                          color: valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.taskOrTaskee,
                                                                      '') ==
                                                                  'Taskee'
                                                              ? FlutterFlowTheme
                                                                      .of(
                                                                          context)
                                                                  .primaryBackground
                                                              : FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                          fontSize: 22.0,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontStyle:
                                                              FontStyle.italic,
                                                        ),
                                                  ),
                                                  FutureBuilder<UsersRecord>(
                                                    future: UsersRecord
                                                        .getDocumentOnce(
                                                            containerEventsRecord
                                                                .user!),
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

                                                      final textUsersRecord =
                                                          snapshot.data!;

                                                      return Text(
                                                        'By ${textUsersRecord.displayName}',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleLarge
                                                                .override(
                                                                  font: GoogleFonts
                                                                      .poppins(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w300,
                                                                    fontStyle: FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleLarge
                                                                        .fontStyle,
                                                                  ),
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .alternate,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300,
                                                                  fontStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleLarge
                                                                      .fontStyle,
                                                                ),
                                                      );
                                                    },
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.place_sharp,
                                                            color: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.taskOrTaskee,
                                                                        '') ==
                                                                    'Taskee'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            size: 16.0,
                                                          ),
                                                          Text(
                                                            containerEventsRecord
                                                                .complement,
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
                                                                  color: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.taskOrTaskee,
                                                                              '') ==
                                                                          'Taskee'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Icon(
                                                            Icons.person,
                                                            color: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.taskOrTaskee,
                                                                        '') ==
                                                                    'Taskee'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground
                                                                : FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                            size: 16.0,
                                                          ),
                                                          Text(
                                                            '${valueOrDefault<String>(
                                                              containerEventsRecord
                                                                  .usersRegistration
                                                                  .length
                                                                  .toString(),
                                                              '0',
                                                            )} Attending',
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
                                                                  color: valueOrDefault(
                                                                              currentUserDocument
                                                                                  ?.taskOrTaskee,
                                                                              '') ==
                                                                          'Taskee'
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 4.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.taskOrTaskee,
                                                          '') ==
                                                      'Taskee')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed: containerEventsRecord
                                                                    .interesseUsers
                                                                    .contains(
                                                                        currentUserReference)
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'EVENTS_COMPONENTE_INTERESTED_BTN_ON_TAP');
                                                                    logFirebaseEvent(
                                                                        'Button_backend_call');

                                                                    await containerEventsRecord
                                                                        .reference
                                                                        .update({
                                                                      ...mapToFirestore(
                                                                        {
                                                                          'interesseUsers':
                                                                              FieldValue.arrayUnion([
                                                                            currentUserReference
                                                                          ]),
                                                                        },
                                                                      ),
                                                                    });
                                                                    logFirebaseEvent(
                                                                        'Button_bottom_sheet');
                                                                    await showModalBottomSheet(
                                                                      isScrollControlled:
                                                                          true,
                                                                      backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                      enableDrag:
                                                                          false,
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Padding(
                                                                          padding:
                                                                              MediaQuery.viewInsetsOf(context),
                                                                          child:
                                                                              InteresseconfirmadoWidget(),
                                                                        );
                                                                      },
                                                                    ).then((value) =>
                                                                        safeSetState(
                                                                            () {}));
                                                                  },
                                                            text: 'Interested',
                                                            icon: Icon(
                                                              Icons.star,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: containerEventsRecord
                                                                    .usersRegistration
                                                                    .contains(
                                                                        currentUserReference)
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'EVENTS_COMPONENTE_REGISTER_BTN_ON_TAP');
                                                                    if (containerEventsRecord
                                                                            .usersRegistration
                                                                            .length
                                                                            .toString() ==
                                                                        containerEventsRecord
                                                                            .maximodepessoas
                                                                            .toString()) {
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                TaskcanceledCopyWidget(
                                                                              txt: 'This event is sold out.',
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                VcquerirnesseeventWidget(
                                                                              event: containerEventsRecord.reference,
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  },
                                                            text: 'Register',
                                                            icon: Icon(
                                                              Icons.how_to_reg,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  if (valueOrDefault(
                                                          currentUserDocument
                                                              ?.taskOrTaskee,
                                                          '') ==
                                                      'Tasker')
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  8.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          FFButtonWidget(
                                                            onPressed: containerEventsRecord
                                                                    .instrutores
                                                                    .contains(
                                                                        currentUserReference)
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'EVENTS_COMPONENTE_INSTRUCTOR_BTN_ON_TAP');
                                                                    if (containerEventsRecord
                                                                            .instrutores
                                                                            .length
                                                                            .toString() ==
                                                                        containerEventsRecord
                                                                            .maxInstrutores
                                                                            .toString()) {
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                TaskcanceledCopyWidget(
                                                                              txt: 'This event is no longer accepting instructors.',
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_navigate_to');

                                                                      context
                                                                          .pushNamed(
                                                                        InstrutoraccessionWidget
                                                                            .routeName,
                                                                        queryParameters:
                                                                            {
                                                                          'event':
                                                                              serializeParam(
                                                                            containerEventsRecord.reference,
                                                                            ParamType.DocumentReference,
                                                                          ),
                                                                        }.withoutNulls,
                                                                      );
                                                                    }
                                                                  },
                                                            text: 'Instructor',
                                                            icon: Icon(
                                                              Icons
                                                                  .school_rounded,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .tertiary,
                                                            ),
                                                          ),
                                                          FFButtonWidget(
                                                            onPressed: containerEventsRecord
                                                                    .performers
                                                                    .contains(
                                                                        currentUserReference)
                                                                ? null
                                                                : () async {
                                                                    logFirebaseEvent(
                                                                        'EVENTS_COMPONENTE_COMP_HELPER_BTN_ON_TAP');
                                                                    if (containerEventsRecord
                                                                            .performers
                                                                            .length
                                                                            .toString() ==
                                                                        containerEventsRecord
                                                                            .maxPeformers
                                                                            .toString()) {
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                TaskcanceledCopyWidget(
                                                                              txt: 'This event is no longer accepting helpers.',
                                                                            ),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    } else {
                                                                      logFirebaseEvent(
                                                                          'Button_bottom_sheet');
                                                                      await showModalBottomSheet(
                                                                        isScrollControlled:
                                                                            true,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        enableDrag:
                                                                            false,
                                                                        context:
                                                                            context,
                                                                        builder:
                                                                            (context) {
                                                                          return Padding(
                                                                            padding:
                                                                                MediaQuery.viewInsetsOf(context),
                                                                            child:
                                                                                TaskerinapprovalCopyWidget(),
                                                                          );
                                                                        },
                                                                      ).then((value) =>
                                                                          safeSetState(
                                                                              () {}));
                                                                    }
                                                                  },
                                                            text: 'Helper',
                                                            icon: Icon(
                                                              Icons.add_task,
                                                              size: 15.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .width *
                                                                  0.35,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          16.0,
                                                                          0.0,
                                                                          16.0,
                                                                          0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .tertiary,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        font: GoogleFonts
                                                                            .poppins(
                                                                          fontWeight: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontWeight,
                                                                          fontStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .fontStyle,
                                                                        ),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontWeight,
                                                                        fontStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .fontStyle,
                                                                      ),
                                                              elevation: 0.0,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          24.0),
                                                              hoverColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondary,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ].divide(SizedBox(height: 4.0)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
