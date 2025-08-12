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

class EventLive extends StatefulWidget {
  const EventLive({
    super.key,
    this.width,
    this.height,
    required this.containerEvent,
    required this.eventList,
    required this.colors, // Adicionando o parâmetro colors
  });

  final double? width;
  final double? height;
  final Widget Function(DocumentReference eventRef) containerEvent;
  final List<EventsRecord> eventList;
  final Color colors; // Definindo o tipo Color

  @override
  State<EventLive> createState() => _EventLiveState();
}

class _EventLiveState extends State<EventLive> {
  // Método para verificar se as datas são do mesmo dia
  bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  // Método para formatar a hora no estilo AM/PM
  String formatTime(DateTime date) {
    final hour = date.hour;
    final minute = date.minute;

    // Formato de hora em 12h (AM/PM)
    final formattedHour = (hour % 12 == 0) ? 12 : hour % 12;
    final period = (hour >= 12) ? "PM" : "AM";

    // Exibir a hora em formato texto
    return "$formattedHour:${minute.toString().padLeft(2, '0')} $period";
  }

  String getEventText(DateTime eventDate) {
    final today = DateTime.now();

    // Verifica se o evento é no mesmo dia
    if (isSameDay(today, eventDate)) {
      return "Today in ${formatTime(eventDate)}";
    }

    // Caso não seja hoje, retorna apenas o horário do evento
    return "Event in ${formatTime(eventDate)}";
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

        final eventText = getEventText(eventDate);

        // Gerar o conteúdo do evento com o texto formatado e o container do evento
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              eventText,
              style: FlutterFlowTheme.of(context).titleMedium.copyWith(
                    color: widget
                        .colors, // Usando o parâmetro colors para definir a cor do texto
                  ),
            ),
            widget.containerEvent(
                event.reference), // Adicionando o container do evento
          ],
        );
      },
    );
  }
}
