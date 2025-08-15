import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TasksRecord extends FirestoreRecord {
  TasksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "Foto" field.
  List<String>? _foto;
  List<String> get foto => _foto ?? const [];
  bool hasFoto() => _foto != null;

  // "Titulo" field.
  String? _titulo;
  String get titulo => _titulo ?? '';
  bool hasTitulo() => _titulo != null;

  // "Descricao" field.
  String? _descricao;
  String get descricao => _descricao ?? '';
  bool hasDescricao() => _descricao != null;

  // "Categoria" field.
  String? _categoria;
  String get categoria => _categoria ?? '';
  bool hasCategoria() => _categoria != null;

  // "MateriaisNecessarios" field.
  String? _materiaisNecessarios;
  String get materiaisNecessarios => _materiaisNecessarios ?? '';
  bool hasMateriaisNecessarios() => _materiaisNecessarios != null;

  // "userReference" field.
  DocumentReference? _userReference;
  DocumentReference? get userReference => _userReference;
  bool hasUserReference() => _userReference != null;

  // "Tempo" field.
  DateTime? _tempo;
  DateTime? get tempo => _tempo;
  bool hasTempo() => _tempo != null;

  // "Data" field.
  DateTime? _data;
  DateTime? get data => _data;
  bool hasData() => _data != null;

  // "PagamentoPrecos" field.
  double? _pagamentoPrecos;
  double get pagamentoPrecos => _pagamentoPrecos ?? 0.0;
  bool hasPagamentoPrecos() => _pagamentoPrecos != null;

  // "aceito" field.
  bool? _aceito;
  bool get aceito => _aceito ?? false;
  bool hasAceito() => _aceito != null;

  // "idDaTask" field.
  String? _idDaTask;
  String get idDaTask => _idDaTask ?? '';
  bool hasIdDaTask() => _idDaTask != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "taxa" field.
  String? _taxa;
  String get taxa => _taxa ?? '';
  bool hasTaxa() => _taxa != null;

  // "valorTotal" field.
  String? _valorTotal;
  String get valorTotal => _valorTotal ?? '';
  bool hasValorTotal() => _valorTotal != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "valor" field.
  String? _valor;
  String get valor => _valor ?? '';
  bool hasValor() => _valor != null;

  // "valorDeUrgencia" field.
  String? _valorDeUrgencia;
  String get valorDeUrgencia => _valorDeUrgencia ?? '';
  bool hasValorDeUrgencia() => _valorDeUrgencia != null;

  // "acceptRenegociate" field.
  bool? _acceptRenegociate;
  bool get acceptRenegociate => _acceptRenegociate ?? false;
  bool hasAcceptRenegociate() => _acceptRenegociate != null;

  // "usuarioQueAceitouaTask" field.
  DocumentReference? _usuarioQueAceitouaTask;
  DocumentReference? get usuarioQueAceitouaTask => _usuarioQueAceitouaTask;
  bool hasUsuarioQueAceitouaTask() => _usuarioQueAceitouaTask != null;

  // "FornecedorDosMateriais" field.
  String? _fornecedorDosMateriais;
  String get fornecedorDosMateriais => _fornecedorDosMateriais ?? '';
  bool hasFornecedorDosMateriais() => _fornecedorDosMateriais != null;

  // "localizacao" field.
  EnderecoTasksStruct? _localizacao;
  EnderecoTasksStruct get localizacao => _localizacao ?? EnderecoTasksStruct();
  bool hasLocalizacao() => _localizacao != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "fastpass" field.
  String? _fastpass;
  String get fastpass => _fastpass ?? '';
  bool hasFastpass() => _fastpass != null;

  // "taskPrePronta" field.
  DocumentReference? _taskPrePronta;
  DocumentReference? get taskPrePronta => _taskPrePronta;
  bool hasTaskPrePronta() => _taskPrePronta != null;

  // "stepsFinalizadas" field.
  int? _stepsFinalizadas;
  int get stepsFinalizadas => _stepsFinalizadas ?? 0;
  bool hasStepsFinalizadas() => _stepsFinalizadas != null;

  // "fotosFinaisTask" field.
  List<String>? _fotosFinaisTask;
  List<String> get fotosFinaisTask => _fotosFinaisTask ?? const [];
  bool hasFotosFinaisTask() => _fotosFinaisTask != null;

  // "stepsInText" field.
  List<String>? _stepsInText;
  List<String> get stepsInText => _stepsInText ?? const [];
  bool hasStepsInText() => _stepsInText != null;

  // "avaliado" field.
  bool? _avaliado;
  bool get avaliado => _avaliado ?? false;
  bool hasAvaliado() => _avaliado != null;

  // "tempodeesperadosusuarioes" field.
  List<TempodeesperatasksStruct>? _tempodeesperadosusuarioes;
  List<TempodeesperatasksStruct> get tempodeesperadosusuarioes =>
      _tempodeesperadosusuarioes ?? const [];
  bool hasTempodeesperadosusuarioes() => _tempodeesperadosusuarioes != null;

  // "underEvaluetion" field.
  bool? _underEvaluetion;
  bool get underEvaluetion => _underEvaluetion ?? false;
  bool hasUnderEvaluetion() => _underEvaluetion != null;

  // "viewes" field.
  int? _viewes;
  int get viewes => _viewes ?? 0;
  bool hasViewes() => _viewes != null;

  // "datadecriacaodatask" field.
  DateTime? _datadecriacaodatask;
  DateTime? get datadecriacaodatask => _datadecriacaodatask;
  bool hasDatadecriacaodatask() => _datadecriacaodatask != null;

  // "dataqueaceitou" field.
  DateTime? _dataqueaceitou;
  DateTime? get dataqueaceitou => _dataqueaceitou;
  bool hasDataqueaceitou() => _dataqueaceitou != null;

  // "taskeeFinish" field.
  bool? _taskeeFinish;
  bool get taskeeFinish => _taskeeFinish ?? false;
  bool hasTaskeeFinish() => _taskeeFinish != null;

  // "taskerFinish" field.
  bool? _taskerFinish;
  bool get taskerFinish => _taskerFinish ?? false;
  bool hasTaskerFinish() => _taskerFinish != null;

  // "orderAgain" field.
  bool? _orderAgain;
  bool get orderAgain => _orderAgain ?? false;
  bool hasOrderAgain() => _orderAgain != null;

  // "qstoken" field.
  int? _qstoken;
  int get qstoken => _qstoken ?? 0;
  bool hasQstoken() => _qstoken != null;

  void _initializeFields() {
    _foto = getDataList(snapshotData['Foto']);
    _titulo = snapshotData['Titulo'] as String?;
    _descricao = snapshotData['Descricao'] as String?;
    _categoria = snapshotData['Categoria'] as String?;
    _materiaisNecessarios = snapshotData['MateriaisNecessarios'] as String?;
    _userReference = snapshotData['userReference'] as DocumentReference?;
    _tempo = snapshotData['Tempo'] as DateTime?;
    _data = snapshotData['Data'] as DateTime?;
    _pagamentoPrecos = castToType<double>(snapshotData['PagamentoPrecos']);
    _aceito = snapshotData['aceito'] as bool?;
    _idDaTask = snapshotData['idDaTask'] as String?;
    _status = snapshotData['status'] as String?;
    _taxa = snapshotData['taxa'] as String?;
    _valorTotal = snapshotData['valorTotal'] as String?;
    _priority = snapshotData['priority'] as String?;
    _valor = snapshotData['valor'] as String?;
    _valorDeUrgencia = snapshotData['valorDeUrgencia'] as String?;
    _acceptRenegociate = snapshotData['acceptRenegociate'] as bool?;
    _usuarioQueAceitouaTask =
        snapshotData['usuarioQueAceitouaTask'] as DocumentReference?;
    _fornecedorDosMateriais = snapshotData['FornecedorDosMateriais'] as String?;
    _localizacao = snapshotData['localizacao'] is EnderecoTasksStruct
        ? snapshotData['localizacao']
        : EnderecoTasksStruct.maybeFromMap(snapshotData['localizacao']);
    _location = snapshotData['location'] as LatLng?;
    _fastpass = snapshotData['fastpass'] as String?;
    _taskPrePronta = snapshotData['taskPrePronta'] as DocumentReference?;
    _stepsFinalizadas = castToType<int>(snapshotData['stepsFinalizadas']);
    _fotosFinaisTask = getDataList(snapshotData['fotosFinaisTask']);
    _stepsInText = getDataList(snapshotData['stepsInText']);
    _avaliado = snapshotData['avaliado'] as bool?;
    _tempodeesperadosusuarioes = getStructList(
      snapshotData['tempodeesperadosusuarioes'],
      TempodeesperatasksStruct.fromMap,
    );
    _underEvaluetion = snapshotData['underEvaluetion'] as bool?;
    _viewes = castToType<int>(snapshotData['viewes']);
    _datadecriacaodatask = snapshotData['datadecriacaodatask'] as DateTime?;
    _dataqueaceitou = snapshotData['dataqueaceitou'] as DateTime?;
    _taskeeFinish = snapshotData['taskeeFinish'] as bool?;
    _taskerFinish = snapshotData['taskerFinish'] as bool?;
    _orderAgain = snapshotData['orderAgain'] as bool?;
    _qstoken = castToType<int>(snapshotData['qstoken']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tasks');

  static Stream<TasksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TasksRecord.fromSnapshot(s));

  static Future<TasksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TasksRecord.fromSnapshot(s));

  static TasksRecord fromSnapshot(DocumentSnapshot snapshot) => TasksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TasksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TasksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TasksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TasksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTasksRecordData({
  String? titulo,
  String? descricao,
  String? categoria,
  String? materiaisNecessarios,
  DocumentReference? userReference,
  DateTime? tempo,
  DateTime? data,
  double? pagamentoPrecos,
  bool? aceito,
  String? idDaTask,
  String? status,
  String? taxa,
  String? valorTotal,
  String? priority,
  String? valor,
  String? valorDeUrgencia,
  bool? acceptRenegociate,
  DocumentReference? usuarioQueAceitouaTask,
  String? fornecedorDosMateriais,
  EnderecoTasksStruct? localizacao,
  LatLng? location,
  String? fastpass,
  DocumentReference? taskPrePronta,
  int? stepsFinalizadas,
  bool? avaliado,
  bool? underEvaluetion,
  int? viewes,
  DateTime? datadecriacaodatask,
  DateTime? dataqueaceitou,
  bool? taskeeFinish,
  bool? taskerFinish,
  bool? orderAgain,
  int? qstoken,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Titulo': titulo,
      'Descricao': descricao,
      'Categoria': categoria,
      'MateriaisNecessarios': materiaisNecessarios,
      'userReference': userReference,
      'Tempo': tempo,
      'Data': data,
      'PagamentoPrecos': pagamentoPrecos,
      'aceito': aceito,
      'idDaTask': idDaTask,
      'status': status,
      'taxa': taxa,
      'valorTotal': valorTotal,
      'priority': priority,
      'valor': valor,
      'valorDeUrgencia': valorDeUrgencia,
      'acceptRenegociate': acceptRenegociate,
      'usuarioQueAceitouaTask': usuarioQueAceitouaTask,
      'FornecedorDosMateriais': fornecedorDosMateriais,
      'localizacao': EnderecoTasksStruct().toMap(),
      'location': location,
      'fastpass': fastpass,
      'taskPrePronta': taskPrePronta,
      'stepsFinalizadas': stepsFinalizadas,
      'avaliado': avaliado,
      'underEvaluetion': underEvaluetion,
      'viewes': viewes,
      'datadecriacaodatask': datadecriacaodatask,
      'dataqueaceitou': dataqueaceitou,
      'taskeeFinish': taskeeFinish,
      'taskerFinish': taskerFinish,
      'orderAgain': orderAgain,
      'qstoken': qstoken,
    }.withoutNulls,
  );

  // Handle nested data for "localizacao" field.
  addEnderecoTasksStructData(firestoreData, localizacao, 'localizacao');

  return firestoreData;
}

