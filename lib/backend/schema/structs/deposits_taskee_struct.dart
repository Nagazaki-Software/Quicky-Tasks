// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DepositsTaskeeStruct extends FFFirebaseStruct {
  DepositsTaskeeStruct({
    double? amount,
    DateTime? day,
    String? idDeTransacao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _amount = amount,
        _day = day,
        _idDeTransacao = idDeTransacao,
        super(firestoreUtilData);

  // "amount" field.
  double? _amount;
  double get amount => _amount ?? 0.0;
  set amount(double? val) => _amount = val;

  void incrementAmount(double amount) => amount = amount + amount;

  bool hasAmount() => _amount != null;

  // "day" field.
  DateTime? _day;
  DateTime? get day => _day;
  set day(DateTime? val) => _day = val;

  bool hasDay() => _day != null;

  // "idDeTransacao" field.
  String? _idDeTransacao;
  String get idDeTransacao => _idDeTransacao ?? '';
  set idDeTransacao(String? val) => _idDeTransacao = val;

  bool hasIdDeTransacao() => _idDeTransacao != null;

  static DepositsTaskeeStruct fromMap(Map<String, dynamic> data) =>
      DepositsTaskeeStruct(
        amount: castToType<double>(data['amount']),
        day: data['day'] as DateTime?,
        idDeTransacao: data['idDeTransacao'] as String?,
      );

  static DepositsTaskeeStruct? maybeFromMap(dynamic data) => data is Map
      ? DepositsTaskeeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'amount': _amount,
        'day': _day,
        'idDeTransacao': _idDeTransacao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'amount': serializeParam(
          _amount,
          ParamType.double,
        ),
        'day': serializeParam(
          _day,
          ParamType.DateTime,
        ),
        'idDeTransacao': serializeParam(
          _idDeTransacao,
          ParamType.String,
        ),
      }.withoutNulls;

  static DepositsTaskeeStruct fromSerializableMap(Map<String, dynamic> data) =>
      DepositsTaskeeStruct(
        amount: deserializeParam(
          data['amount'],
          ParamType.double,
          false,
        ),
        day: deserializeParam(
          data['day'],
          ParamType.DateTime,
          false,
        ),
        idDeTransacao: deserializeParam(
          data['idDeTransacao'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DepositsTaskeeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DepositsTaskeeStruct &&
        amount == other.amount &&
        day == other.day &&
        idDeTransacao == other.idDeTransacao;
  }

  @override
  int get hashCode => const ListEquality().hash([amount, day, idDeTransacao]);
}

DepositsTaskeeStruct createDepositsTaskeeStruct({
  double? amount,
  DateTime? day,
  String? idDeTransacao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DepositsTaskeeStruct(
      amount: amount,
      day: day,
      idDeTransacao: idDeTransacao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DepositsTaskeeStruct? updateDepositsTaskeeStruct(
  DepositsTaskeeStruct? depositsTaskee, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    depositsTaskee
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDepositsTaskeeStructData(
  Map<String, dynamic> firestoreData,
  DepositsTaskeeStruct? depositsTaskee,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (depositsTaskee == null) {
    return;
  }
  if (depositsTaskee.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && depositsTaskee.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final depositsTaskeeData =
      getDepositsTaskeeFirestoreData(depositsTaskee, forFieldValue);
  final nestedData =
      depositsTaskeeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = depositsTaskee.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDepositsTaskeeFirestoreData(
  DepositsTaskeeStruct? depositsTaskee, [
  bool forFieldValue = false,
]) {
  if (depositsTaskee == null) {
    return {};
  }
  final firestoreData = mapToFirestore(depositsTaskee.toMap());

  // Add any Firestore field values
  depositsTaskee.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDepositsTaskeeListFirestoreData(
  List<DepositsTaskeeStruct>? depositsTaskees,
) =>
    depositsTaskees
        ?.map((e) => getDepositsTaskeeFirestoreData(e, true))
        .toList() ??
    [];
