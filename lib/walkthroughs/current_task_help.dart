import 'package:flutter/material.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '/components/walkthroght_current_page_step1_widget.dart';
import '/components/walkthroght_current_page_step2_widget.dart';
import '/components/walkthroght_current_page_step2_copy_widget.dart';

// Focus widget keys for this walkthrough
final containerB60ulmry = GlobalKey();
final containerLw45w487 = GlobalKey();
final containerXszd9e48 = GlobalKey();

/// currentTask help
///
///
List<TargetFocus> createWalkthroughTargets(BuildContext context) => [
      /// Step 1
      TargetFocus(
        keyTarget: containerB60ulmry,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            builder: (context, __) => WalkthroghtCurrentPageStep1Widget(),
          ),
        ],
      ),

      /// Step 2
      TargetFocus(
        keyTarget: containerLw45w487,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => WalkthroghtCurrentPageStep2Widget(),
          ),
        ],
      ),

      /// Step 3
      TargetFocus(
        keyTarget: containerXszd9e48,
        enableOverlayTab: true,
        alignSkip: Alignment.bottomRight,
        shape: ShapeLightFocus.Circle,
        color: Colors.black,
        contents: [
          TargetContent(
            align: ContentAlign.left,
            builder: (context, __) => WalkthroghtCurrentPageStep2CopyWidget(),
          ),
        ],
      ),
    ];
