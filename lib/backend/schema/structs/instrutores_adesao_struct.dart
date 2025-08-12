// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class InstrutoresAdesaoStruct extends FFFirebaseStruct {
  InstrutoresAdesaoStruct({
    String? fullleganame,
    String? contactInformation,
    String? instagram,
    String? facebook,
    String? aboutYouself,
    String? experienceInstructor,
    String? certifications,
    String? motivate,
    String? addaptAudience,
    String? circumstances,
    String? feedback,
    String? suggests,
    String? video,
    String? engage,
    String? describeActivityLike,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _fullleganame = fullleganame,
        _contactInformation = contactInformation,
        _instagram = instagram,
        _facebook = facebook,
        _aboutYouself = aboutYouself,
        _experienceInstructor = experienceInstructor,
        _certifications = certifications,
        _motivate = motivate,
        _addaptAudience = addaptAudience,
        _circumstances = circumstances,
        _feedback = feedback,
        _suggests = suggests,
        _video = video,
        _engage = engage,
        _describeActivityLike = describeActivityLike,
        super(firestoreUtilData);

  // "fullleganame" field.
  String? _fullleganame;
  String get fullleganame => _fullleganame ?? '';
  set fullleganame(String? val) => _fullleganame = val;

  bool hasFullleganame() => _fullleganame != null;

  // "contactInformation" field.
  String? _contactInformation;
  String get contactInformation => _contactInformation ?? '';
  set contactInformation(String? val) => _contactInformation = val;

  bool hasContactInformation() => _contactInformation != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  set instagram(String? val) => _instagram = val;

  bool hasInstagram() => _instagram != null;

  // "facebook" field.
  String? _facebook;
  String get facebook => _facebook ?? '';
  set facebook(String? val) => _facebook = val;

  bool hasFacebook() => _facebook != null;

  // "aboutYouself" field.
  String? _aboutYouself;
  String get aboutYouself => _aboutYouself ?? '';
  set aboutYouself(String? val) => _aboutYouself = val;

  bool hasAboutYouself() => _aboutYouself != null;

  // "experienceInstructor" field.
  String? _experienceInstructor;
  String get experienceInstructor => _experienceInstructor ?? '';
  set experienceInstructor(String? val) => _experienceInstructor = val;

  bool hasExperienceInstructor() => _experienceInstructor != null;

  // "certifications" field.
  String? _certifications;
  String get certifications => _certifications ?? '';
  set certifications(String? val) => _certifications = val;

  bool hasCertifications() => _certifications != null;

  // "motivate" field.
  String? _motivate;
  String get motivate => _motivate ?? '';
  set motivate(String? val) => _motivate = val;

  bool hasMotivate() => _motivate != null;

  // "addaptAudience" field.
  String? _addaptAudience;
  String get addaptAudience => _addaptAudience ?? '';
  set addaptAudience(String? val) => _addaptAudience = val;

  bool hasAddaptAudience() => _addaptAudience != null;

  // "circumstances" field.
  String? _circumstances;
  String get circumstances => _circumstances ?? '';
  set circumstances(String? val) => _circumstances = val;

  bool hasCircumstances() => _circumstances != null;

  // "feedback" field.
  String? _feedback;
  String get feedback => _feedback ?? '';
  set feedback(String? val) => _feedback = val;

  bool hasFeedback() => _feedback != null;

  // "suggests" field.
  String? _suggests;
  String get suggests => _suggests ?? '';
  set suggests(String? val) => _suggests = val;

  bool hasSuggests() => _suggests != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  // "engage" field.
  String? _engage;
  String get engage => _engage ?? '';
  set engage(String? val) => _engage = val;

  bool hasEngage() => _engage != null;

  // "describeActivityLike" field.
  String? _describeActivityLike;
  String get describeActivityLike => _describeActivityLike ?? '';
  set describeActivityLike(String? val) => _describeActivityLike = val;

  bool hasDescribeActivityLike() => _describeActivityLike != null;

  static InstrutoresAdesaoStruct fromMap(Map<String, dynamic> data) =>
      InstrutoresAdesaoStruct(
        fullleganame: data['fullleganame'] as String?,
        contactInformation: data['contactInformation'] as String?,
        instagram: data['instagram'] as String?,
        facebook: data['facebook'] as String?,
        aboutYouself: data['aboutYouself'] as String?,
        experienceInstructor: data['experienceInstructor'] as String?,
        certifications: data['certifications'] as String?,
        motivate: data['motivate'] as String?,
        addaptAudience: data['addaptAudience'] as String?,
        circumstances: data['circumstances'] as String?,
        feedback: data['feedback'] as String?,
        suggests: data['suggests'] as String?,
        video: data['video'] as String?,
        engage: data['engage'] as String?,
        describeActivityLike: data['describeActivityLike'] as String?,
      );

  static InstrutoresAdesaoStruct? maybeFromMap(dynamic data) => data is Map
      ? InstrutoresAdesaoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'fullleganame': _fullleganame,
        'contactInformation': _contactInformation,
        'instagram': _instagram,
        'facebook': _facebook,
        'aboutYouself': _aboutYouself,
        'experienceInstructor': _experienceInstructor,
        'certifications': _certifications,
        'motivate': _motivate,
        'addaptAudience': _addaptAudience,
        'circumstances': _circumstances,
        'feedback': _feedback,
        'suggests': _suggests,
        'video': _video,
        'engage': _engage,
        'describeActivityLike': _describeActivityLike,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'fullleganame': serializeParam(
          _fullleganame,
          ParamType.String,
        ),
        'contactInformation': serializeParam(
          _contactInformation,
          ParamType.String,
        ),
        'instagram': serializeParam(
          _instagram,
          ParamType.String,
        ),
        'facebook': serializeParam(
          _facebook,
          ParamType.String,
        ),
        'aboutYouself': serializeParam(
          _aboutYouself,
          ParamType.String,
        ),
        'experienceInstructor': serializeParam(
          _experienceInstructor,
          ParamType.String,
        ),
        'certifications': serializeParam(
          _certifications,
          ParamType.String,
        ),
        'motivate': serializeParam(
          _motivate,
          ParamType.String,
        ),
        'addaptAudience': serializeParam(
          _addaptAudience,
          ParamType.String,
        ),
        'circumstances': serializeParam(
          _circumstances,
          ParamType.String,
        ),
        'feedback': serializeParam(
          _feedback,
          ParamType.String,
        ),
        'suggests': serializeParam(
          _suggests,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'engage': serializeParam(
          _engage,
          ParamType.String,
        ),
        'describeActivityLike': serializeParam(
          _describeActivityLike,
          ParamType.String,
        ),
      }.withoutNulls;

  static InstrutoresAdesaoStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      InstrutoresAdesaoStruct(
        fullleganame: deserializeParam(
          data['fullleganame'],
          ParamType.String,
          false,
        ),
        contactInformation: deserializeParam(
          data['contactInformation'],
          ParamType.String,
          false,
        ),
        instagram: deserializeParam(
          data['instagram'],
          ParamType.String,
          false,
        ),
        facebook: deserializeParam(
          data['facebook'],
          ParamType.String,
          false,
        ),
        aboutYouself: deserializeParam(
          data['aboutYouself'],
          ParamType.String,
          false,
        ),
        experienceInstructor: deserializeParam(
          data['experienceInstructor'],
          ParamType.String,
          false,
        ),
        certifications: deserializeParam(
          data['certifications'],
          ParamType.String,
          false,
        ),
        motivate: deserializeParam(
          data['motivate'],
          ParamType.String,
          false,
        ),
        addaptAudience: deserializeParam(
          data['addaptAudience'],
          ParamType.String,
          false,
        ),
        circumstances: deserializeParam(
          data['circumstances'],
          ParamType.String,
          false,
        ),
        feedback: deserializeParam(
          data['feedback'],
          ParamType.String,
          false,
        ),
        suggests: deserializeParam(
          data['suggests'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        engage: deserializeParam(
          data['engage'],
          ParamType.String,
          false,
        ),
        describeActivityLike: deserializeParam(
          data['describeActivityLike'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'InstrutoresAdesaoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is InstrutoresAdesaoStruct &&
        fullleganame == other.fullleganame &&
        contactInformation == other.contactInformation &&
        instagram == other.instagram &&
        facebook == other.facebook &&
        aboutYouself == other.aboutYouself &&
        experienceInstructor == other.experienceInstructor &&
        certifications == other.certifications &&
        motivate == other.motivate &&
        addaptAudience == other.addaptAudience &&
        circumstances == other.circumstances &&
        feedback == other.feedback &&
        suggests == other.suggests &&
        video == other.video &&
        engage == other.engage &&
        describeActivityLike == other.describeActivityLike;
  }

  @override
  int get hashCode => const ListEquality().hash([
        fullleganame,
        contactInformation,
        instagram,
        facebook,
        aboutYouself,
        experienceInstructor,
        certifications,
        motivate,
        addaptAudience,
        circumstances,
        feedback,
        suggests,
        video,
        engage,
        describeActivityLike
      ]);
}

InstrutoresAdesaoStruct createInstrutoresAdesaoStruct({
  String? fullleganame,
  String? contactInformation,
  String? instagram,
  String? facebook,
  String? aboutYouself,
  String? experienceInstructor,
  String? certifications,
  String? motivate,
  String? addaptAudience,
  String? circumstances,
  String? feedback,
  String? suggests,
  String? video,
  String? engage,
  String? describeActivityLike,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    InstrutoresAdesaoStruct(
      fullleganame: fullleganame,
      contactInformation: contactInformation,
      instagram: instagram,
      facebook: facebook,
      aboutYouself: aboutYouself,
      experienceInstructor: experienceInstructor,
      certifications: certifications,
      motivate: motivate,
      addaptAudience: addaptAudience,
      circumstances: circumstances,
      feedback: feedback,
      suggests: suggests,
      video: video,
      engage: engage,
      describeActivityLike: describeActivityLike,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

InstrutoresAdesaoStruct? updateInstrutoresAdesaoStruct(
  InstrutoresAdesaoStruct? instrutoresAdesao, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    instrutoresAdesao
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addInstrutoresAdesaoStructData(
  Map<String, dynamic> firestoreData,
  InstrutoresAdesaoStruct? instrutoresAdesao,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (instrutoresAdesao == null) {
    return;
  }
  if (instrutoresAdesao.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && instrutoresAdesao.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final instrutoresAdesaoData =
      getInstrutoresAdesaoFirestoreData(instrutoresAdesao, forFieldValue);
  final nestedData =
      instrutoresAdesaoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = instrutoresAdesao.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getInstrutoresAdesaoFirestoreData(
  InstrutoresAdesaoStruct? instrutoresAdesao, [
  bool forFieldValue = false,
]) {
  if (instrutoresAdesao == null) {
    return {};
  }
  final firestoreData = mapToFirestore(instrutoresAdesao.toMap());

  // Add any Firestore field values
  instrutoresAdesao.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getInstrutoresAdesaoListFirestoreData(
  List<InstrutoresAdesaoStruct>? instrutoresAdesaos,
) =>
    instrutoresAdesaos
        ?.map((e) => getInstrutoresAdesaoFirestoreData(e, true))
        .toList() ??
    [];
