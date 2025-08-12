// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AvaliacoesStruct extends FFFirebaseStruct {
  AvaliacoesStruct({
    int? rating,
    DocumentReference? userReference,
    DocumentReference? taskReference,
    String? descricaoDaAvaliacao,
    String? fotodouser,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _rating = rating,
        _userReference = userReference,
        _taskReference = taskReference,
        _descricaoDaAvaliacao = descricaoDaAvaliacao,
        _fotodouser = fotodouser,
        super(firestoreUtilData);

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  set userReference(DocumentReference? val) => _userReference = val;

  bool hasUserReference() => _userReference != null;

  // "taskReference" field.
  DocumentReference? _taskReference;
  DocumentReference? get taskReference => _taskReference;
  set taskReference(DocumentReference? val) => _taskReference = val;

  bool hasTaskReference() => _taskReference != null;

  // "descricaoDaAvaliacao" field.
  String? _descricaoDaAvaliacao;
  String get descricaoDaAvaliacao => _descricaoDaAvaliacao ?? '';
  set descricaoDaAvaliacao(String? val) => _descricaoDaAvaliacao = val;

  bool hasDescricaoDaAvaliacao() => _descricaoDaAvaliacao != null;

  // "fotodouser" field.
  String? _fotodouser;
  String get fotodouser => _fotodouser ?? '';
  set fotodouser(String? val) => _fotodouser = val;

  bool hasFotodouser() => _fotodouser != null;

  static AvaliacoesStruct fromMap(Map<String, dynamic> data) =>
      AvaliacoesStruct(
        rating: castToType<int>(data['rating']),
        userReference: data['userReference'] as DocumentReference?,
        taskReference: data['taskReference'] as DocumentReference?,
        descricaoDaAvaliacao: data['descricaoDaAvaliacao'] as String?,
        fotodouser: data['fotodouser'] as String?,
      );

  static AvaliacoesStruct? maybeFromMap(dynamic data) => data is Map
      ? AvaliacoesStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'rating': _rating,
        'userReference': _userReference,
        'taskReference': _taskReference,
        'descricaoDaAvaliacao': _descricaoDaAvaliacao,
        'fotodouser': _fotodouser,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
        'userReference': serializeParam(
          _userReference,
          ParamType.DocumentReference,
        ),
        'taskReference': serializeParam(
          _taskReference,
          ParamType.DocumentReference,
        ),
        'descricaoDaAvaliacao': serializeParam(
          _descricaoDaAvaliacao,
          ParamType.String,
        ),
        'fotodouser': serializeParam(
          _fotodouser,
          ParamType.String,
        ),
      }.withoutNulls;

  static AvaliacoesStruct fromSerializableMap(Map<String, dynamic> data) =>
      AvaliacoesStruct(
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
        userReference: deserializeParam(
          data['userReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        taskReference: deserializeParam(
          data['taskReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['tasks'],
        ),
        descricaoDaAvaliacao: deserializeParam(
          data['descricaoDaAvaliacao'],
          ParamType.String,
          false,
        ),
        fotodouser: deserializeParam(
          data['fotodouser'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AvaliacoesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AvaliacoesStruct &&
        rating == other.rating &&
        userReference == other.userReference &&
        taskReference == other.taskReference &&
        descricaoDaAvaliacao == other.descricaoDaAvaliacao &&
        fotodouser == other.fotodouser;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [rating, userReference, taskReference, descricaoDaAvaliacao, fotodouser]);
}

AvaliacoesStruct createAvaliacoesStruct({
  int? rating,
  DocumentReference? userReference,
  DocumentReference? taskReference,
  String? descricaoDaAvaliacao,
  String? fotodouser,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AvaliacoesStruct(
      rating: rating,
      userReference: userReference,
      taskReference: taskReference,
      descricaoDaAvaliacao: descricaoDaAvaliacao,
      fotodouser: fotodouser,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AvaliacoesStruct? updateAvaliacoesStruct(
  AvaliacoesStruct? avaliacoes, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    avaliacoes
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAvaliacoesStructData(
  Map<String, dynamic> firestoreData,
  AvaliacoesStruct? avaliacoes,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (avaliacoes == null) {
    return;
  }
  if (avaliacoes.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && avaliacoes.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final avaliacoesData = getAvaliacoesFirestoreData(avaliacoes, forFieldValue);
  final nestedData = avaliacoesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = avaliacoes.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAvaliacoesFirestoreData(
  AvaliacoesStruct? avaliacoes, [
  bool forFieldValue = false,
]) {
  if (avaliacoes == null) {
    return {};
  }
  final firestoreData = mapToFirestore(avaliacoes.toMap());

  // Add any Firestore field values
  avaliacoes.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAvaliacoesListFirestoreData(
  List<AvaliacoesStruct>? avaliacoess,
) =>
    avaliacoess?.map((e) => getAvaliacoesFirestoreData(e, true)).toList() ?? [];
