import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tag_record.g.dart';

abstract class TagRecord implements Built<TagRecord, TagRecordBuilder> {
  static Serializer<TagRecord> get serializer => _$tagRecordSerializer;

  String? get text;

  Color? get colour;

  BuiltList<String>? get synonyms;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(TagRecordBuilder builder) => builder
    ..text = ''
    ..synonyms = ListBuilder();

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tag');

  static Stream<TagRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<TagRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static TagRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) => TagRecord(
        (c) => c
          ..text = snapshot.data['text']
          ..colour = safeGet(() => fromCssColor(snapshot.data['colour']))
          ..synonyms = safeGet(() => ListBuilder(snapshot.data['synonyms']))
          ..ffRef = TagRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TagRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tag',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  TagRecord._();
  factory TagRecord([void Function(TagRecordBuilder) updates]) = _$TagRecord;

  static TagRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createTagRecordData({
  String? text,
  Color? colour,
}) {
  final firestoreData = serializers.toFirestore(
    TagRecord.serializer,
    TagRecord(
      (t) => t
        ..text = text
        ..colour = colour
        ..synonyms = null,
    ),
  );

  return firestoreData;
}
