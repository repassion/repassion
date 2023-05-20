import 'dart:async';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ChatRecord extends FirestoreRecord {
  ChatRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "sender" field.
  DocumentReference? _sender;
  DocumentReference? get sender => _sender;
  bool hasSender() => _sender != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "last_activity" field.
  String? _lastActivity;
  String get lastActivity => _lastActivity ?? '';
  bool hasLastActivity() => _lastActivity != null;

  // "order_date" field.
  DateTime? _orderDate;
  DateTime? get orderDate => _orderDate;
  bool hasOrderDate() => _orderDate != null;

  // "notifications" field.
  int? _notifications;
  int get notifications => _notifications ?? 0;
  bool hasNotifications() => _notifications != null;

  void _initializeFields() {
    _sender = snapshotData['sender'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _lastActivity = snapshotData['last_activity'] as String?;
    _orderDate = snapshotData['order_date'] as DateTime?;
    _notifications = snapshotData['notifications'] as int?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ChatRecord.fromSnapshot(s));

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ChatRecord.fromSnapshot(s));

  static ChatRecord fromSnapshot(DocumentSnapshot snapshot) => ChatRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ChatRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ChatRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ChatRecord(reference: ${reference.path}, data: $snapshotData)';
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  String? lastActivity,
  DateTime? orderDate,
  int? notifications,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'sender': sender,
      'receiver': receiver,
      'last_activity': lastActivity,
      'order_date': orderDate,
      'notifications': notifications,
    }.withoutNulls,
  );

  return firestoreData;
}
