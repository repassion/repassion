// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<MessageRecord> _$messageRecordSerializer =
    new _$MessageRecordSerializer();

class _$MessageRecordSerializer implements StructuredSerializer<MessageRecord> {
  @override
  final Iterable<Type> types = const [MessageRecord, _$MessageRecord];
  @override
  final String wireName = 'MessageRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, MessageRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.chat;
    if (value != null) {
      result
        ..add('chat')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.datetime;
    if (value != null) {
      result
        ..add('datetime')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.message;
    if (value != null) {
      result
        ..add('message')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.seen;
    if (value != null) {
      result
        ..add('seen')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.ffRef;
    if (value != null) {
      result
        ..add('Document__Reference__Field')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    return result;
  }

  @override
  MessageRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new MessageRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'chat':
          result.chat = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'message':
          result.message = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'seen':
          result.seen = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'Document__Reference__Field':
          result.ffRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
      }
    }

    return result.build();
  }
}

class _$MessageRecord extends MessageRecord {
  @override
  final DocumentReference<Object?>? chat;
  @override
  final DocumentReference<Object?>? sender;
  @override
  final DateTime? datetime;
  @override
  final String? message;
  @override
  final bool? seen;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$MessageRecord([void Function(MessageRecordBuilder)? updates]) =>
      (new MessageRecordBuilder()..update(updates))._build();

  _$MessageRecord._(
      {this.chat,
      this.sender,
      this.datetime,
      this.message,
      this.seen,
      this.ffRef})
      : super._();

  @override
  MessageRecord rebuild(void Function(MessageRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  MessageRecordBuilder toBuilder() => new MessageRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MessageRecord &&
        chat == other.chat &&
        sender == other.sender &&
        datetime == other.datetime &&
        message == other.message &&
        seen == other.seen &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, chat.hashCode), sender.hashCode),
                    datetime.hashCode),
                message.hashCode),
            seen.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'MessageRecord')
          ..add('chat', chat)
          ..add('sender', sender)
          ..add('datetime', datetime)
          ..add('message', message)
          ..add('seen', seen)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class MessageRecordBuilder
    implements Builder<MessageRecord, MessageRecordBuilder> {
  _$MessageRecord? _$v;

  DocumentReference<Object?>? _chat;
  DocumentReference<Object?>? get chat => _$this._chat;
  set chat(DocumentReference<Object?>? chat) => _$this._chat = chat;

  DocumentReference<Object?>? _sender;
  DocumentReference<Object?>? get sender => _$this._sender;
  set sender(DocumentReference<Object?>? sender) => _$this._sender = sender;

  DateTime? _datetime;
  DateTime? get datetime => _$this._datetime;
  set datetime(DateTime? datetime) => _$this._datetime = datetime;

  String? _message;
  String? get message => _$this._message;
  set message(String? message) => _$this._message = message;

  bool? _seen;
  bool? get seen => _$this._seen;
  set seen(bool? seen) => _$this._seen = seen;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  MessageRecordBuilder() {
    MessageRecord._initializeBuilder(this);
  }

  MessageRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _chat = $v.chat;
      _sender = $v.sender;
      _datetime = $v.datetime;
      _message = $v.message;
      _seen = $v.seen;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(MessageRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$MessageRecord;
  }

  @override
  void update(void Function(MessageRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  MessageRecord build() => _build();

  _$MessageRecord _build() {
    final _$result = _$v ??
        new _$MessageRecord._(
            chat: chat,
            sender: sender,
            datetime: datetime,
            message: message,
            seen: seen,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
