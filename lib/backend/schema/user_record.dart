import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_record.g.dart';

abstract class UserRecord implements Built<UserRecord, UserRecordBuilder> {
  static Serializer<UserRecord> get serializer => _$userRecordSerializer;

  String? get email;

  @BuiltValueField(wireName: 'display_name')
  String? get displayName;

  @BuiltValueField(wireName: 'photo_url')
  String? get photoUrl;

  String? get uid;

  @BuiltValueField(wireName: 'created_time')
  DateTime? get createdTime;

  @BuiltValueField(wireName: 'phone_number')
  String? get phoneNumber;

  @BuiltValueField(wireName: 'first_name')
  String? get firstName;

  @BuiltValueField(wireName: 'last_name')
  String? get lastName;

  int? get age;

  String? get birthdate;

  String? get info;

  bool? get verified;

  @BuiltValueField(wireName: 'location_address')
  String? get locationAddress;

  @BuiltValueField(wireName: 'location_latlng')
  LatLng? get locationLatlng;

  BuiltList<DocumentReference>? get tags;

  @BuiltValueField(wireName: 'main_tags')
  BuiltList<DocumentReference>? get mainTags;

  BuiltList<String>? get requests;

  String? get about;

  DocumentReference? get passion;

  BuiltList<DocumentReference>? get likes;

  bool? get startupPassion;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(UserRecordBuilder builder) => builder
    ..email = ''
    ..displayName = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..firstName = ''
    ..lastName = ''
    ..age = 0
    ..birthdate = ''
    ..info = ''
    ..verified = false
    ..locationAddress = ''
    ..tags = ListBuilder()
    ..mainTags = ListBuilder()
    ..requests = ListBuilder()
    ..about = ''
    ..likes = ListBuilder()
    ..startupPassion = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('user');

  static Stream<UserRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<UserRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  UserRecord._();
  factory UserRecord([void Function(UserRecordBuilder) updates]) = _$UserRecord;

  static UserRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
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
}) {
  final firestoreData = serializers.toFirestore(
    UserRecord.serializer,
    UserRecord(
      (u) => u
        ..email = email
        ..displayName = displayName
        ..photoUrl = photoUrl
        ..uid = uid
        ..createdTime = createdTime
        ..phoneNumber = phoneNumber
        ..firstName = firstName
        ..lastName = lastName
        ..age = age
        ..birthdate = birthdate
        ..info = info
        ..verified = verified
        ..locationAddress = locationAddress
        ..locationLatlng = locationLatlng
        ..tags = null
        ..mainTags = null
        ..requests = null
        ..about = about
        ..passion = passion
        ..likes = null
        ..startupPassion = startupPassion,
    ),
  );

  return firestoreData;
}
