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

class TimeList30Min extends StatefulWidget {
  final double width;
  final double height;
  final Future<void> Function(DateTime selectedTime)?
      onTimeSelected; // ✅ Nome claro para o FlutterFlow

  const TimeList30Min({
    Key? key,
    required this.width,
    required this.height,
    this.onTimeSelected,
  }) : super(key: key);

  @override
  _TimeList30MinState createState() => _TimeList30MinState();
}

class _TimeList30MinState extends State<TimeList30Min> {
  late FixedExtentScrollController _scrollController;
  late List<TimeOfDay> times;
  int selectedIndex = 24; // Começa em 12:00 PM

  @override
  void initState() {
    super.initState();
    times = _generateTimes();
    _scrollController = FixedExtentScrollController(initialItem: selectedIndex);
  }

  List<TimeOfDay> _generateTimes() {
    return List.generate(48, (index) {
      int hour = index ~/ 2;
      int minute = (index % 2) * 30;
      return TimeOfDay(hour: hour, minute: minute);
    });
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'A.M' : 'P.M';
    return '$hour:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: const Color.fromARGB(0, 253, 238, 220),
      child: ListWheelScrollView.useDelegate(
        controller: _scrollController,
        itemExtent: 40, // 🔽 Aproxima os itens verticalmente
        diameterRatio: 3.5,
        perspective: 0.003,
        physics: const FixedExtentScrollPhysics(),
        onSelectedItemChanged: (index) async {
          setState(() {
            selectedIndex = index;
          });

          if (widget.onTimeSelected != null) {
            final now = DateTime.now();
            final selected = times[index];
            final selectedDateTime = DateTime(
              now.year,
              now.month,
              now.day,
              selected.hour,
              selected.minute,
            );
            await widget
                .onTimeSelected!(selectedDateTime); // ✅ Callback nomeado
          }
        },
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            if (index < 0 || index >= times.length) return null;

            final time = times[index];
            final formatted = _formatTime(time);
            final parts = formatted.split(':');
            final hour = parts[0];
            final minuteAndPeriod = parts[1].split(' ');
            final minute = minuteAndPeriod[0];
            final period = minuteAndPeriod[1];

            final isSelected = index == selectedIndex;

            return Center(
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '$hour:$minute ',
                      style: TextStyle(
                        color: Colors.brown.withOpacity(isSelected ? 1.0 : 0.2),
                        fontSize: isSelected ? 28 : 20,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                    TextSpan(
                      text: period,
                      style: TextStyle(
                        color: Colors.brown.withOpacity(isSelected ? 1.0 : 0.2),
                        fontSize: isSelected ? 20 : 14,
                        fontWeight:
                            isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
