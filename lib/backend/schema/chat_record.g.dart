// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ChatRecord> _$chatRecordSerializer = new _$ChatRecordSerializer();

class _$ChatRecordSerializer implements StructuredSerializer<ChatRecord> {
  @override
  final Iterable<Type> types = const [ChatRecord, _$ChatRecord];
  @override
  final String wireName = 'ChatRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ChatRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.sender;
    if (value != null) {
      result
        ..add('sender')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.receiver;
    if (value != null) {
      result
        ..add('receiver')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.lastActivity;
    if (value != null) {
      result
        ..add('last_activity')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.orderDate;
    if (value != null) {
      result
        ..add('order_date')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.notifications;
    if (value != null) {
      result
        ..add('notifications')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
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
  ChatRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ChatRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'sender':
          result.sender = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'receiver':
          result.receiver = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'last_activity':
          result.lastActivity = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'order_date':
          result.orderDate = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'notifications':
          result.notifications = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
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

class _$ChatRecord extends ChatRecord {
  @override
  final DocumentReference<Object?>? sender;
  @override
  final DocumentReference<Object?>? receiver;
  @override
  final String? lastActivity;
  @override
  final DateTime? orderDate;
  @override
  final int? notifications;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ChatRecord([void Function(ChatRecordBuilder)? updates]) =>
      (new ChatRecordBuilder()..update(updates))._build();

  _$ChatRecord._(
      {this.sender,
      this.receiver,
      this.lastActivity,
      this.orderDate,
      this.notifications,
      this.ffRef})
      : super._();

  @override
  ChatRecord rebuild(void Function(ChatRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ChatRecordBuilder toBuilder() => new ChatRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ChatRecord &&
        sender == other.sender &&
        receiver == other.receiver &&
        lastActivity == other.lastActivity &&
        orderDate == other.orderDate &&
        notifications == other.notifications &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, sender.hashCode), receiver.hashCode),
                    lastActivity.hashCode),
                orderDate.hashCode),
            notifications.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ChatRecord')
          ..add('sender', sender)
          ..add('receiver', receiver)
          ..add('lastActivity', lastActivity)
          ..add('orderDate', orderDate)
          ..add('notifications', notifications)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ChatRecordBuilder implements Builder<ChatRecord, ChatRecordBuilder> {
  _$ChatRecord? _$v;

  DocumentReference<Object?>? _sender;
  DocumentReference<Object?>? get sender => _$this._sender;
  set sender(DocumentReference<Object?>? sender) => _$this._sender = sender;

  DocumentReference<Object?>? _receiver;
  DocumentReference<Object?>? get receiver => _$this._receiver;
  set receiver(DocumentReference<Object?>? receiver) =>
      _$this._receiver = receiver;

  String? _lastActivity;
  String? get lastActivity => _$this._lastActivity;
  set lastActivity(String? lastActivity) => _$this._lastActivity = lastActivity;

  DateTime? _orderDate;
  DateTime? get orderDate => _$this._orderDate;
  set orderDate(DateTime? orderDate) => _$this._orderDate = orderDate;

  int? _notifications;
  int? get notifications => _$this._notifications;
  set notifications(int? notifications) =>
      _$this._notifications = notifications;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ChatRecordBuilder() {
    ChatRecord._initializeBuilder(this);
  }

  ChatRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _sender = $v.sender;
      _receiver = $v.receiver;
      _lastActivity = $v.lastActivity;
      _orderDate = $v.orderDate;
      _notifications = $v.notifications;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ChatRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ChatRecord;
  }

  @override
  void update(void Function(ChatRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ChatRecord build() => _build();

  _$ChatRecord _build() {
    final _$result = _$v ??
        new _$ChatRecord._(
            sender: sender,
            receiver: receiver,
            lastActivity: lastActivity,
            orderDate: orderDate,
            notifications: notifications,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
