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

class TimeList30MinHorizontal extends StatefulWidget {
  final double? width;
  final double? height;
  final Future Function(DateTime selectedTime)? onTimeSelected;
  final List<TasksRecord> tasks; // ✅ Correto agora
  final Color? color;

  const TimeList30MinHorizontal({
    Key? key,
    required this.width,
    required this.height,
    this.onTimeSelected,
    required this.tasks,
    this.color = const Color(0xFF242424),
  }) : super(key: key);

  @override
  _TimeList30MinState createState() => _TimeList30MinState();
}

class _TimeList30MinState extends State<TimeList30MinHorizontal> {
  late List<DateTime> taskTimes;
  late ScrollController _scrollController;
  late int selectedIndex;
  final double itemWidth = 100; // Largura dos itens
  final double itemSpacing = 20; // Espaçamento entre os itens

  @override
  void initState() {
    super.initState();
    taskTimes = _getTaskTimes(); // Get the unique task times
    _scrollController = ScrollController();
    selectedIndex = _getClosestTimeIndex();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToInitialIndex();
      _updateHorarioAppState(selectedIndex);
    });

    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  // Corrigido o tipo da lista para DateTime (não nullable)
  List<DateTime> _getTaskTimes() {
    final taskTimesList = widget.tasks
        .map((task) => task.tempo)
        .where((time) => time != null) // Filtra nulos
        .map((time) => time!) // Desempacota para garantir que é não nulo
        .toSet()
        .toList(); // Remove duplicates

    taskTimesList.sort((a, b) => a.compareTo(b)); // Ordena por horário
    return taskTimesList;
  }

  int _getClosestTimeIndex() {
    final now = DateTime.now();
    final totalMinutes = now.hour * 60 + now.minute;
    final roundedMinutes = ((totalMinutes + 29) ~/ 30) * 30;
    final roundedHour = roundedMinutes ~/ 60;
    final roundedMinute = roundedMinutes % 60;
    final roundedTime =
        DateTime(now.year, now.month, now.day, roundedHour, roundedMinute);

    return taskTimes.indexWhere((t) => t.isAtSameMomentAs(roundedTime));
  }

  Future<void> _scrollToInitialIndex() async {
    final screenCenter = widget.width! / 2;
    final offset = (itemWidth + itemSpacing) * selectedIndex -
        screenCenter +
        itemWidth / 2;
    _scrollController
        .jumpTo(offset.clamp(0.0, _scrollController.position.maxScrollExtent));
  }

  Future<void> _scrollToIndex(int index) async {
    final screenCenter = widget.width! / 2;
    final offset =
        (itemWidth + itemSpacing) * index - screenCenter + itemWidth / 2;
    await _scrollController.animateTo(
      offset.clamp(0.0, _scrollController.position.maxScrollExtent),
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final screenCenter = widget.width! / 2;
    final scrollOffset = _scrollController.offset;
    final centerPosition = scrollOffset + screenCenter;
    final index = (centerPosition / (itemWidth + itemSpacing)).round();

    if (index >= 0 && index < taskTimes.length && index != selectedIndex) {
      setState(() {
        selectedIndex = index;
      });

      _updateHorarioAppState(index);
    }
  }

  void _updateHorarioAppState(int index) {
    final selected = taskTimes[index];
    FFAppState().horarioCurrentTasks = selected;

    if (widget.onTimeSelected != null) {
      widget.onTimeSelected!(selected);
    }
  }

  String _formatTime(DateTime time) {
    final formattedTime = DateFormat('HH:mm').format(time);
    return formattedTime;
  }

  String _formatDay(DateTime date) {
    final formattedDay =
        DateFormat('EEEE', 'en_US').format(date); // Day in English
    return formattedDay;
  }

  // Função para buscar a categoria da tarefa no horário
  String _getTaskCategory(DateTime time) {
    // Procurar pela tarefa que tenha o mesmo horário
    TasksRecord? task; // Definimos uma variável de tarefa que pode ser null

    for (var t in widget.tasks) {
      if (t.tempo?.hour == time.hour && t.tempo?.minute == time.minute) {
        task = t; // Atribui a tarefa se encontrar uma correspondente
        break; // Encerra o loop se encontrar
      }
    }

    // Se não encontrar tarefa, retorna 'Sem Categoria'
    if (task == null) {
      return 'Sem Categoria';
    }

    // Caso contrário, retorna a categoria da tarefa
    return task.categoria ?? 'Sem Categoria';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.transparent, // SEM FUNDO PRETO AQUI
      child: ListView.builder(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        itemCount: taskTimes.length,
        physics: BouncingScrollPhysics(), // Rolagem suave
        itemBuilder: (context, index) {
          final taskTime = taskTimes[index];
          final formattedTime = _formatTime(taskTime);
          final formattedDay = _formatDay(taskTime);
          final taskCategory =
              _getTaskCategory(taskTime); // Aqui pegamos a categoria

          return GestureDetector(
            onTap: () async {
              setState(() {
                selectedIndex = index;
              });
              await _scrollToIndex(index);
              _updateHorarioAppState(index);
            },
            child: Container(
              width: itemWidth,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.centerLeft, // Alinhado à esquerda
              color: Colors.transparent, // SEM FUNDO PRETO AQUI
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment
                    .start, // Alinha todos os itens à esquerda
                children: [
                  // Categoria da Tarefa
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Text(
                      taskCategory, // Exibe a categoria da tarefa
                      style: TextStyle(
                        color: widget.color!,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        fontStyle:
                            FontStyle.italic, // Destaque para a categoria
                      ),
                    ),
                  ),
                  // Dia da Tarefa
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      formattedDay, // Exibe o dia da semana
                      style: TextStyle(
                        color: widget.color!,
                        fontSize: 14,
                        fontWeight: FontWeight.w600, // Leve ênfase no dia
                      ),
                    ),
                  ),
                  // Hora da Tarefa
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Text(
                      formattedTime, // Exibe o horário da tarefa
                      style: TextStyle(
                        color: widget.color!,
                        fontSize: 16,
                        fontWeight: FontWeight.w600, // Leve ênfase no horário
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
