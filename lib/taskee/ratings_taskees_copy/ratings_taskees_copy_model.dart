import '/components/nav_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ratings_taskees_copy_widget.dart' show RatingsTaskeesCopyWidget;
import 'package:flutter/material.dart';

class RatingsTaskeesCopyModel
    extends FlutterFlowModel<RatingsTaskeesCopyWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel1;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel2;

  @override
  void initState(BuildContext context) {
    navBarCopyModel1 = createModel(context, () => NavBarCopyModel());
    navBarCopyModel2 = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    navBarCopyModel1.dispose();
    navBarCopyModel2.dispose();
  }
}
