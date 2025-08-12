// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TempodeesperatasksStruct extends FFFirebaseStruct {
  TempodeesperatasksStruct({
    DateTime? proximohorario,
    DocumentReference? tasks,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _proximohorario = proximohorario,
        _tasks = tasks,
        super(firestoreUtilData);

  // "proximohorario" field.
  DateTime? _proximohorario;
  DateTime? get proximohorario => _proximohorario;
  set proximohorario(DateTime? val) => _proximohorario = val;

  bool hasProximohorario() => _proximohorario != null;

  // "tasks" field.
  DocumentReference? _tasks;
  DocumentReference? get tasks => _tasks;
  set tasks(DocumentReference? val) => _tasks = val;

  bool hasTasks() => _tasks != null;

  static TempodeesperatasksStruct fromMap(Map<String, dynamic> data) =>
      TempodeesperatasksStruct(
        proximohorario: data['proximohorario'] as DateTime?,
        tasks: data['tasks'] as DocumentReference?,
      );

  static TempodeesperatasksStruct? maybeFromMap(dynamic data) => data is Map
      ? TempodeesperatasksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'proximohorario': _proximohorario,
        'tasks': _tasks,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'proximohorario': serializeParam(
          _proximohorario,
          ParamType.DateTime,
        ),
        'tasks': serializeParam(
          _tasks,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static TempodeesperatasksStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TempodeesperatasksStruct(
        proximohorario: deserializeParam(
          data['proximohorario'],
          ParamType.DateTime,
          false,
        ),
        tasks: deserializeParam(
          data['tasks'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tasks'],
        ),
      );

  @override
  String toString() => 'TempodeesperatasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TempodeesperatasksStruct &&
        proximohorario == other.proximohorario &&
        tasks == other.tasks;
  }

  @override
  int get hashCode => const ListEquality().hash([proximohorario, tasks]);
}

TempodeesperatasksStruct createTempodeesperatasksStruct({
  DateTime? proximohorario,
  DocumentReference? tasks,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TempodeesperatasksStruct(
      proximohorario: proximohorario,
      tasks: tasks,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TempodeesperatasksStruct? updateTempodeesperatasksStruct(
  TempodeesperatasksStruct? tempodeesperatasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tempodeesperatasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTempodeesperatasksStructData(
  Map<String, dynamic> firestoreData,
  TempodeesperatasksStruct? tempodeesperatasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tempodeesperatasks == null) {
    return;
  }
  if (tempodeesperatasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tempodeesperatasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tempodeesperatasksData =
      getTempodeesperatasksFirestoreData(tempodeesperatasks, forFieldValue);
  final nestedData =
      tempodeesperatasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      tempodeesperatasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTempodeesperatasksFirestoreData(
  TempodeesperatasksStruct? tempodeesperatasks, [
  bool forFieldValue = false,
]) {
  if (tempodeesperatasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tempodeesperatasks.toMap());

  // Add any Firestore field values
  tempodeesperatasks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTempodeesperatasksListFirestoreData(
  List<TempodeesperatasksStruct>? tempodeesperataskss,
) =>
    tempodeesperataskss
        ?.map((e) => getTempodeesperatasksFirestoreData(e, true))
        .toList() ??
    [];
