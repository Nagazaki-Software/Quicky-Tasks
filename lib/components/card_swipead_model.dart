import '/components/swipe_mapes_widget.dart';
import '/components/textfield_swipe_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'card_swipead_widget.dart' show CardSwipeadWidget;
import 'package:flutter/material.dart';

class CardSwipeadModel extends FlutterFlowModel<CardSwipeadWidget> {
  ///  Local state fields for this component.

  bool flip = false;

  ///  State fields for stateful widgets in this component.

  // State field(s) for PageView widget.
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
          pageViewController!.hasClients &&
          pageViewController!.page != null
      ? pageViewController!.page!.round()
      : 0;
  // Model for swipeMapes component.
  late SwipeMapesModel swipeMapesModel;
  // Model for textfieldSwipe component.
  late TextfieldSwipeModel textfieldSwipeModel;

  @override
  void initState(BuildContext context) {
    swipeMapesModel = createModel(context, () => SwipeMapesModel());
    textfieldSwipeModel = createModel(context, () => TextfieldSwipeModel());
  }

  @override
  void dispose() {
    swipeMapesModel.dispose();
    textfieldSwipeModel.dispose();
  }
}
