import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RequestRecord extends FirestoreRecord {
  RequestRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "uid1" field.
  DocumentReference? _uid1;
  DocumentReference? get uid1 => _uid1;
  bool hasUid1() => _uid1 != null;

  // "uid2" field.
  DocumentReference? _uid2;
  DocumentReference? get uid2 => _uid2;
  bool hasUid2() => _uid2 != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _uid1 = snapshotData['uid1'] as DocumentReference?;
    _uid2 = snapshotData['uid2'] as DocumentReference?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('request');

  static Stream<RequestRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => RequestRecord.fromSnapshot(s));

  static Future<RequestRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => RequestRecord.fromSnapshot(s));

  static RequestRecord fromSnapshot(DocumentSnapshot snapshot) =>
      RequestRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static RequestRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      RequestRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'RequestRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createRequestRecordData({
  DocumentReference? uid1,
  DocumentReference? uid2,
  DateTime? datetime,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'uid1': uid1,
      'uid2': uid2,
      'datetime': datetime,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}
