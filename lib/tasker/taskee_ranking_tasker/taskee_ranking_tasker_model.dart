import '/components/nav_bar_copy_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'taskee_ranking_tasker_widget.dart' show TaskeeRankingTaskerWidget;
import 'package:flutter/material.dart';

class TaskeeRankingTaskerModel
    extends FlutterFlowModel<TaskeeRankingTaskerWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for navBarCopy component.
  late NavBarCopyModel navBarCopyModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  @override
  void initState(BuildContext context) {
    navBarCopyModel = createModel(context, () => NavBarCopyModel());
  }

  @override
  void dispose() {
    navBarCopyModel.dispose();
  }
}
