import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ratings_taskee_widget.dart' show RatingsTaskeeWidget;
import 'package:flutter/material.dart';

class RatingsTaskeeModel extends FlutterFlowModel<RatingsTaskeeWidget> {
  ///  State fields for stateful widgets in this page.

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
