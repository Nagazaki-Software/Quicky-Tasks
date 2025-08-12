// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class EnderecoTasksStruct extends FFFirebaseStruct {
  EnderecoTasksStruct({
    String? nomedarua,
    String? housename,
    String? numero,
    LatLng? localizacao,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _nomedarua = nomedarua,
        _housename = housename,
        _numero = numero,
        _localizacao = localizacao,
        super(firestoreUtilData);

  // "nomedarua" field.
  String? _nomedarua;
  String get nomedarua => _nomedarua ?? '';
  set nomedarua(String? val) => _nomedarua = val;

  bool hasNomedarua() => _nomedarua != null;

  // "housename" field.
  String? _housename;
  String get housename => _housename ?? '';
  set housename(String? val) => _housename = val;

  bool hasHousename() => _housename != null;

  // "numero" field.
  String? _numero;
  String get numero => _numero ?? '';
  set numero(String? val) => _numero = val;

  bool hasNumero() => _numero != null;

  // "localizacao" field.
  LatLng? _localizacao;
  LatLng? get localizacao => _localizacao;
  set localizacao(LatLng? val) => _localizacao = val;

  bool hasLocalizacao() => _localizacao != null;

  static EnderecoTasksStruct fromMap(Map<String, dynamic> data) =>
      EnderecoTasksStruct(
        nomedarua: data['nomedarua'] as String?,
        housename: data['housename'] as String?,
        numero: data['numero'] as String?,
        localizacao: data['localizacao'] as LatLng?,
      );

  static EnderecoTasksStruct? maybeFromMap(dynamic data) => data is Map
      ? EnderecoTasksStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'nomedarua': _nomedarua,
        'housename': _housename,
        'numero': _numero,
        'localizacao': _localizacao,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'nomedarua': serializeParam(
          _nomedarua,
          ParamType.String,
        ),
        'housename': serializeParam(
          _housename,
          ParamType.String,
        ),
        'numero': serializeParam(
          _numero,
          ParamType.String,
        ),
        'localizacao': serializeParam(
          _localizacao,
          ParamType.LatLng,
        ),
      }.withoutNulls;

  static EnderecoTasksStruct fromSerializableMap(Map<String, dynamic> data) =>
      EnderecoTasksStruct(
        nomedarua: deserializeParam(
          data['nomedarua'],
          ParamType.String,
          false,
        ),
        housename: deserializeParam(
          data['housename'],
          ParamType.String,
          false,
        ),
        numero: deserializeParam(
          data['numero'],
          ParamType.String,
          false,
        ),
        localizacao: deserializeParam(
          data['localizacao'],
          ParamType.LatLng,
          false,
        ),
      );

  @override
  String toString() => 'EnderecoTasksStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EnderecoTasksStruct &&
        nomedarua == other.nomedarua &&
        housename == other.housename &&
        numero == other.numero &&
        localizacao == other.localizacao;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([nomedarua, housename, numero, localizacao]);
}

EnderecoTasksStruct createEnderecoTasksStruct({
  String? nomedarua,
  String? housename,
  String? numero,
  LatLng? localizacao,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EnderecoTasksStruct(
      nomedarua: nomedarua,
      housename: housename,
      numero: numero,
      localizacao: localizacao,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EnderecoTasksStruct? updateEnderecoTasksStruct(
  EnderecoTasksStruct? enderecoTasks, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    enderecoTasks
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEnderecoTasksStructData(
  Map<String, dynamic> firestoreData,
  EnderecoTasksStruct? enderecoTasks,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (enderecoTasks == null) {
    return;
  }
  if (enderecoTasks.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && enderecoTasks.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final enderecoTasksData =
      getEnderecoTasksFirestoreData(enderecoTasks, forFieldValue);
  final nestedData =
      enderecoTasksData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = enderecoTasks.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEnderecoTasksFirestoreData(
  EnderecoTasksStruct? enderecoTasks, [
  bool forFieldValue = false,
]) {
  if (enderecoTasks == null) {
    return {};
  }
  final firestoreData = mapToFirestore(enderecoTasks.toMap());

  // Add any Firestore field values
  enderecoTasks.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEnderecoTasksListFirestoreData(
  List<EnderecoTasksStruct>? enderecoTaskss,
) =>
    enderecoTaskss
        ?.map((e) => getEnderecoTasksFirestoreData(e, true))
        .toList() ??
    [];
