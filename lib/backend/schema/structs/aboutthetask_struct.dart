// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AboutthetaskStruct extends FFFirebaseStruct {
  AboutthetaskStruct({
    int? satisfiedTask,
    int? taskinstructions,
    int? qualityDelivery,
    int? feelpricereceveid,
    String? improveFutureTasks,
    String? satisfiedTasktxt,
    String? taskinstucoestxt,
    String? qualityDeliverytxt,
    String? fellpricedeliveriedtxt,
    DocumentReference? task,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _satisfiedTask = satisfiedTask,
        _taskinstructions = taskinstructions,
        _qualityDelivery = qualityDelivery,
        _feelpricereceveid = feelpricereceveid,
        _improveFutureTasks = improveFutureTasks,
        _satisfiedTasktxt = satisfiedTasktxt,
        _taskinstucoestxt = taskinstucoestxt,
        _qualityDeliverytxt = qualityDeliverytxt,
        _fellpricedeliveriedtxt = fellpricedeliveriedtxt,
        _task = task,
        super(firestoreUtilData);

  // "satisfiedTask" field.
  int? _satisfiedTask;
  int get satisfiedTask => _satisfiedTask ?? 0;
  set satisfiedTask(int? val) => _satisfiedTask = val;

  void incrementSatisfiedTask(int amount) =>
      satisfiedTask = satisfiedTask + amount;

  bool hasSatisfiedTask() => _satisfiedTask != null;

  // "taskinstructions" field.
  int? _taskinstructions;
  int get taskinstructions => _taskinstructions ?? 0;
  set taskinstructions(int? val) => _taskinstructions = val;

  void incrementTaskinstructions(int amount) =>
      taskinstructions = taskinstructions + amount;

  bool hasTaskinstructions() => _taskinstructions != null;

  // "qualityDelivery" field.
  int? _qualityDelivery;
  int get qualityDelivery => _qualityDelivery ?? 0;
  set qualityDelivery(int? val) => _qualityDelivery = val;

  void incrementQualityDelivery(int amount) =>
      qualityDelivery = qualityDelivery + amount;

  bool hasQualityDelivery() => _qualityDelivery != null;

  // "feelpricereceveid" field.
  int? _feelpricereceveid;
  int get feelpricereceveid => _feelpricereceveid ?? 0;
  set feelpricereceveid(int? val) => _feelpricereceveid = val;

  void incrementFeelpricereceveid(int amount) =>
      feelpricereceveid = feelpricereceveid + amount;

  bool hasFeelpricereceveid() => _feelpricereceveid != null;

  // "improveFutureTasks" field.
  String? _improveFutureTasks;
  String get improveFutureTasks => _improveFutureTasks ?? '';
  set improveFutureTasks(String? val) => _improveFutureTasks = val;

  bool hasImproveFutureTasks() => _improveFutureTasks != null;

  // "satisfiedTasktxt" field.
  String? _satisfiedTasktxt;
  String get satisfiedTasktxt => _satisfiedTasktxt ?? '';
  set satisfiedTasktxt(String? val) => _satisfiedTasktxt = val;

  bool hasSatisfiedTasktxt() => _satisfiedTasktxt != null;

  // "taskinstucoestxt" field.
  String? _taskinstucoestxt;
  String get taskinstucoestxt => _taskinstucoestxt ?? '';
  set taskinstucoestxt(String? val) => _taskinstucoestxt = val;

  bool hasTaskinstucoestxt() => _taskinstucoestxt != null;

  // "qualityDeliverytxt" field.
  String? _qualityDeliverytxt;
  String get qualityDeliverytxt => _qualityDeliverytxt ?? '';
  set qualityDeliverytxt(String? val) => _qualityDeliverytxt = val;

  bool hasQualityDeliverytxt() => _qualityDeliverytxt != null;

  // "fellpricedeliveriedtxt" field.
  String? _fellpricedeliveriedtxt;
  String get fellpricedeliveriedtxt => _fellpricedeliveriedtxt ?? '';
  set fellpricedeliveriedtxt(String? val) => _fellpricedeliveriedtxt = val;

  bool hasFellpricedeliveriedtxt() => _fellpricedeliveriedtxt != null;

  // "task" field.
  DocumentReference? _task;
  DocumentReference? get task => _task;
  set task(DocumentReference? val) => _task = val;

  bool hasTask() => _task != null;

  static AboutthetaskStruct fromMap(Map<String, dynamic> data) =>
      AboutthetaskStruct(
        satisfiedTask: castToType<int>(data['satisfiedTask']),
        taskinstructions: castToType<int>(data['taskinstructions']),
        qualityDelivery: castToType<int>(data['qualityDelivery']),
        feelpricereceveid: castToType<int>(data['feelpricereceveid']),
        improveFutureTasks: data['improveFutureTasks'] as String?,
        satisfiedTasktxt: data['satisfiedTasktxt'] as String?,
        taskinstucoestxt: data['taskinstucoestxt'] as String?,
        qualityDeliverytxt: data['qualityDeliverytxt'] as String?,
        fellpricedeliveriedtxt: data['fellpricedeliveriedtxt'] as String?,
        task: data['task'] as DocumentReference?,
      );

  static AboutthetaskStruct? maybeFromMap(dynamic data) => data is Map
      ? AboutthetaskStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'satisfiedTask': _satisfiedTask,
        'taskinstructions': _taskinstructions,
        'qualityDelivery': _qualityDelivery,
        'feelpricereceveid': _feelpricereceveid,
        'improveFutureTasks': _improveFutureTasks,
        'satisfiedTasktxt': _satisfiedTasktxt,
        'taskinstucoestxt': _taskinstucoestxt,
        'qualityDeliverytxt': _qualityDeliverytxt,
        'fellpricedeliveriedtxt': _fellpricedeliveriedtxt,
        'task': _task,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'satisfiedTask': serializeParam(
          _satisfiedTask,
          ParamType.int,
        ),
        'taskinstructions': serializeParam(
          _taskinstructions,
          ParamType.int,
        ),
        'qualityDelivery': serializeParam(
          _qualityDelivery,
          ParamType.int,
        ),
        'feelpricereceveid': serializeParam(
          _feelpricereceveid,
          ParamType.int,
        ),
        'improveFutureTasks': serializeParam(
          _improveFutureTasks,
          ParamType.String,
        ),
        'satisfiedTasktxt': serializeParam(
          _satisfiedTasktxt,
          ParamType.String,
        ),
        'taskinstucoestxt': serializeParam(
          _taskinstucoestxt,
          ParamType.String,
        ),
        'qualityDeliverytxt': serializeParam(
          _qualityDeliverytxt,
          ParamType.String,
        ),
        'fellpricedeliveriedtxt': serializeParam(
          _fellpricedeliveriedtxt,
          ParamType.String,
        ),
        'task': serializeParam(
          _task,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static AboutthetaskStruct fromSerializableMap(Map<String, dynamic> data) =>
      AboutthetaskStruct(
        satisfiedTask: deserializeParam(
          data['satisfiedTask'],
          ParamType.int,
          false,
        ),
        taskinstructions: deserializeParam(
          data['taskinstructions'],
          ParamType.int,
          false,
        ),
        qualityDelivery: deserializeParam(
          data['qualityDelivery'],
          ParamType.int,
          false,
        ),
        feelpricereceveid: deserializeParam(
          data['feelpricereceveid'],
          ParamType.int,
          false,
        ),
        improveFutureTasks: deserializeParam(
          data['improveFutureTasks'],
          ParamType.String,
          false,
        ),
        satisfiedTasktxt: deserializeParam(
          data['satisfiedTasktxt'],
          ParamType.String,
          false,
        ),
        taskinstucoestxt: deserializeParam(
          data['taskinstucoestxt'],
          ParamType.String,
          false,
        ),
        qualityDeliverytxt: deserializeParam(
          data['qualityDeliverytxt'],
          ParamType.String,
          false,
        ),
        fellpricedeliveriedtxt: deserializeParam(
          data['fellpricedeliveriedtxt'],
          ParamType.String,
          false,
        ),
        task: deserializeParam(
          data['task'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tasks'],
        ),
      );

  @override
  String toString() => 'AboutthetaskStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AboutthetaskStruct &&
        satisfiedTask == other.satisfiedTask &&
        taskinstructions == other.taskinstructions &&
        qualityDelivery == other.qualityDelivery &&
        feelpricereceveid == other.feelpricereceveid &&
        improveFutureTasks == other.improveFutureTasks &&
        satisfiedTasktxt == other.satisfiedTasktxt &&
        taskinstucoestxt == other.taskinstucoestxt &&
        qualityDeliverytxt == other.qualityDeliverytxt &&
        fellpricedeliveriedtxt == other.fellpricedeliveriedtxt &&
        task == other.task;
  }

  @override
  int get hashCode => const ListEquality().hash([
        satisfiedTask,
        taskinstructions,
        qualityDelivery,
        feelpricereceveid,
        improveFutureTasks,
        satisfiedTasktxt,
        taskinstucoestxt,
        qualityDeliverytxt,
        fellpricedeliveriedtxt,
        task
      ]);
}

AboutthetaskStruct createAboutthetaskStruct({
  int? satisfiedTask,
  int? taskinstructions,
  int? qualityDelivery,
  int? feelpricereceveid,
  String? improveFutureTasks,
  String? satisfiedTasktxt,
  String? taskinstucoestxt,
  String? qualityDeliverytxt,
  String? fellpricedeliveriedtxt,
  DocumentReference? task,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AboutthetaskStruct(
      satisfiedTask: satisfiedTask,
      taskinstructions: taskinstructions,
      qualityDelivery: qualityDelivery,
      feelpricereceveid: feelpricereceveid,
      improveFutureTasks: improveFutureTasks,
      satisfiedTasktxt: satisfiedTasktxt,
      taskinstucoestxt: taskinstucoestxt,
      qualityDeliverytxt: qualityDeliverytxt,
      fellpricedeliveriedtxt: fellpricedeliveriedtxt,
      task: task,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AboutthetaskStruct? updateAboutthetaskStruct(
  AboutthetaskStruct? aboutthetask, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    aboutthetask
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAboutthetaskStructData(
  Map<String, dynamic> firestoreData,
  AboutthetaskStruct? aboutthetask,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (aboutthetask == null) {
    return;
  }
  if (aboutthetask.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && aboutthetask.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final aboutthetaskData =
      getAboutthetaskFirestoreData(aboutthetask, forFieldValue);
  final nestedData =
      aboutthetaskData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = aboutthetask.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAboutthetaskFirestoreData(
  AboutthetaskStruct? aboutthetask, [
  bool forFieldValue = false,
]) {
  if (aboutthetask == null) {
    return {};
  }
  final firestoreData = mapToFirestore(aboutthetask.toMap());

  // Add any Firestore field values
  aboutthetask.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAboutthetaskListFirestoreData(
  List<AboutthetaskStruct>? aboutthetasks,
) =>
    aboutthetasks?.map((e) => getAboutthetaskFirestoreData(e, true)).toList() ??
    [];
