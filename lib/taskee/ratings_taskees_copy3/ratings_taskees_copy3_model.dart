import '/backend/backend.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'ratings_taskees_copy3_widget.dart' show RatingsTaskeesCopy3Widget;
import 'package:flutter/material.dart';

class RatingsTaskeesCopy3Model
    extends FlutterFlowModel<RatingsTaskeesCopy3Widget> {
  ///  Local state fields for this page.

  int? feedback1;

  int? feedback2;

  int? feedback3;

  int? feedback4;

  int? feedback5;

  int? indexs = 0;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<TasksRecord>? queryTasksForIndex;
  // Model for navBar component.
  late NavBarModel navBarModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
  }
}
