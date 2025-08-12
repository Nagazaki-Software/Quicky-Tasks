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

import 'package:intl/intl.dart';

class CalendarBasedTasks extends StatefulWidget {
  const CalendarBasedTasks({
    super.key,
    this.width,
    this.height,
    required this.tasks,
    required this.onSelectedCalendar,
  });

  final double? width;
  final double? height;
  final List<TasksRecord> tasks;
  final Future Function(DateTime selected) onSelectedCalendar;

  @override
  State<CalendarBasedTasks> createState() => _CalendarBasedTasksState();
}

class _CalendarBasedTasksState extends State<CalendarBasedTasks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width ?? double.infinity,
      height: widget.height ?? 250,
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Exibindo todas as tarefas de todas as datas sem filtro
          Expanded(
            child: widget.tasks.isNotEmpty
                ? ListView.builder(
                    itemCount: widget.tasks.length, // Exibe todas as tarefas
                    itemBuilder: (context, index) {
                      final task = widget.tasks[index];

                      // Obtemos a data e o tempo de cada tarefa
                      final taskDate = task.data ?? DateTime.now();
                      final taskTime = task.tempo ?? DateTime.now();

                      // Formata o horário para HH:mm
                      final horario = DateFormat('HH:mm').format(taskTime);

                      return ListTile(
                        title: Text(task.titulo ?? 'Sem título'),
                        subtitle: Text(
                            'Horário: $horario'), // Exibe o horário da tarefa
                      );
                    },
                  )
                : Center(
                    child: Text(
                      'NO ACTIVE TASKS', // Exibe caso não haja tarefas
                      style: TextStyle(
                        fontSize: 16,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
