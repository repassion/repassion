import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserRecord extends FirestoreRecord {
  UserRecord._(
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

  // "first_name" field.
  String? _firstName;
  String get firstName => _firstName ?? '';
  bool hasFirstName() => _firstName != null;

  // "last_name" field.
  String? _lastName;
  String get lastName => _lastName ?? '';
  bool hasLastName() => _lastName != null;

  // "age" field.
  int? _age;
  int get age => _age ?? 0;
  bool hasAge() => _age != null;

  // "birthdate" field.
  String? _birthdate;
  String get birthdate => _birthdate ?? '';
  bool hasBirthdate() => _birthdate != null;

  // "info" field.
  String? _info;
  String get info => _info ?? '';
  bool hasInfo() => _info != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "location_address" field.
  String? _locationAddress;
  String get locationAddress => _locationAddress ?? '';
  bool hasLocationAddress() => _locationAddress != null;

  // "location_latlng" field.
  LatLng? _locationLatlng;
  LatLng? get locationLatlng => _locationLatlng;
  bool hasLocationLatlng() => _locationLatlng != null;

  // "tags" field.
  List<DocumentReference>? _tags;
  List<DocumentReference> get tags => _tags ?? const [];
  bool hasTags() => _tags != null;

  // "main_tags" field.
  List<DocumentReference>? _mainTags;
  List<DocumentReference> get mainTags => _mainTags ?? const [];
  bool hasMainTags() => _mainTags != null;

  // "requests" field.
  List<String>? _requests;
  List<String> get requests => _requests ?? const [];
  bool hasRequests() => _requests != null;

  // "about" field.
  String? _about;
  String get about => _about ?? '';
  bool hasAbout() => _about != null;

  // "passion" field.
  DocumentReference? _passion;
  DocumentReference? get passion => _passion;
  bool hasPassion() => _passion != null;

  // "likes" field.
  List<DocumentReference>? _likes;
  List<DocumentReference> get likes => _likes ?? const [];
  bool hasLikes() => _likes != null;

  // "startupPassion" field.
  bool? _startupPassion;
  bool get startupPassion => _startupPassion ?? false;
  bool hasStartupPassion() => _startupPassion != null;

  // "privacy_version" field.
  String? _privacyVersion;
  String get privacyVersion => _privacyVersion ?? '';
  bool hasPrivacyVersion() => _privacyVersion != null;

  // "dark_mode" field.
  bool? _darkMode;
  bool get darkMode => _darkMode ?? false;
  bool hasDarkMode() => _darkMode != null;

  // "cache_override" field.
  List<String>? _cacheOverride;
  List<String> get cacheOverride => _cacheOverride ?? const [];
  bool hasCacheOverride() => _cacheOverride != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _firstName = snapshotData['first_name'] as String?;
    _lastName = snapshotData['last_name'] as String?;
    _age = snapshotData['age'] as int?;
    _birthdate = snapshotData['birthdate'] as String?;
    _info = snapshotData['info'] as String?;
    _verified = snapshotData['verified'] as bool?;
    _locationAddress = snapshotData['location_address'] as String?;
    _locationLatlng = snapshotData['location_latlng'] as LatLng?;
    _tags = getDataList(snapshotData['tags']);
    _mainTags = getDataList(snapshotData['main_tags']);
    _requests = getDataList(snapshotData['requests']);
    _about = snapshotData['about'] as String?;
    _passion = snapshotData['passion'] as DocumentReference?;
    _likes = getDataList(snapshotData['likes']);
    _startupPassion = snapshotData['startupPassion'] as bool?;
    _privacyVersion = snapshotData['privacy_version'] as String?;
    _darkMode = snapshotData['dark_mode'] as bool?;
    _cacheOverride = getDataList(snapshotData['cache_override']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserRecord.fromSnapshot(s));

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserRecord.fromSnapshot(s));

  static UserRecord fromSnapshot(DocumentSnapshot snapshot) => UserRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createUserRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  String? firstName,
  String? lastName,
  int? age,
  String? birthdate,
  String? info,
  bool? verified,
  String? locationAddress,
  LatLng? locationLatlng,
  String? about,
  DocumentReference? passion,
  bool? startupPassion,
  String? privacyVersion,
  bool? darkMode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'first_name': firstName,
      'last_name': lastName,
      'age': age,
      'birthdate': birthdate,
      'info': info,
      'verified': verified,
      'location_address': locationAddress,
      'location_latlng': locationLatlng,
      'about': about,
      'passion': passion,
      'startupPassion': startupPassion,
      'privacy_version': privacyVersion,
      'dark_mode': darkMode,
    }.withoutNulls,
  );

  return firestoreData;
}
