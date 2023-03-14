import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'titles_record.g.dart';

abstract class TitlesRecord
    implements Built<TitlesRecord, TitlesRecordBuilder> {
  static Serializer<TitlesRecord> get serializer => _$titlesRecordSerializer;

  String? get name;

  String? get abbreviation;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TitlesRecordBuilder builder) => builder
    ..name = ''
    ..abbreviation = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('titles');

  static Stream<TitlesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TitlesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  TitlesRecord._();
  factory TitlesRecord([void Function(TitlesRecordBuilder) updates]) =
      _$TitlesRecord;

  static TitlesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTitlesRecordData({
  String? name,
  String? abbreviation,
}) {
  final firestoreData = serializers.toFirestore(
    TitlesRecord.serializer,
    TitlesRecord(
      (t) => t
        ..name = name
        ..abbreviation = abbreviation,
    ),
  );

  return firestoreData;
}
