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

class SwipeSwitch extends StatefulWidget {
  final Color activeColor;
  final Color inactiveColor;
  final Future Function(bool onOrNot) onSwitch;
  final double width;
  final double height;
  final bool isTasker;

  const SwipeSwitch({
    Key? key,
    required this.activeColor,
    required this.inactiveColor,
    required this.onSwitch,
    this.width = 60.0,
    this.height = 30.0,
    required this.isTasker,
  }) : super(key: key);

  @override
  _SwipeSwitchState createState() => _SwipeSwitchState();
}

class _SwipeSwitchState extends State<SwipeSwitch> {
  bool _isActive = false;
  double _dragPosition = 0;

  @override
  void initState() {
    super.initState();
    _initializeSwitchState();
  }

  void _initializeSwitchState() {
    setState(() {
      _isActive = widget.isTasker;
      _dragPosition = _isActive ? widget.width - widget.height : 0;
    });
  }

  void _onPanUpdate(DragUpdateDetails details) {
    setState(() {
      _dragPosition += details.delta.dx;
      _dragPosition = _dragPosition.clamp(0.0, widget.width - widget.height);
    });
  }

  void _onPanEnd(DragEndDetails details) async {
    bool newState = _dragPosition > (widget.width - widget.height) / 2;

    if (newState != _isActive) {
      setState(() {
        _isActive = newState;
        _dragPosition = newState ? widget.width - widget.height : 0;
      });
      await widget.onSwitch(_isActive);
    } else {
      setState(() {
        _dragPosition = _isActive ? widget.width - widget.height : 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double knobSize = widget.height * 0.3;

    return GestureDetector(
      onPanUpdate: _onPanUpdate,
      onPanEnd: _onPanEnd,
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          color: const Color(0xFFF8F5F0), // fundo mais suave
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFBCA674), width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              left: _dragPosition + (widget.height - knobSize) / 2,
              top: (widget.height - knobSize) / 2,
              child: Container(
                width: knobSize,
                height: knobSize,
                decoration: BoxDecoration(
                  color: _isActive ? widget.activeColor : widget.inactiveColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
