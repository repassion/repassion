import 'dart:async';

import 'package:from_css_color/from_css_color.dart';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'passion_record.g.dart';

abstract class PassionRecord
    implements Built<PassionRecord, PassionRecordBuilder> {
  static Serializer<PassionRecord> get serializer => _$passionRecordSerializer;

  String? get title;

  String? get description;

  String? get image;

  String? get video;

  String? get text;

  int? get likes;

  DocumentReference? get author;

  DateTime? get edited;

  bool? get verified;

  String? get type;

  bool? get none;

  bool? get public;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PassionRecordBuilder builder) => builder
    ..title = ''
    ..description = ''
    ..image = ''
    ..video = ''
    ..text = ''
    ..likes = 0
    ..verified = false
    ..type = ''
    ..none = false
    ..public = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passion');

  static Stream<PassionRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PassionRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static PassionRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PassionRecord(
        (c) => c
          ..title = snapshot.data['title']
          ..description = snapshot.data['description']
          ..image = snapshot.data['image']
          ..video = snapshot.data['video']
          ..text = snapshot.data['text']
          ..likes = snapshot.data['likes']?.round()
          ..author = safeGet(() => toRef(snapshot.data['author']))
          ..edited = safeGet(() =>
              DateTime.fromMillisecondsSinceEpoch(snapshot.data['edited']))
          ..verified = snapshot.data['verified']
          ..type = snapshot.data['type']
          ..none = snapshot.data['none']
          ..public = snapshot.data['public']
          ..ffRef = PassionRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PassionRecord>> search(
          {String? term,
          FutureOr<LatLng>? location,
          int? maxResults,
          double? searchRadiusMeters}) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'passion',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
          )
          .then((r) => r.map(fromAlgolia).toList());

  PassionRecord._();
  factory PassionRecord([void Function(PassionRecordBuilder) updates]) =
      _$PassionRecord;

  static PassionRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPassionRecordData({
  String? title,
  String? description,
  String? image,
  String? video,
  String? text,
  int? likes,
  DocumentReference? author,
  DateTime? edited,
  bool? verified,
  String? type,
  bool? none,
  bool? public,
}) {
  final firestoreData = serializers.toFirestore(
    PassionRecord.serializer,
    PassionRecord(
      (p) => p
        ..title = title
        ..description = description
        ..image = image
        ..video = video
        ..text = text
        ..likes = likes
        ..author = author
        ..edited = edited
        ..verified = verified
        ..type = type
        ..none = none
        ..public = public,
    ),
  );

  return firestoreData;
}
