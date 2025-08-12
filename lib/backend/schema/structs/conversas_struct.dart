// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ConversasStruct extends FFFirebaseStruct {
  ConversasStruct({
    String? conversaPromp,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _conversaPromp = conversaPromp,
        super(firestoreUtilData);

  // "conversa_promp" field.
  String? _conversaPromp;
  String get conversaPromp => _conversaPromp ?? '';
  set conversaPromp(String? val) => _conversaPromp = val;

  bool hasConversaPromp() => _conversaPromp != null;

  static ConversasStruct fromMap(Map<String, dynamic> data) => ConversasStruct(
        conversaPromp: data['conversa_promp'] as String?,
      );

  static ConversasStruct? maybeFromMap(dynamic data) => data is Map
      ? ConversasStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'conversa_promp': _conversaPromp,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'conversa_promp': serializeParam(
          _conversaPromp,
          ParamType.String,
        ),
      }.withoutNulls;

  static ConversasStruct fromSerializableMap(Map<String, dynamic> data) =>
      ConversasStruct(
        conversaPromp: deserializeParam(
          data['conversa_promp'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ConversasStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ConversasStruct && conversaPromp == other.conversaPromp;
  }

  @override
  int get hashCode => const ListEquality().hash([conversaPromp]);
}

ConversasStruct createConversasStruct({
  String? conversaPromp,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ConversasStruct(
      conversaPromp: conversaPromp,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ConversasStruct? updateConversasStruct(
  ConversasStruct? conversas, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    conversas
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addConversasStructData(
  Map<String, dynamic> firestoreData,
  ConversasStruct? conversas,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (conversas == null) {
    return;
  }
  if (conversas.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && conversas.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final conversasData = getConversasFirestoreData(conversas, forFieldValue);
  final nestedData = conversasData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = conversas.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getConversasFirestoreData(
  ConversasStruct? conversas, [
  bool forFieldValue = false,
]) {
  if (conversas == null) {
    return {};
  }
  final firestoreData = mapToFirestore(conversas.toMap());

  // Add any Firestore field values
  conversas.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getConversasListFirestoreData(
  List<ConversasStruct>? conversass,
) =>
    conversass?.map((e) => getConversasFirestoreData(e, true)).toList() ?? [];
