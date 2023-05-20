import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TitlesRecord extends FirestoreRecord {
  TitlesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "abbreviation" field.
  String? _abbreviation;
  String get abbreviation => _abbreviation ?? '';
  bool hasAbbreviation() => _abbreviation != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _abbreviation = snapshotData['abbreviation'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('titles');

  static Stream<TitlesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TitlesRecord.fromSnapshot(s));

  static Future<TitlesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TitlesRecord.fromSnapshot(s));

  static TitlesRecord fromSnapshot(DocumentSnapshot snapshot) => TitlesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TitlesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TitlesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TitlesRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createTitlesRecordData({
  String? name,
  String? abbreviation,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'abbreviation': abbreviation,
    }.withoutNulls,
  );

  return firestoreData;
}
