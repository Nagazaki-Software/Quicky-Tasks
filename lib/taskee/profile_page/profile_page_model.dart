import '/components/nav_bar_copy_widget.dart';
import '/components/nav_bar_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBar component.
  late NavBarModel navBarModel;
  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;

  @override
  void initState(BuildContext context) {
    navBarModel = createModel(context, () => NavBarModel());
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    navBarModel.dispose();
    navBarCopyModel.dispose();
  }
}
