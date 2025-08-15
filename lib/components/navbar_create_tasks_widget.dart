import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'navbar_create_tasks_model.dart';
export 'navbar_create_tasks_model.dart';

class NavbarCreateTasksWidget extends StatefulWidget {
  const NavbarCreateTasksWidget({
    super.key,
    required this.pages,
  });

  final String? pages;

  @override
  State<NavbarCreateTasksWidget> createState() =>
      _NavbarCreateTasksWidgetState();
}

class _NavbarCreateTasksWidgetState extends State<NavbarCreateTasksWidget> {
  late NavbarCreateTasksModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NavbarCreateTasksModel());

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
      height: 70.0,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 68.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
            ),
          ),
          Align(
            alignment: AlignmentDirectional(0.0, -1.0),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -1.0),
                    child: Container(
                      height: 72.0,
                      child: Stack(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        children: [
                          if (widget.pages == 'The Task')
                            Container(
                              width: 100.0,
                              height: 100.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.contain,
                                  alignment: AlignmentDirectional(0.0, 1.0),
                                  image: Image.asset(
                                    'assets/images/Tab_branca_pagina_de_criar_task.Branco.png',
                                  ).image,
                                ),
                              ),
                            ),
                          Align(
                            alignment: AlignmentDirectional(0.0, 1.0),
                            child: Text(
                              'The Task',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    font: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w200,
                                      fontStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .fontStyle,
                                    ),
                                    color: widget.pages == 'The Task'
                                        ? FlutterFlowTheme.of(context)
                                            .secondaryBackground
                                        : FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    fontSize: 12.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 72.0,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        if (widget.pages == 'Photos')
                          Container(
                            width: 100.0,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                alignment: AlignmentDirectional(0.0, 1.0),
                                image: Image.asset(
                                  'assets/images/Tab_branca_pagina_de_criar_task.Branco.png',
                                ).image,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Text(
                            'Photos',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: widget.pages == 'Photos'
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 72.0,
                    child: Stack(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      children: [
                        if (widget.pages == 'Request')
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                alignment: AlignmentDirectional(0.0, 1.0),
                                image: Image.asset(
                                  'assets/images/Tab_branca_pagina_de_criar_task.Branco.png',
                                ).image,
                              ),
                            ),
                          ),
                        Align(
                          alignment: AlignmentDirectional(0.0, 1.0),
                          child: Text(
                            'Request',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  font: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w200,
                                    fontStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .fontStyle,
                                  ),
                                  color: widget.pages == 'Request'
                                      ? FlutterFlowTheme.of(context)
                                          .secondaryBackground
                                      : FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  fontSize: 12.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w200,
                                  fontStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .fontStyle,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ].divide(SizedBox(width: 20.0)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
