// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'request_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<RequestRecord> _$requestRecordSerializer =
    new _$RequestRecordSerializer();

class _$RequestRecordSerializer implements StructuredSerializer<RequestRecord> {
  @override
  final Iterable<Type> types = const [RequestRecord, _$RequestRecord];
  @override
  final String wireName = 'RequestRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, RequestRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.uid1;
    if (value != null) {
      result
        ..add('uid1')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.uid2;
    if (value != null) {
      result
        ..add('uid2')
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
    value = object.status;
    if (value != null) {
      result
        ..add('status')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
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
  RequestRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new RequestRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'uid1':
          result.uid1 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'uid2':
          result.uid2 = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'datetime':
          result.datetime = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'status':
          result.status = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
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

class _$RequestRecord extends RequestRecord {
  @override
  final DocumentReference<Object?>? uid1;
  @override
  final DocumentReference<Object?>? uid2;
  @override
  final DateTime? datetime;
  @override
  final String? status;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$RequestRecord([void Function(RequestRecordBuilder)? updates]) =>
      (new RequestRecordBuilder()..update(updates))._build();

  _$RequestRecord._(
      {this.uid1, this.uid2, this.datetime, this.status, this.ffRef})
      : super._();

  @override
  RequestRecord rebuild(void Function(RequestRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  RequestRecordBuilder toBuilder() => new RequestRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is RequestRecord &&
        uid1 == other.uid1 &&
        uid2 == other.uid2 &&
        datetime == other.datetime &&
        status == other.status &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc($jc(0, uid1.hashCode), uid2.hashCode), datetime.hashCode),
            status.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'RequestRecord')
          ..add('uid1', uid1)
          ..add('uid2', uid2)
          ..add('datetime', datetime)
          ..add('status', status)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class RequestRecordBuilder
    implements Builder<RequestRecord, RequestRecordBuilder> {
  _$RequestRecord? _$v;

  DocumentReference<Object?>? _uid1;
  DocumentReference<Object?>? get uid1 => _$this._uid1;
  set uid1(DocumentReference<Object?>? uid1) => _$this._uid1 = uid1;

  DocumentReference<Object?>? _uid2;
  DocumentReference<Object?>? get uid2 => _$this._uid2;
  set uid2(DocumentReference<Object?>? uid2) => _$this._uid2 = uid2;

  DateTime? _datetime;
  DateTime? get datetime => _$this._datetime;
  set datetime(DateTime? datetime) => _$this._datetime = datetime;

  String? _status;
  String? get status => _$this._status;
  set status(String? status) => _$this._status = status;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  RequestRecordBuilder() {
    RequestRecord._initializeBuilder(this);
  }

  RequestRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _uid1 = $v.uid1;
      _uid2 = $v.uid2;
      _datetime = $v.datetime;
      _status = $v.status;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(RequestRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$RequestRecord;
  }

  @override
  void update(void Function(RequestRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  RequestRecord build() => _build();

  _$RequestRecord _build() {
    final _$result = _$v ??
        new _$RequestRecord._(
            uid1: uid1,
            uid2: uid2,
            datetime: datetime,
            status: status,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
