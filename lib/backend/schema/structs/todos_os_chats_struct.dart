// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TodosOsChatsStruct extends FFFirebaseStruct {
  TodosOsChatsStruct({
    String? usuario,
    String? uid,
    String? img,
    DateTime? ultimaMsg,
    DocumentReference? documentReferenceUser,
    String? msg,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _usuario = usuario,
        _uid = uid,
        _img = img,
        _ultimaMsg = ultimaMsg,
        _documentReferenceUser = documentReferenceUser,
        _msg = msg,
        super(firestoreUtilData);

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  set uid(String? val) => _uid = val;

  bool hasUid() => _uid != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "ultimaMsg" field.
  DateTime? _ultimaMsg;
  DateTime? get ultimaMsg => _ultimaMsg;
  set ultimaMsg(DateTime? val) => _ultimaMsg = val;

  bool hasUltimaMsg() => _ultimaMsg != null;

  // "documentReferenceUser" field.
  DocumentReference? _documentReferenceUser;
  DocumentReference? get documentReferenceUser => _documentReferenceUser;
  set documentReferenceUser(DocumentReference? val) =>
      _documentReferenceUser = val;

  bool hasDocumentReferenceUser() => _documentReferenceUser != null;

  // "msg" field.
  String? _msg;
  String get msg => _msg ?? '';
  set msg(String? val) => _msg = val;

  bool hasMsg() => _msg != null;

  static TodosOsChatsStruct fromMap(Map<String, dynamic> data) =>
      TodosOsChatsStruct(
        usuario: data['usuario'] as String?,
        uid: data['uid'] as String?,
        img: data['img'] as String?,
        ultimaMsg: data['ultimaMsg'] as DateTime?,
        documentReferenceUser:
            data['documentReferenceUser'] as DocumentReference?,
        msg: data['msg'] as String?,
      );

  static TodosOsChatsStruct? maybeFromMap(dynamic data) => data is Map
      ? TodosOsChatsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'usuario': _usuario,
        'uid': _uid,
        'img': _img,
        'ultimaMsg': _ultimaMsg,
        'documentReferenceUser': _documentReferenceUser,
        'msg': _msg,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'uid': serializeParam(
          _uid,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'ultimaMsg': serializeParam(
          _ultimaMsg,
          ParamType.DateTime,
        ),
        'documentReferenceUser': serializeParam(
          _documentReferenceUser,
          ParamType.DocumentReference,
        ),
        'msg': serializeParam(
          _msg,
          ParamType.String,
        ),
      }.withoutNulls;

  static TodosOsChatsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TodosOsChatsStruct(
        usuario: deserializeParam(
          data['usuario'],
          ParamType.String,
          false,
        ),
        uid: deserializeParam(
          data['uid'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        ultimaMsg: deserializeParam(
          data['ultimaMsg'],
          ParamType.DateTime,
          false,
        ),
        documentReferenceUser: deserializeParam(
          data['documentReferenceUser'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
        msg: deserializeParam(
          data['msg'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TodosOsChatsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TodosOsChatsStruct &&
        usuario == other.usuario &&
        uid == other.uid &&
        img == other.img &&
        ultimaMsg == other.ultimaMsg &&
        documentReferenceUser == other.documentReferenceUser &&
        msg == other.msg;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([usuario, uid, img, ultimaMsg, documentReferenceUser, msg]);
}

TodosOsChatsStruct createTodosOsChatsStruct({
  String? usuario,
  String? uid,
  String? img,
  DateTime? ultimaMsg,
  DocumentReference? documentReferenceUser,
  String? msg,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TodosOsChatsStruct(
      usuario: usuario,
      uid: uid,
      img: img,
      ultimaMsg: ultimaMsg,
      documentReferenceUser: documentReferenceUser,
      msg: msg,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TodosOsChatsStruct? updateTodosOsChatsStruct(
  TodosOsChatsStruct? todosOsChats, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    todosOsChats
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTodosOsChatsStructData(
  Map<String, dynamic> firestoreData,
  TodosOsChatsStruct? todosOsChats,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (todosOsChats == null) {
    return;
  }
  if (todosOsChats.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && todosOsChats.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final todosOsChatsData =
      getTodosOsChatsFirestoreData(todosOsChats, forFieldValue);
  final nestedData =
      todosOsChatsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = todosOsChats.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTodosOsChatsFirestoreData(
  TodosOsChatsStruct? todosOsChats, [
  bool forFieldValue = false,
]) {
  if (todosOsChats == null) {
    return {};
  }
  final firestoreData = mapToFirestore(todosOsChats.toMap());

  // Add any Firestore field values
  todosOsChats.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTodosOsChatsListFirestoreData(
  List<TodosOsChatsStruct>? todosOsChatss,
) =>
    todosOsChatss?.map((e) => getTodosOsChatsFirestoreData(e, true)).toList() ??
    [];
