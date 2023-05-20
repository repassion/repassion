import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryRecord extends FirestoreRecord {
  CategoryRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "passions" field.
  List<DocumentReference>? _passions;
  List<DocumentReference> get passions => _passions ?? const [];
  bool hasPassions() => _passions != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _passions = getDataList(snapshotData['passions']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('category');

  static Stream<CategoryRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoryRecord.fromSnapshot(s));

  static Future<CategoryRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoryRecord.fromSnapshot(s));

  static CategoryRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoryRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoryRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoryRecord._(reference, mapFromFirestore(data));

  static CategoryRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      CategoryRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'description': snapshot.data['description'],
          'image': snapshot.data['image'],
          'passions': safeGet(
            () => snapshot.data['passions'].map((s) => toRef(s)).toList(),
          ),
        },
        CategoryRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<CategoryRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'category',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'CategoryRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createCategoryRecordData({
  String? title,
  String? description,
  String? image,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
    }.withoutNulls,
  );

  return firestoreData;
}
