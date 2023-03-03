import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tagging_record.g.dart';

abstract class TaggingRecord
    implements Built<TaggingRecord, TaggingRecordBuilder> {
  static Serializer<TaggingRecord> get serializer => _$taggingRecordSerializer;

  DocumentReference? get user;

  DocumentReference? get tag;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TaggingRecordBuilder builder) => builder;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tagging');

  static Stream<TaggingRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TaggingRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TaggingRecord._();
  factory TaggingRecord([void Function(TaggingRecordBuilder) updates]) =
      _$TaggingRecord;

  static TaggingRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTaggingRecordData({
  DocumentReference? user,
  DocumentReference? tag,
}) {
  final firestoreData = serializers.toFirestore(
    TaggingRecord.serializer,
    TaggingRecord(
      (t) => t
        ..user = user
        ..tag = tag,
    ),
  );

  return firestoreData;
}
