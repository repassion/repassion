import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/algolia_manager.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PassionRecord extends FirestoreRecord {
  PassionRecord._(
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

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  bool hasVideo() => _video != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  // "likes" field.
  int? _likes;
  int get likes => _likes ?? 0;
  bool hasLikes() => _likes != null;

  // "author" field.
  DocumentReference? _author;
  DocumentReference? get author => _author;
  bool hasAuthor() => _author != null;

  // "edited" field.
  DateTime? _edited;
  DateTime? get edited => _edited;
  bool hasEdited() => _edited != null;

  // "verified" field.
  bool? _verified;
  bool get verified => _verified ?? false;
  bool hasVerified() => _verified != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "none" field.
  bool? _none;
  bool get none => _none ?? false;
  bool hasNone() => _none != null;

  // "public" field.
  bool? _public;
  bool get public => _public ?? false;
  bool hasPublic() => _public != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _video = snapshotData['video'] as String?;
    _text = snapshotData['text'] as String?;
    _likes = snapshotData['likes'] as int?;
    _author = snapshotData['author'] as DocumentReference?;
    _edited = snapshotData['edited'] as DateTime?;
    _verified = snapshotData['verified'] as bool?;
    _type = snapshotData['type'] as String?;
    _none = snapshotData['none'] as bool?;
    _public = snapshotData['public'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('passion');

  static Stream<PassionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PassionRecord.fromSnapshot(s));

  static Future<PassionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PassionRecord.fromSnapshot(s));

  static PassionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PassionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PassionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PassionRecord._(reference, mapFromFirestore(data));

  static PassionRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      PassionRecord.getDocumentFromData(
        {
          'title': snapshot.data['title'],
          'description': snapshot.data['description'],
          'image': snapshot.data['image'],
          'video': snapshot.data['video'],
          'text': snapshot.data['text'],
          'likes': snapshot.data['likes']?.round(),
          'author': safeGet(
            () => toRef(snapshot.data['author']),
          ),
          'edited': safeGet(
            () => DateTime.fromMillisecondsSinceEpoch(snapshot.data['edited']),
          ),
          'verified': snapshot.data['verified'],
          'type': snapshot.data['type'],
          'none': snapshot.data['none'],
          'public': snapshot.data['public'],
        },
        PassionRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<PassionRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'passion',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'PassionRecord(reference: ${reference.path}, data: $snapshotData)';
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
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'description': description,
      'image': image,
      'video': video,
      'text': text,
      'likes': likes,
      'author': author,
      'edited': edited,
      'verified': verified,
      'type': type,
      'none': none,
      'public': public,
    }.withoutNulls,
  );

  return firestoreData;
}
