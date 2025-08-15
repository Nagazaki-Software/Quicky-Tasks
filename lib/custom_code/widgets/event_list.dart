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

class EventList extends StatefulWidget {
  const EventList({
    super.key,
    this.width,
    this.height,
    required this.containerEvent,
    required this.eventList,
    required this.colorText, // Passando colorText como parâmetro
  });

  final double? width;
  final double? height;
  final Widget Function(DocumentReference eventRef) containerEvent;
  final List<EventsRecord> eventList;
  final Color colorText; // Variável para a cor do texto

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  // Método para verificar se as datas são do mesmo dia
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  String getEventDayText(DateTime eventDate) {
    final today = DateTime.now();
    final tomorrow = today.add(Duration(days: 1));

    // Verifica se é hoje
    if (isSameDay(today, eventDate)) {
      return "Today";
    }

    // Verifica se é amanhã
    if (isSameDay(tomorrow, eventDate)) {
      return "Tomorrow";
    }

    // Se não for hoje nem amanhã, verifica o dia da semana
    final dayOfWeek = getDayOfWeek(eventDate);
    return dayOfWeek;
  }

  String getDayOfWeek(DateTime date) {
    // Formatar o dia da semana
    switch (date.weekday) {
      case DateTime.monday:
        return "Monday";
      case DateTime.tuesday:
        return "Tuesday";
      case DateTime.wednesday:
        return "Wednesday";
      case DateTime.thursday:
        return "Thursday";
      case DateTime.friday:
        return "Friday";
      case DateTime.saturday:
        return "Saturday";
      case DateTime.sunday:
        return "Sunday";
      default:
        return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.eventList.length,
      itemBuilder: (context, index) {
        final event = widget.eventList[index];

        // Verificar se o campo 'horario' é um Timestamp ou DateTime
        DateTime eventDate;
        if (event.horario is Timestamp) {
          eventDate = (event.horario as Timestamp)
              .toDate(); // Se for Timestamp, converte para DateTime
        } else {
          eventDate = event.horario ??
              DateTime.now(); // Se for DateTime, usa diretamente
        }

        final eventDayText = getEventDayText(eventDate);

        // Gerar o conteúdo do evento com o texto formatado e o container do evento
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Aplica a cor do texto 'colorText' no título e usa a fonte Poppins
            Text(
              eventDayText,
              style: TextStyle(
                fontFamily: 'Poppins', // Define a fonte como Poppins
                fontSize: 18, // Tamanho da fonte
                fontWeight: FontWeight.w600, // Peso da fonte (opcional)
                color: widget.colorText, // Altera a cor do texto
              ),
            ),
            SizedBox(
                height:
                    5), // Adiciona espaço entre o texto e o widget do evento
            widget.containerEvent(
                event.reference), // Adicionando o container do evento
          ],
        );
      },
    );
  }
}
