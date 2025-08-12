// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class NewcartaodecreditoStruct extends FFFirebaseStruct {
  NewcartaodecreditoStruct({
    String? nomeNoCartao,
    String? card,
    String? cvc,
    String? expDate,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomeNoCartao = nomeNoCartao,
        _card = card,
        _cvc = cvc,
        _expDate = expDate,
        super(firestoreUtilData);

  // "nomeNoCartao" field.
  String? _nomeNoCartao;
  String get nomeNoCartao => _nomeNoCartao ?? '';
  set nomeNoCartao(String? val) => _nomeNoCartao = val;

  bool hasNomeNoCartao() => _nomeNoCartao != null;

  // "card" field.
  String? _card;
  String get card => _card ?? '';
  set card(String? val) => _card = val;

  bool hasCard() => _card != null;

  // "cvc" field.
  String? _cvc;
  String get cvc => _cvc ?? '';
  set cvc(String? val) => _cvc = val;

  bool hasCvc() => _cvc != null;

  // "expDate" field.
  String? _expDate;
  String get expDate => _expDate ?? '';
  set expDate(String? val) => _expDate = val;

  bool hasExpDate() => _expDate != null;

  static NewcartaodecreditoStruct fromMap(Map<String, dynamic> data) =>
      NewcartaodecreditoStruct(
        nomeNoCartao: data['nomeNoCartao'] as String?,
        card: data['card'] as String?,
        cvc: data['cvc'] as String?,
        expDate: data['expDate'] as String?,
      );

  static NewcartaodecreditoStruct? maybeFromMap(dynamic data) => data is Map
      ? NewcartaodecreditoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomeNoCartao': _nomeNoCartao,
        'card': _card,
        'cvc': _cvc,
        'expDate': _expDate,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomeNoCartao': serializeParam(
          _nomeNoCartao,
          ParamType.String,
        ),
        'card': serializeParam(
          _card,
          ParamType.String,
        ),
        'cvc': serializeParam(
          _cvc,
          ParamType.String,
        ),
        'expDate': serializeParam(
          _expDate,
          ParamType.String,
        ),
      }.withoutNulls;

  static NewcartaodecreditoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      NewcartaodecreditoStruct(
        nomeNoCartao: deserializeParam(
          data['nomeNoCartao'],
          ParamType.String,
          false,
        ),
        card: deserializeParam(
          data['card'],
          ParamType.String,
          false,
        ),
        cvc: deserializeParam(
          data['cvc'],
          ParamType.String,
          false,
        ),
        expDate: deserializeParam(
          data['expDate'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'NewcartaodecreditoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NewcartaodecreditoStruct &&
        nomeNoCartao == other.nomeNoCartao &&
        card == other.card &&
        cvc == other.cvc &&
        expDate == other.expDate;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nomeNoCartao, card, cvc, expDate]);
}

NewcartaodecreditoStruct createNewcartaodecreditoStruct({
  String? nomeNoCartao,
  String? card,
  String? cvc,
  String? expDate,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NewcartaodecreditoStruct(
      nomeNoCartao: nomeNoCartao,
      card: card,
      cvc: cvc,
      expDate: expDate,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NewcartaodecreditoStruct? updateNewcartaodecreditoStruct(
  NewcartaodecreditoStruct? newcartaodecredito, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    newcartaodecredito
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNewcartaodecreditoStructData(
  Map<String, dynamic> firestoreData,
  NewcartaodecreditoStruct? newcartaodecredito,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (newcartaodecredito == null) {
    return;
  }
  if (newcartaodecredito.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && newcartaodecredito.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final newcartaodecreditoData =
      getNewcartaodecreditoFirestoreData(newcartaodecredito, forFieldValue);
  final nestedData =
      newcartaodecreditoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      newcartaodecredito.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNewcartaodecreditoFirestoreData(
  NewcartaodecreditoStruct? newcartaodecredito, [
  bool forFieldValue = false,
]) {
  if (newcartaodecredito == null) {
    return {};
  }
  final firestoreData = mapToFirestore(newcartaodecredito.toMap());

  // Add any Firestore field values
  newcartaodecredito.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNewcartaodecreditoListFirestoreData(
  List<NewcartaodecreditoStruct>? newcartaodecreditos,
) =>
    newcartaodecreditos
        ?.map((e) => getNewcartaodecreditoFirestoreData(e, true))
        .toList() ??
    [];
