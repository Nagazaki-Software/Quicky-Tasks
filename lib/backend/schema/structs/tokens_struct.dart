// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TokensStruct extends FFFirebaseStruct {
  TokensStruct({
    DateTime? data,
    int? tokens,
    String? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _data = data,
        _tokens = tokens,
        _status = status,
        super(firestoreUtilData);

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  set data(DateTime? val) => _data = val;

  bool hasData() => _data != null;

  // "tokens" field.
  int? _tokens;
  int get tokens => _tokens ?? 0;
  set tokens(int? val) => _tokens = val;

  void incrementTokens(int amount) => tokens = tokens + amount;

  bool hasTokens() => _tokens != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  set status(String? val) => _status = val;

  bool hasStatus() => _status != null;

  static TokensStruct fromMap(Map<String, dynamic> data) => TokensStruct(
        data: data['data'] as DateTime?,
        tokens: castToType<int>(data['tokens']),
        status: data['status'] as String?,
      );

  static TokensStruct? maybeFromMap(dynamic data) =>
      data is Map ? TokensStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'data': _data,
        'tokens': _tokens,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'data': serializeParam(
          _data,
          ParamType.DateTime,
        ),
        'tokens': serializeParam(
          _tokens,
          ParamType.int,
        ),
        'status': serializeParam(
          _status,
          ParamType.String,
        ),
      }.withoutNulls;

  static TokensStruct fromSerializableMap(Map<String, dynamic> data) =>
      TokensStruct(
        data: deserializeParam(
          data['data'],
          ParamType.DateTime,
          false,
        ),
        tokens: deserializeParam(
          data['tokens'],
          ParamType.int,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TokensStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TokensStruct &&
        data == other.data &&
        tokens == other.tokens &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([data, tokens, status]);
}

TokensStruct createTokensStruct({
  DateTime? data,
  int? tokens,
  String? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TokensStruct(
      data: data,
      tokens: tokens,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TokensStruct? updateTokensStruct(
  TokensStruct? tokensStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tokensStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTokensStructData(
  Map<String, dynamic> firestoreData,
  TokensStruct? tokensStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tokensStruct == null) {
    return;
  }
  if (tokensStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tokensStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tokensStructData = getTokensFirestoreData(tokensStruct, forFieldValue);
  final nestedData =
      tokensStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tokensStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTokensFirestoreData(
  TokensStruct? tokensStruct, [
  bool forFieldValue = false,
]) {
  if (tokensStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tokensStruct.toMap());

  // Add any Firestore field values
  tokensStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTokensListFirestoreData(
  List<TokensStruct>? tokensStructs,
) =>
    tokensStructs?.map((e) => getTokensFirestoreData(e, true)).toList() ?? [];
