// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<DocumentReference?> tasksindexs(
  List<TasksRecord>? tasks, // Lista de tarefas
  int? indexs, // Índice da tarefa desejada
  Future Function(DocumentReference? taskRef)? onIndexsTasks, // Função callback
) async {
  // Verifica se a lista de tarefas e o índice são válidos
  if (tasks == null ||
      tasks.isEmpty ||
      indexs == null ||
      indexs < 0 ||
      indexs >= tasks.length) {
    // Se os parâmetros forem inválidos, retorna null ou pode mostrar um erro
    return null;
  }

  // Obtém a tarefa correspondente ao índice
  final task = tasks[indexs];

  // Executa o callback passando a referência da tarefa (DocumentReference)
  if (onIndexsTasks != null) {
    await onIndexsTasks(
        task.reference); // Chama o callback com a referência da tarefa
  }

  // Retorna a referência da tarefa para possíveis usos adicionais
  return task.reference;
}
