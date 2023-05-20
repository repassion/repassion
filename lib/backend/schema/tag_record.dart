import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TagRecord extends FirestoreRecord {
  TagRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "colour" field.
  Color? _colour;
  Color? get colour => _colour;
  bool hasColour() => _colour != null;

  // "synonyms" field.
  List<String>? _synonyms;
  List<String> get synonyms => _synonyms ?? const [];
  bool hasSynonyms() => _synonyms != null;

  void _initializeFields() {
    _text = snapshotData['text'] as String?;
    _colour = getSchemaColor(snapshotData['colour']);
    _synonyms = getDataList(snapshotData['synonyms']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tag');

  static Stream<TagRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TagRecord.fromSnapshot(s));

  static Future<TagRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TagRecord.fromSnapshot(s));

  static TagRecord fromSnapshot(DocumentSnapshot snapshot) => TagRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TagRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TagRecord._(reference, mapFromFirestore(data));

  static TagRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      TagRecord.getDocumentFromData(
        {
          'text': snapshot.data['text'],
          'colour': safeGet(
            () => fromCssColor(snapshot.data['colour']),
          ),
          'synonyms': safeGet(
            () => snapshot.data['synonyms'].toList(),
          ),
        },
        TagRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<TagRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'tag',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'TagRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTagRecordData({
  String? text,
  Color? colour,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'text': text,
      'colour': colour,
    }.withoutNulls,
  );

  return firestoreData;
}
