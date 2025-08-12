// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

class VerticalOvalTab extends StatelessWidget {
  final bool isSelected;
  final Color activeColor;
  final Color inactiveColor;
  final double width;
  final double height;
  final double borderWidth;

  const VerticalOvalTab({
    Key? key,
    required this.isSelected,
    required this.width,
    required this.height,
    this.borderWidth = 2.0,
    this.activeColor = const Color(0xFFFFB84D),
    this.inactiveColor = const Color(0xFFE0E0E0),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: 1, // gira 90 graus
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.transparent, // sem preenchimento
          border: Border.all(
            color: isSelected ? activeColor : inactiveColor,
            width: borderWidth,
          ),
          borderRadius: BorderRadius.circular(height / 2),
        ),
      ),
    );
  }
}
