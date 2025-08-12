// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TasksAceitasStruct extends FFFirebaseStruct {
  TasksAceitasStruct({
    DocumentReference? taskReference,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _taskReference = taskReference,
        super(firestoreUtilData);

  // "taskReference" field.
  DocumentReference? _taskReference;
  DocumentReference? get taskReference => _taskReference;
  set taskReference(DocumentReference? val) => _taskReference = val;

  bool hasTaskReference() => _taskReference != null;

  static TasksAceitasStruct fromMap(Map<String, dynamic> data) =>
      TasksAceitasStruct(
        taskReference: data['taskReference'] as DocumentReference?,
      );

  static TasksAceitasStruct? maybeFromMap(dynamic data) => data is Map
      ? TasksAceitasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'taskReference': _taskReference,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'taskReference': serializeParam(
          _taskReference,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TasksAceitasStruct fromSerializableMap(Map<String, dynamic> data) =>
      TasksAceitasStruct(
        taskReference: deserializeParam(
          data['taskReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tasks'],
        ),
      );

  @override
  String toString() => 'TasksAceitasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TasksAceitasStruct && taskReference == other.taskReference;
  }

  @override
  int get hashCode => const ListEquality().hash([taskReference]);
}

TasksAceitasStruct createTasksAceitasStruct({
  DocumentReference? taskReference,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TasksAceitasStruct(
      taskReference: taskReference,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TasksAceitasStruct? updateTasksAceitasStruct(
  TasksAceitasStruct? tasksAceitas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tasksAceitas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTasksAceitasStructData(
  Map<String, dynamic> firestoreData,
  TasksAceitasStruct? tasksAceitas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tasksAceitas == null) {
    return;
  }
  if (tasksAceitas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tasksAceitas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tasksAceitasData =
      getTasksAceitasFirestoreData(tasksAceitas, forFieldValue);
  final nestedData =
      tasksAceitasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tasksAceitas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTasksAceitasFirestoreData(
  TasksAceitasStruct? tasksAceitas, [
  bool forFieldValue = false,
]) {
  if (tasksAceitas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tasksAceitas.toMap());

  // Add any Firestore field values
  tasksAceitas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTasksAceitasListFirestoreData(
  List<TasksAceitasStruct>? tasksAceitass,
) =>
    tasksAceitass?.map((e) => getTasksAceitasFirestoreData(e, true)).toList() ??
    [];
