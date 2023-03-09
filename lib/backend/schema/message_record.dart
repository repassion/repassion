import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'message_record.g.dart';

abstract class MessageRecord
    implements Built<MessageRecord, MessageRecordBuilder> {
  static Serializer<MessageRecord> get serializer => _$messageRecordSerializer;

  DocumentReference? get chat;

  DocumentReference? get sender;

  DateTime? get datetime;

  String? get message;

  bool? get seen;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(MessageRecordBuilder builder) => builder
    ..message = ''
    ..seen = false;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('message');

  static Stream<MessageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<MessageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  MessageRecord._();
  factory MessageRecord([void Function(MessageRecordBuilder) updates]) =
      _$MessageRecord;

  static MessageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createMessageRecordData({
  DocumentReference? chat,
  DocumentReference? sender,
  DateTime? datetime,
  String? message,
  bool? seen,
}) {
  final firestoreData = serializers.toFirestore(
    MessageRecord.serializer,
    MessageRecord(
      (m) => m
        ..chat = chat
        ..sender = sender
        ..datetime = datetime
        ..message = message
        ..seen = seen,
    ),
  );

  return firestoreData;
}
