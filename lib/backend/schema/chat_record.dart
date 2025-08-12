import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userDocument" field.
  DocumentReference? _userDocument;
  DocumentReference? get userDocument => _userDocument;
  bool hasUserDocument() => _userDocument != null;

  // "imgDoUser" field.
  String? _imgDoUser;
  String get imgDoUser => _imgDoUser ?? '';
  bool hasImgDoUser() => _imgDoUser != null;

  // "UserName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "ultimaMsg" field.
  DateTime? _ultimaMsg;
  DateTime? get ultimaMsg => _ultimaMsg;
  bool hasUltimaMsg() => _ultimaMsg != null;

  // "ultMsg" field.
  String? _ultMsg;
  String get ultMsg => _ultMsg ?? '';
  bool hasUltMsg() => _ultMsg != null;

  // "user2Document" field.
  DocumentReference? _user2Document;
  DocumentReference? get user2Document => _user2Document;
  bool hasUser2Document() => _user2Document != null;

  // "nomeDoGrupo" field.
  String? _nomeDoGrupo;
  String get nomeDoGrupo => _nomeDoGrupo ?? '';
  bool hasNomeDoGrupo() => _nomeDoGrupo != null;

  // "imgDaTask" field.
  String? _imgDaTask;
  String get imgDaTask => _imgDaTask ?? '';
  bool hasImgDaTask() => _imgDaTask != null;

  // "referenceTask" field.
  DocumentReference? _referenceTask;
  DocumentReference? get referenceTask => _referenceTask;
  bool hasReferenceTask() => _referenceTask != null;

  // "usersDoGrupo" field.
  List<DocumentReference>? _usersDoGrupo;
  List<DocumentReference> get usersDoGrupo => _usersDoGrupo ?? const [];
  bool hasUsersDoGrupo() => _usersDoGrupo != null;

  // "taskRenegociate" field.
  bool? _taskRenegociate;
  bool get taskRenegociate => _taskRenegociate ?? false;
  bool hasTaskRenegociate() => _taskRenegociate != null;

  // "taskHora" field.
  DateTime? _taskHora;
  DateTime? get taskHora => _taskHora;
  bool hasTaskHora() => _taskHora != null;

  // "taskRefOrderAgain" field.
  DocumentReference? _taskRefOrderAgain;
  DocumentReference? get taskRefOrderAgain => _taskRefOrderAgain;
  bool hasTaskRefOrderAgain() => _taskRefOrderAgain != null;

  void _initializeFields() {
    _userDocument = snapshotData['userDocument'] as DocumentReference?;
    _imgDoUser = snapshotData['imgDoUser'] as String?;
    _userName = snapshotData['UserName'] as String?;
    _ultimaMsg = snapshotData['ultimaMsg'] as DateTime?;
    _ultMsg = snapshotData['ultMsg'] as String?;
    _user2Document = snapshotData['user2Document'] as DocumentReference?;
    _nomeDoGrupo = snapshotData['nomeDoGrupo'] as String?;
    _imgDaTask = snapshotData['imgDaTask'] as String?;
    _referenceTask = snapshotData['referenceTask'] as DocumentReference?;
    _usersDoGrupo = getDataList(snapshotData['usersDoGrupo']);
    _taskRenegociate = snapshotData['taskRenegociate'] as bool?;
    _taskHora = snapshotData['taskHora'] as DateTime?;
    _taskRefOrderAgain =
        snapshotData['taskRefOrderAgain'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ChatRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? userDocument,
  String? imgDoUser,
  String? userName,
  DateTime? ultimaMsg,
  String? ultMsg,
  DocumentReference? user2Document,
  String? nomeDoGrupo,
  String? imgDaTask,
  DocumentReference? referenceTask,
  bool? taskRenegociate,
  DateTime? taskHora,
  DocumentReference? taskRefOrderAgain,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userDocument': userDocument,
      'imgDoUser': imgDoUser,
      'UserName': userName,
      'ultimaMsg': ultimaMsg,
      'ultMsg': ultMsg,
      'user2Document': user2Document,
      'nomeDoGrupo': nomeDoGrupo,
      'imgDaTask': imgDaTask,
      'referenceTask': referenceTask,
      'taskRenegociate': taskRenegociate,
      'taskHora': taskHora,
      'taskRefOrderAgain': taskRefOrderAgain,
    }.withoutNulls,
  );

  return firestoreData;
}

class ChatRecordDocumentEquality implements Equality<ChatRecord> {
  const ChatRecordDocumentEquality();

  @override
  bool equals(ChatRecord? e1, ChatRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userDocument == e2?.userDocument &&
        e1?.imgDoUser == e2?.imgDoUser &&
        e1?.userName == e2?.userName &&
        e1?.ultimaMsg == e2?.ultimaMsg &&
        e1?.ultMsg == e2?.ultMsg &&
        e1?.user2Document == e2?.user2Document &&
        e1?.nomeDoGrupo == e2?.nomeDoGrupo &&
        e1?.imgDaTask == e2?.imgDaTask &&
        e1?.referenceTask == e2?.referenceTask &&
        listEquality.equals(e1?.usersDoGrupo, e2?.usersDoGrupo) &&
        e1?.taskRenegociate == e2?.taskRenegociate &&
        e1?.taskHora == e2?.taskHora &&
        e1?.taskRefOrderAgain == e2?.taskRefOrderAgain;
  }

  @override
  int hash(ChatRecord? e) => const ListEquality().hash([
        e?.userDocument,
        e?.imgDoUser,
        e?.userName,
        e?.ultimaMsg,
        e?.ultMsg,
        e?.user2Document,
        e?.nomeDoGrupo,
        e?.imgDaTask,
        e?.referenceTask,
        e?.usersDoGrupo,
        e?.taskRenegociate,
        e?.taskHora,
        e?.taskRefOrderAgain
      ]);

  @override
  bool isValidKey(Object? o) => o is ChatRecord;
}
