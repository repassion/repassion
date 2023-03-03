import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'chat_record.g.dart';

abstract class ChatRecord implements Built<ChatRecord, ChatRecordBuilder> {
  static Serializer<ChatRecord> get serializer => _$chatRecordSerializer;

  DocumentReference? get sender;

  DocumentReference? get receiver;

  @BuiltValueField(wireName: 'last_activity')
  String? get lastActivity;

  @BuiltValueField(wireName: 'order_date')
  DateTime? get orderDate;

  int? get notifications;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ChatRecordBuilder builder) => builder
    ..lastActivity = ''
    ..notifications = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('chat');

  static Stream<ChatRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ChatRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ChatRecord._();
  factory ChatRecord([void Function(ChatRecordBuilder) updates]) = _$ChatRecord;

  static ChatRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createChatRecordData({
  DocumentReference? sender,
  DocumentReference? receiver,
  String? lastActivity,
  DateTime? orderDate,
  int? notifications,
}) {
  final firestoreData = serializers.toFirestore(
    ChatRecord.serializer,
    ChatRecord(
      (c) => c
        ..sender = sender
        ..receiver = receiver
        ..lastActivity = lastActivity
        ..orderDate = orderDate
        ..notifications = notifications,
    ),
  );

  return firestoreData;
}
