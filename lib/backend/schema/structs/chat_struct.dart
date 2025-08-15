// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class ChatStruct extends FFFirebaseStruct {
  ChatStruct({
    String? conversa,
    DateTime? horario,
    String? img,
    String? role,
    String? usuario,
    String? imgDoUsuario,
    DocumentReference? documentReferenceDoUsuario,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _conversa = conversa,
        _horario = horario,
        _img = img,
        _role = role,
        _usuario = usuario,
        _imgDoUsuario = imgDoUsuario,
        _documentReferenceDoUsuario = documentReferenceDoUsuario,
        super(firestoreUtilData);

  // "conversa" field.
  String? _conversa;
  String get conversa => _conversa ?? '';
  set conversa(String? val) => _conversa = val;

  bool hasConversa() => _conversa != null;

  // "horario" field.
  DateTime? _horario;
  DateTime? get horario => _horario;
  set horario(DateTime? val) => _horario = val;

  bool hasHorario() => _horario != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  // "role" field.
  String? _role;
  String get role => _role ?? '';
  set role(String? val) => _role = val;

  bool hasRole() => _role != null;

  // "usuario" field.
  String? _usuario;
  String get usuario => _usuario ?? '';
  set usuario(String? val) => _usuario = val;

  bool hasUsuario() => _usuario != null;

  // "imgDoUsuario" field.
  String? _imgDoUsuario;
  String get imgDoUsuario => _imgDoUsuario ?? '';
  set imgDoUsuario(String? val) => _imgDoUsuario = val;

  bool hasImgDoUsuario() => _imgDoUsuario != null;

  // "documentReferenceDoUsuario" field.
  DocumentReference? _documentReferenceDoUsuario;
  DocumentReference? get documentReferenceDoUsuario =>
      _documentReferenceDoUsuario;
  set documentReferenceDoUsuario(DocumentReference? val) =>
      _documentReferenceDoUsuario = val;

  bool hasDocumentReferenceDoUsuario() => _documentReferenceDoUsuario != null;

  static ChatStruct fromMap(Map<String, dynamic> data) => ChatStruct(
        conversa: data['conversa'] as String?,
        horario: data['horario'] as DateTime?,
        img: data['img'] as String?,
        role: data['role'] as String?,
        usuario: data['usuario'] as String?,
        imgDoUsuario: data['imgDoUsuario'] as String?,
        documentReferenceDoUsuario:
            data['documentReferenceDoUsuario'] as DocumentReference?,
      );

  static ChatStruct? maybeFromMap(dynamic data) =>
      data is Map ? ChatStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'conversa': _conversa,
        'horario': _horario,
        'img': _img,
        'role': _role,
        'usuario': _usuario,
        'imgDoUsuario': _imgDoUsuario,
        'documentReferenceDoUsuario': _documentReferenceDoUsuario,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'conversa': serializeParam(
          _conversa,
          ParamType.String,
        ),
        'horario': serializeParam(
          _horario,
          ParamType.DateTime,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
        'role': serializeParam(
          _role,
          ParamType.String,
        ),
        'usuario': serializeParam(
          _usuario,
          ParamType.String,
        ),
        'imgDoUsuario': serializeParam(
          _imgDoUsuario,
          ParamType.String,
        ),
        'documentReferenceDoUsuario': serializeParam(
          _documentReferenceDoUsuario,
          ParamType.DocumentReference,
        ),
      }.withoutNulls;

  static ChatStruct fromSerializableMap(Map<String, dynamic> data) =>
      ChatStruct(
        conversa: deserializeParam(
          data['conversa'],
          ParamType.String,
          false,
        ),
        horario: deserializeParam(
          data['horario'],
          ParamType.DateTime,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['role'],
          ParamType.String,
          false,
        ),
        usuario: deserializeParam(
          data['usuario'],
          ParamType.String,
          false,
        ),
        imgDoUsuario: deserializeParam(
          data['imgDoUsuario'],
          ParamType.String,
          false,
        ),
        documentReferenceDoUsuario: deserializeParam(
          data['documentReferenceDoUsuario'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['users'],
        ),
      );

  @override
  String toString() => 'ChatStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ChatStruct &&
        conversa == other.conversa &&
        horario == other.horario &&
        img == other.img &&
        role == other.role &&
        usuario == other.usuario &&
        imgDoUsuario == other.imgDoUsuario &&
        documentReferenceDoUsuario == other.documentReferenceDoUsuario;
  }

  @override
  int get hashCode => const ListEquality().hash([
        conversa,
        horario,
        img,
        role,
        usuario,
        imgDoUsuario,
        documentReferenceDoUsuario
      ]);
}

ChatStruct createChatStruct({
  String? conversa,
  DateTime? horario,
  String? img,
  String? role,
  String? usuario,
  String? imgDoUsuario,
  DocumentReference? documentReferenceDoUsuario,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ChatStruct(
      conversa: conversa,
      horario: horario,
      img: img,
      role: role,
      usuario: usuario,
      imgDoUsuario: imgDoUsuario,
      documentReferenceDoUsuario: documentReferenceDoUsuario,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ChatStruct? updateChatStruct(
  ChatStruct? chat, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    chat
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addChatStructData(
  Map<String, dynamic> firestoreData,
  ChatStruct? chat,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (chat == null) {
    return;
  }
  if (chat.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && chat.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final chatData = getChatFirestoreData(chat, forFieldValue);
  final nestedData = chatData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = chat.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getChatFirestoreData(
  ChatStruct? chat, [
  bool forFieldValue = false,
]) {
  if (chat == null) {
    return {};
  }
  final firestoreData = mapToFirestore(chat.toMap());

  // Add any Firestore field values
  chat.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getChatListFirestoreData(
  List<ChatStruct>? chats,
) =>
    chats?.map((e) => getChatFirestoreData(e, true)).toList() ?? [];
