import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MessageRecord extends FirestoreRecord {
  MessageRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "chat" field.
  DocumentReference? _chat;
  DocumentReference? get chat => _chat;
  bool hasChat() => _chat != null;

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "datetime" field.
  DateTime? _datetime;
  DateTime? get datetime => _datetime;
  bool hasDatetime() => _datetime != null;

  // "message" field.
  String? _message;
  String get message => _message ?? '';
  bool hasMessage() => _message != null;

  // "seen" field.
  bool? _seen;
  bool get seen => _seen ?? false;
  bool hasSeen() => _seen != null;

  void _initializeFields() {
    _chat = snapshotData['chat'] as DocumentReference?;
    _sender = snapshotData['sender'] as DocumentReference?;
    _datetime = snapshotData['datetime'] as DateTime?;
    _message = snapshotData['message'] as String?;
    _seen = snapshotData['seen'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MessageRecord.fromSnapshot(s));

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MessageRecord.fromSnapshot(s));

  static MessageRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MessageRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MessageRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MessageRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MessageRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? chat,
  DocumentReference? sender,
  DateTime? datetime,
  String? message,
  bool? seen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'chat': chat,
      'sender': sender,
      'datetime': datetime,
      'message': message,
      'seen': seen,
    }.withoutNulls,
  );

  return firestoreData;
}
