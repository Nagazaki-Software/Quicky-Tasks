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

import 'package:table_calendar/table_calendar.dart';

class CustomSelectableCalendar extends StatefulWidget {
  Future Function(DateTime dateSelected) onDateSelected;
  final double width;
  final double height;

  CustomSelectableCalendar(
      {Key? key,
      required this.onDateSelected,
      required this.width,
      required this.height})
      : super(key: key);

  @override
  State<CustomSelectableCalendar> createState() =>
      _CustomSelectableCalendarState();
}

class _CustomSelectableCalendarState extends State<CustomSelectableCalendar> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFB8A57B), // bege da imagem
        borderRadius: BorderRadius.circular(24),
      ),
      child: TableCalendar(
        firstDay: DateTime.utc(2020, 1, 1),
        lastDay: DateTime.utc(2030, 12, 31),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        onDaySelected: (selectedDay, focusedDay) async {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          await widget.onDateSelected(selectedDay);
        },
        headerStyle: HeaderStyle(
          titleCentered: true,
          formatButtonVisible: false,
          leftChevronIcon:
              const Icon(Icons.chevron_left, size: 18, color: Colors.black),
          rightChevronIcon:
              const Icon(Icons.chevron_right, size: 18, color: Colors.black),
          titleTextStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        calendarStyle: CalendarStyle(
          selectedDecoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          todayDecoration: const BoxDecoration(
            color: Colors.white24,
            shape: BoxShape.circle,
          ),
          weekendTextStyle: const TextStyle(color: Colors.black),
          defaultTextStyle: const TextStyle(color: Colors.black),
          todayTextStyle: const TextStyle(color: Colors.black),
          selectedTextStyle: const TextStyle(color: Colors.black),
        ),
        daysOfWeekStyle: const DaysOfWeekStyle(
          weekdayStyle: TextStyle(color: Colors.black, fontSize: 10),
          weekendStyle: TextStyle(color: Colors.black, fontSize: 10),
        ),
      ),
    );
  }
}
