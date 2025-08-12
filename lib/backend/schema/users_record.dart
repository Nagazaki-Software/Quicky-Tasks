import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "edited_time" field.
  DateTime? _editedTime;
  DateTime? get editedTime => _editedTime;
  bool hasEditedTime() => _editedTime != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  bool hasBio() => _bio != null;

  // "user_name" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "credit_card" field.
  List<NewcartaodecreditoStruct>? _creditCard;
  List<NewcartaodecreditoStruct> get creditCard => _creditCard ?? const [];
  bool hasCreditCard() => _creditCard != null;

  // "stripeAccountID" field.
  String? _stripeAccountID;
  String get stripeAccountID => _stripeAccountID ?? '';
  bool hasStripeAccountID() => _stripeAccountID != null;

  // "stripeChargeEnable" field.
  bool? _stripeChargeEnable;
  bool get stripeChargeEnable => _stripeChargeEnable ?? false;
  bool hasStripeChargeEnable() => _stripeChargeEnable != null;

  // "hobbys" field.
  List<String>? _hobbys;
  List<String> get hobbys => _hobbys ?? const [];
  bool hasHobbys() => _hobbys != null;

  // "genero" field.
  String? _genero;
  String get genero => _genero ?? '';
  bool hasGenero() => _genero != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  bool hasFacebook() => _facebook != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "iDdastasksAceitadas" field.
  List<String>? _iDdastasksAceitadas;
  List<String> get iDdastasksAceitadas => _iDdastasksAceitadas ?? const [];
  bool hasIDdastasksAceitadas() => _iDdastasksAceitadas != null;

  // "avaliacoes" field.
  List<AvaliacoesStruct>? _avaliacoes;
  List<AvaliacoesStruct> get avaliacoes => _avaliacoes ?? const [];
  bool hasAvaliacoes() => _avaliacoes != null;

  // "tasksRealizadas" field.
  List<String>? _tasksRealizadas;
  List<String> get tasksRealizadas => _tasksRealizadas ?? const [];
  bool hasTasksRealizadas() => _tasksRealizadas != null;

  // "quantTasksRealizadas" field.
  int? _quantTasksRealizadas;
  int get quantTasksRealizadas => _quantTasksRealizadas ?? 0;
  bool hasQuantTasksRealizadas() => _quantTasksRealizadas != null;

  // "taskOrTaskee" field.
  String? _taskOrTaskee;
  String get taskOrTaskee => _taskOrTaskee ?? '';
  bool hasTaskOrTaskee() => _taskOrTaskee != null;

  // "saldo" field.
  double? _saldo;
  double get saldo => _saldo ?? 0.0;
  bool hasSaldo() => _saldo != null;

  // "deposityTransacoes" field.
  List<DepositsTaskeeStruct>? _deposityTransacoes;
  List<DepositsTaskeeStruct> get deposityTransacoes =>
      _deposityTransacoes ?? const [];
  bool hasDeposityTransacoes() => _deposityTransacoes != null;

  // "clienteStripeId" field.
  String? _clienteStripeId;
  String get clienteStripeId => _clienteStripeId ?? '';
  bool hasClienteStripeId() => _clienteStripeId != null;

  // "dob" field.
  DateTime? _dob;
  DateTime? get dob => _dob;
  bool hasDob() => _dob != null;

  // "verifyaccount" field.
  bool? _verifyaccount;
  bool get verifyaccount => _verifyaccount ?? false;
  bool hasVerifyaccount() => _verifyaccount != null;

  // "rating" field.
  double? _rating;
  double get rating => _rating ?? 0.0;
  bool hasRating() => _rating != null;

  // "transferId" field.
  String? _transferId;
  String get transferId => _transferId ?? '';
  bool hasTransferId() => _transferId != null;

  // "requestPedidos" field.
  List<DocumentReference>? _requestPedidos;
  List<DocumentReference> get requestPedidos => _requestPedidos ?? const [];
  bool hasRequestPedidos() => _requestPedidos != null;

  // "requestEmNumber" field.
  int? _requestEmNumber;
  int get requestEmNumber => _requestEmNumber ?? 0;
  bool hasRequestEmNumber() => _requestEmNumber != null;

  // "mostOrded" field.
  List<String>? _mostOrded;
  List<String> get mostOrded => _mostOrded ?? const [];
  bool hasMostOrded() => _mostOrded != null;

  // "tasksemtempodeespera" field.
  List<TempodeesperatasksStruct>? _tasksemtempodeespera;
  List<TempodeesperatasksStruct> get tasksemtempodeespera =>
      _tasksemtempodeespera ?? const [];
  bool hasTasksemtempodeespera() => _tasksemtempodeespera != null;

  // "saldoALiberar" field.
  double? _saldoALiberar;
  double get saldoALiberar => _saldoALiberar ?? 0.0;
  bool hasSaldoALiberar() => _saldoALiberar != null;

  // "tasksCompleted" field.
  List<DocumentReference>? _tasksCompleted;
  List<DocumentReference> get tasksCompleted => _tasksCompleted ?? const [];
  bool hasTasksCompleted() => _tasksCompleted != null;

  // "aboutthtask" field.
  List<AboutthetaskStruct>? _aboutthtask;
  List<AboutthetaskStruct> get aboutthtask => _aboutthtask ?? const [];
  bool hasAboutthtask() => _aboutthtask != null;

  // "comunnity" field.
  String? _comunnity;
  String get comunnity => _comunnity ?? '';
  bool hasComunnity() => _comunnity != null;

  // "plataform" field.
  List<String>? _plataform;
  List<String> get plataform => _plataform ?? const [];
  bool hasPlataform() => _plataform != null;

  // "eitnia" field.
  String? _eitnia;
  String get eitnia => _eitnia ?? '';
  bool hasEitnia() => _eitnia != null;

  // "tokenparaliberar" field.
  int? _tokenparaliberar;
  int get tokenparaliberar => _tokenparaliberar ?? 0;
  bool hasTokenparaliberar() => _tokenparaliberar != null;

  // "documentId" field.
  String? _documentId;
  String get documentId => _documentId ?? '';
  bool hasDocumentId() => _documentId != null;

  // "region" field.
  String? _region;
  String get region => _region ?? '';
  bool hasRegion() => _region != null;

  // "accountNumber" field.
  String? _accountNumber;
  String get accountNumber => _accountNumber ?? '';
  bool hasAccountNumber() => _accountNumber != null;

  // "bankCode" field.
  String? _bankCode;
  String get bankCode => _bankCode ?? '';
  bool hasBankCode() => _bankCode != null;

  // "branchNumber" field.
  String? _branchNumber;
  String get branchNumber => _branchNumber ?? '';
  bool hasBranchNumber() => _branchNumber != null;

  // "selfie" field.
  String? _selfie;
  String get selfie => _selfie ?? '';
  bool hasSelfie() => _selfie != null;

  // "documentofrente" field.
  String? _documentofrente;
  String get documentofrente => _documentofrente ?? '';
  bool hasDocumentofrente() => _documentofrente != null;

  // "documentoverso" field.
  String? _documentoverso;
  String get documentoverso => _documentoverso ?? '';
  bool hasDocumentoverso() => _documentoverso != null;

  // "diaqenviouaverificacao" field.
  DateTime? _diaqenviouaverificacao;
  DateTime? get diaqenviouaverificacao => _diaqenviouaverificacao;
  bool hasDiaqenviouaverificacao() => _diaqenviouaverificacao != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _editedTime = snapshotData['edited_time'] as DateTime?;
    _bio = snapshotData['bio'] as String?;
    _userName = snapshotData['user_name'] as String?;
    _creditCard = getStructList(
      snapshotData['credit_card'],
      NewcartaodecreditoStruct.fromMap,
    );
    _stripeAccountID = snapshotData['stripeAccountID'] as String?;
    _stripeChargeEnable = snapshotData['stripeChargeEnable'] as bool?;
    _hobbys = getDataList(snapshotData['hobbys']);
    _genero = snapshotData['genero'] as String?;
    _facebook = snapshotData['facebook'] as String?;
    _location = snapshotData['location'] as LatLng?;
    _iDdastasksAceitadas = getDataList(snapshotData['iDdastasksAceitadas']);
    _avaliacoes = getStructList(
      snapshotData['avaliacoes'],
      AvaliacoesStruct.fromMap,
    );
    _tasksRealizadas = getDataList(snapshotData['tasksRealizadas']);
    _quantTasksRealizadas =
        castToType<int>(snapshotData['quantTasksRealizadas']);
    _taskOrTaskee = snapshotData['taskOrTaskee'] as String?;
    _saldo = castToType<double>(snapshotData['saldo']);
    _deposityTransacoes = getStructList(
      snapshotData['deposityTransacoes'],
      DepositsTaskeeStruct.fromMap,
    );
    _clienteStripeId = snapshotData['clienteStripeId'] as String?;
    _dob = snapshotData['dob'] as DateTime?;
    _verifyaccount = snapshotData['verifyaccount'] as bool?;
    _rating = castToType<double>(snapshotData['rating']);
    _transferId = snapshotData['transferId'] as String?;
    _requestPedidos = getDataList(snapshotData['requestPedidos']);
    _requestEmNumber = castToType<int>(snapshotData['requestEmNumber']);
    _mostOrded = getDataList(snapshotData['mostOrded']);
    _tasksemtempodeespera = getStructList(
      snapshotData['tasksemtempodeespera'],
      TempodeesperatasksStruct.fromMap,
    );
    _saldoALiberar = castToType<double>(snapshotData['saldoALiberar']);
    _tasksCompleted = getDataList(snapshotData['tasksCompleted']);
    _aboutthtask = getStructList(
      snapshotData['aboutthtask'],
      AboutthetaskStruct.fromMap,
    );
    _comunnity = snapshotData['comunnity'] as String?;
    _plataform = getDataList(snapshotData['plataform']);
    _eitnia = snapshotData['eitnia'] as String?;
    _tokenparaliberar = castToType<int>(snapshotData['tokenparaliberar']);
    _documentId = snapshotData['documentId'] as String?;
    _region = snapshotData['region'] as String?;
    _accountNumber = snapshotData['accountNumber'] as String?;
    _bankCode = snapshotData['bankCode'] as String?;
    _branchNumber = snapshotData['branchNumber'] as String?;
    _selfie = snapshotData['selfie'] as String?;
    _documentofrente = snapshotData['documentofrente'] as String?;
    _documentoverso = snapshotData['documentoverso'] as String?;
    _diaqenviouaverificacao =
        snapshotData['diaqenviouaverificacao'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? editedTime,
  String? bio,
  String? userName,
  String? stripeAccountID,
  bool? stripeChargeEnable,
  String? genero,
  String? facebook,
  LatLng? location,
  int? quantTasksRealizadas,
  String? taskOrTaskee,
  double? saldo,
  String? clienteStripeId,
  DateTime? dob,
  bool? verifyaccount,
  double? rating,
  String? transferId,
  int? requestEmNumber,
  double? saldoALiberar,
  String? comunnity,
  String? eitnia,
  int? tokenparaliberar,
  String? documentId,
  String? region,
  String? accountNumber,
  String? bankCode,
  String? branchNumber,
  String? selfie,
  String? documentofrente,
  String? documentoverso,
  DateTime? diaqenviouaverificacao,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'edited_time': editedTime,
      'bio': bio,
      'user_name': userName,
      'stripeAccountID': stripeAccountID,
      'stripeChargeEnable': stripeChargeEnable,
      'genero': genero,
      'facebook': facebook,
      'location': location,
      'quantTasksRealizadas': quantTasksRealizadas,
      'taskOrTaskee': taskOrTaskee,
      'saldo': saldo,
      'clienteStripeId': clienteStripeId,
      'dob': dob,
      'verifyaccount': verifyaccount,
      'rating': rating,
      'transferId': transferId,
      'requestEmNumber': requestEmNumber,
      'saldoALiberar': saldoALiberar,
      'comunnity': comunnity,
      'eitnia': eitnia,
      'tokenparaliberar': tokenparaliberar,
      'documentId': documentId,
      'region': region,
      'accountNumber': accountNumber,
      'bankCode': bankCode,
      'branchNumber': branchNumber,
      'selfie': selfie,
      'documentofrente': documentofrente,
      'documentoverso': documentoverso,
      'diaqenviouaverificacao': diaqenviouaverificacao,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.editedTime == e2?.editedTime &&
        e1?.bio == e2?.bio &&
        e1?.userName == e2?.userName &&
        listEquality.equals(e1?.creditCard, e2?.creditCard) &&
        e1?.stripeAccountID == e2?.stripeAccountID &&
        e1?.stripeChargeEnable == e2?.stripeChargeEnable &&
        listEquality.equals(e1?.hobbys, e2?.hobbys) &&
        e1?.genero == e2?.genero &&
        e1?.facebook == e2?.facebook &&
        e1?.location == e2?.location &&
        listEquality.equals(e1?.iDdastasksAceitadas, e2?.iDdastasksAceitadas) &&
        listEquality.equals(e1?.avaliacoes, e2?.avaliacoes) &&
        listEquality.equals(e1?.tasksRealizadas, e2?.tasksRealizadas) &&
        e1?.quantTasksRealizadas == e2?.quantTasksRealizadas &&
        e1?.taskOrTaskee == e2?.taskOrTaskee &&
        e1?.saldo == e2?.saldo &&
        listEquality.equals(e1?.deposityTransacoes, e2?.deposityTransacoes) &&
        e1?.clienteStripeId == e2?.clienteStripeId &&
        e1?.dob == e2?.dob &&
        e1?.verifyaccount == e2?.verifyaccount &&
        e1?.rating == e2?.rating &&
        e1?.transferId == e2?.transferId &&
        listEquality.equals(e1?.requestPedidos, e2?.requestPedidos) &&
        e1?.requestEmNumber == e2?.requestEmNumber &&
        listEquality.equals(e1?.mostOrded, e2?.mostOrded) &&
        listEquality.equals(
            e1?.tasksemtempodeespera, e2?.tasksemtempodeespera) &&
        e1?.saldoALiberar == e2?.saldoALiberar &&
        listEquality.equals(e1?.tasksCompleted, e2?.tasksCompleted) &&
        listEquality.equals(e1?.aboutthtask, e2?.aboutthtask) &&
        e1?.comunnity == e2?.comunnity &&
        listEquality.equals(e1?.plataform, e2?.plataform) &&
        e1?.eitnia == e2?.eitnia &&
        e1?.tokenparaliberar == e2?.tokenparaliberar &&
        e1?.documentId == e2?.documentId &&
        e1?.region == e2?.region &&
        e1?.accountNumber == e2?.accountNumber &&
        e1?.bankCode == e2?.bankCode &&
        e1?.branchNumber == e2?.branchNumber &&
        e1?.selfie == e2?.selfie &&
        e1?.documentofrente == e2?.documentofrente &&
        e1?.documentoverso == e2?.documentoverso &&
        e1?.diaqenviouaverificacao == e2?.diaqenviouaverificacao;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.editedTime,
        e?.bio,
        e?.userName,
        e?.creditCard,
        e?.stripeAccountID,
        e?.stripeChargeEnable,
        e?.hobbys,
        e?.genero,
        e?.facebook,
        e?.location,
        e?.iDdastasksAceitadas,
        e?.avaliacoes,
        e?.tasksRealizadas,
        e?.quantTasksRealizadas,
        e?.taskOrTaskee,
        e?.saldo,
        e?.deposityTransacoes,
        e?.clienteStripeId,
        e?.dob,
        e?.verifyaccount,
        e?.rating,
        e?.transferId,
        e?.requestPedidos,
        e?.requestEmNumber,
        e?.mostOrded,
        e?.tasksemtempodeespera,
        e?.saldoALiberar,
        e?.tasksCompleted,
        e?.aboutthtask,
        e?.comunnity,
        e?.plataform,
        e?.eitnia,
        e?.tokenparaliberar,
        e?.documentId,
        e?.region,
        e?.accountNumber,
        e?.bankCode,
        e?.branchNumber,
        e?.selfie,
        e?.documentofrente,
        e?.documentoverso,
        e?.diaqenviouaverificacao
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
