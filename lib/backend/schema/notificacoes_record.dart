import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NotificacoesRecord extends FirestoreRecord {
  NotificacoesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  void _initializeFields() {
    _titulo = snapshotData['titulo'] as String?;
    _data = snapshotData['data'] as DateTime?;
    _icon = snapshotData['icon'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('notificacoes');

  static Stream<NotificacoesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NotificacoesRecord.fromSnapshot(s));

  static Future<NotificacoesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NotificacoesRecord.fromSnapshot(s));

  static NotificacoesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NotificacoesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NotificacoesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NotificacoesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NotificacoesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NotificacoesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNotificacoesRecordData({
  String? titulo,
  DateTime? data,
  String? icon,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'titulo': titulo,
      'data': data,
      'icon': icon,
    }.withoutNulls,
  );

  return firestoreData;
}

class NotificacoesRecordDocumentEquality
    implements Equality<NotificacoesRecord> {
  const NotificacoesRecordDocumentEquality();

  @override
  bool equals(NotificacoesRecord? e1, NotificacoesRecord? e2) {
    return e1?.titulo == e2?.titulo &&
        e1?.data == e2?.data &&
        e1?.icon == e2?.icon;
  }

  @override
  int hash(NotificacoesRecord? e) =>
      const ListEquality().hash([e?.titulo, e?.data, e?.icon]);

  @override
  bool isValidKey(Object? o) => o is NotificacoesRecord;
}
