import '/components/nav_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ratings_tasker_widget.dart' show RatingsTaskerWidget;
import 'package:flutter/material.dart';

class RatingsTaskerModel extends FlutterFlowModel<RatingsTaskerWidget> {
  ///  Local state fields for this page.

  int? feedback1;

  int? feedback2;

  int? feedback3;

  int? feedback4;

  int? feedback5;

  int? indexs = 0;

  ///  State fields for stateful widgets in this page.

  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;

  @override
  void initState(BuildContext context) {
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    navBarCopyModel.dispose();
  }
}
