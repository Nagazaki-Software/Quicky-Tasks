import '/backend/backend.dart';
import '/components/navbar_create_tasks_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_google_map.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'request_create_task_widget.dart' show RequestCreateTaskWidget;
import 'package:flutter/material.dart';

class RequestCreateTaskModel extends FlutterFlowModel<RequestCreateTaskWidget> {
  ///  Local state fields for this page.

  int? fastPass;

  DateTime? horas;

  bool meOrTasker = true;

  ///  State fields for stateful widgets in this page.

  // Model for navbarCreateTasks component.
  late NavbarCreateTasksModel navbarCreateTasksModel;
  // State field(s) for Checkbox widget.
  bool? checkboxValue1;
  // State field(s) for Checkbox widget.
  bool? checkboxValue2;
  // State field(s) for Calendar widget.
  DateTimeRange? calendarSelectedDay;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for GoogleMap widget.
  LatLng? googleMapsCenter;
  final googleMapsController = Completer<GoogleMapController>();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue1 = FFPlace();
  // State field(s) for PlacePicker widget.
  FFPlace placePickerValue2 = FFPlace();
  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  TasksRecord? taskDocument;

  @override
  void initState(BuildContext context) {
    navbarCreateTasksModel =
        createModel(context, () => NavbarCreateTasksModel());
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  void dispose() {
    navbarCreateTasksModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();
  }
}