class TasksRecordDocumentEquality implements Equality<TasksRecord> {
  const TasksRecordDocumentEquality();

  @override
  bool equals(TasksRecord? e1, TasksRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.foto, e2?.foto) &&
        e1?.titulo == e2?.titulo &&
        e1?.descricao == e2?.descricao &&
        e1?.categoria == e2?.categoria &&
        e1?.materiaisNecessarios == e2?.materiaisNecessarios &&
        e1?.userReference == e2?.userReference &&
        e1?.tempo == e2?.tempo &&
        e1?.data == e2?.data &&
        e1?.pagamentoPrecos == e2?.pagamentoPrecos &&
        e1?.aceito == e2?.aceito &&
        e1?.idDaTask == e2?.idDaTask &&
        e1?.status == e2?.status &&
        e1?.taxa == e2?.taxa &&
        e1?.valorTotal == e2?.valorTotal &&
        e1?.priority == e2?.priority &&
        e1?.valor == e2?.valor &&
        e1?.valorDeUrgencia == e2?.valorDeUrgencia &&
        e1?.acceptRenegociate == e2?.acceptRenegociate &&
        e1?.usuarioQueAceitouaTask == e2?.usuarioQueAceitouaTask &&
        e1?.fornecedorDosMateriais == e2?.fornecedorDosMateriais &&
        e1?.localizacao == e2?.localizacao &&
        e1?.location == e2?.location &&
        e1?.fastpass == e2?.fastpass &&
        e1?.taskPrePronta == e2?.taskPrePronta &&
        e1?.stepsFinalizadas == e2?.stepsFinalizadas &&
        listEquality.equals(e1?.fotosFinaisTask, e2?.fotosFinaisTask) &&
        listEquality.equals(e1?.stepsInText, e2?.stepsInText) &&
        e1?.avaliado == e2?.avaliado &&
        listEquality.equals(
            e1?.tempodeesperadosusuarioes, e2?.tempodeesperadosusuarioes) &&
        e1?.underEvaluetion == e2?.underEvaluetion &&
        e1?.viewes == e2?.viewes &&
        e1?.datadecriacaodatask == e2?.datadecriacaodatask &&
        e1?.dataqueaceitou == e2?.dataqueaceitou &&
        e1?.taskeeFinish == e2?.taskeeFinish &&
        e1?.taskerFinish == e2?.taskerFinish &&
        e1?.orderAgain == e2?.orderAgain &&
        e1?.qstoken == e2?.qstoken;
  }

  @override
  int hash(TasksRecord? e) => const ListEquality().hash([
        e?.foto,
        e?.titulo,
        e?.descricao,
        e?.categoria,
        e?.materiaisNecessarios,
        e?.userReference,
        e?.tempo,
        e?.data,
        e?.pagamentoPrecos,
        e?.aceito,
        e?.idDaTask,
        e?.status,
        e?.taxa,
        e?.valorTotal,
        e?.priority,
        e?.valor,
        e?.valorDeUrgencia,
        e?.acceptRenegociate,
        e?.usuarioQueAceitouaTask,
        e?.fornecedorDosMateriais,
        e?.localizacao,
        e?.location,
        e?.fastpass,
        e?.taskPrePronta,
        e?.stepsFinalizadas,
        e?.fotosFinaisTask,
        e?.stepsInText,
        e?.avaliado,
        e?.tempodeesperadosusuarioes,
        e?.underEvaluetion,
        e?.viewes,
        e?.datadecriacaodatask,
        e?.dataqueaceitou,
        e?.taskeeFinish,
        e?.taskerFinish,
        e?.orderAgain,
        e?.qstoken
      ]);

  @override
  bool isValidKey(Object? o) => o is TasksRecord;
}
