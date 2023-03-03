import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'request_record.g.dart';

abstract class RequestRecord
    implements Built<RequestRecord, RequestRecordBuilder> {
  static Serializer<RequestRecord> get serializer => _$requestRecordSerializer;

  DocumentReference? get uid1;

  DocumentReference? get uid2;

  DateTime? get datetime;

  String? get status;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(RequestRecordBuilder builder) =>
      builder..status = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  RequestRecord._();
  factory RequestRecord([void Function(RequestRecordBuilder) updates]) =
      _$RequestRecord;

  static RequestRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createRequestRecordData({
  DocumentReference? uid1,
  DocumentReference? uid2,
  DateTime? datetime,
  String? status,
}) {
  final firestoreData = serializers.toFirestore(
    RequestRecord.serializer,
    RequestRecord(
      (r) => r
        ..uid1 = uid1
        ..uid2 = uid2
        ..datetime = datetime
        ..status = status,
    ),
  );

  return firestoreData;
}
