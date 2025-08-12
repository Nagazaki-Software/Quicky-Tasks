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

class SideTabSelector extends StatefulWidget {
  final double width;
  final double height;

  const SideTabSelector({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  State<SideTabSelector> createState() => _SideTabSelectorState();
}

class _SideTabSelectorState extends State<SideTabSelector> {
  final List<String> tabs = [
    "Active Tasks",
    "Messages & Calendar",
    "Completed Tasks",
  ];

  @override
  Widget build(BuildContext context) {
    final selectedTab = FFAppState().selectedTabName;

    return Container(
      width: widget.width,
      height: widget.height,
      color: getTabColor(selectedTab),
      child: Column(
        children: [
          const SizedBox(height: 40),
          const Icon(Icons.more_vert, color: Colors.white),
          const SizedBox(height: 20),
          ...tabs.map((tab) {
            final isSelected = tab == selectedTab;

            return GestureDetector(
              onTap: () {
                FFAppState().update(() {
                  FFAppState().selectedTabName = tab;
                });
              },
              child: Container(
                margin: const EdgeInsets.only(
                    right: 8, top: 20, bottom: 20, left: 0),
                child: ClipPath(
                  clipper: isSelected ? SoftCurveClipper() : null,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 900,
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? const Color(0xFFFDEEDC)
                          : Colors.transparent,
                      boxShadow: isSelected
                          ? [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.6),
                                offset: const Offset(2, 2),
                                blurRadius: 4,
                              ),
                            ]
                          : [],
                    ),
                    alignment: Alignment.center,
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Text(
                        tab,
                        style: TextStyle(
                          color: isSelected ? getTabColor(tab) : Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  Color getTabColor(String tab) {
    switch (tab) {
      case 'Active Tasks':
        return const Color(0xFFFBB03B);
      case 'Messages \n& Calendar':
        return const Color(0xFF98B28E);
      case 'Completed Tasks':
        return const Color(0xFF8B5B3C);
      default:
        return Color(0xFF98B28E);
    }
  }
}

class SoftCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.moveTo(0, 0);

    // Curva superior super achatada
    path.quadraticBezierTo(
      size.width * 0.45,
      size.height * 0.01, // Quase reto no topo
      size.width * 0.70,
      size.height * 0.2,
    );

    // Curva do meio ainda bem "gordinha" mas suave
    path.quadraticBezierTo(
      size.width * 1.5,
      size.height * 0.5,
      size.width * 0.8,
      size.height * 0.8,
    );

    // Curva inferior achatada também
    path.quadraticBezierTo(
      size.width * 0.35,
      size.height * 0.90, // Quase no fim, mas achatada
      0.9,
      size.height,
    );

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
