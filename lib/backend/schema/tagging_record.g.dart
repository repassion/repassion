// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tagging_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TaggingRecord> _$taggingRecordSerializer =
    new _$TaggingRecordSerializer();

class _$TaggingRecordSerializer implements StructuredSerializer<TaggingRecord> {
  @override
  final Iterable<Type> types = const [TaggingRecord, _$TaggingRecord];
  @override
  final String wireName = 'TaggingRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TaggingRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.user;
    if (value != null) {
      result
        ..add('user')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.tag;
    if (value != null) {
      result
        ..add('tag')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
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
  TaggingRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TaggingRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'user':
          result.user = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'tag':
          result.tag = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
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

class _$TaggingRecord extends TaggingRecord {
  @override
  final DocumentReference<Object?>? user;
  @override
  final DocumentReference<Object?>? tag;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TaggingRecord([void Function(TaggingRecordBuilder)? updates]) =>
      (new TaggingRecordBuilder()..update(updates))._build();

  _$TaggingRecord._({this.user, this.tag, this.ffRef}) : super._();

  @override
  TaggingRecord rebuild(void Function(TaggingRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TaggingRecordBuilder toBuilder() => new TaggingRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TaggingRecord &&
        user == other.user &&
        tag == other.tag &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc(0, user.hashCode), tag.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TaggingRecord')
          ..add('user', user)
          ..add('tag', tag)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TaggingRecordBuilder
    implements Builder<TaggingRecord, TaggingRecordBuilder> {
  _$TaggingRecord? _$v;

  DocumentReference<Object?>? _user;
  DocumentReference<Object?>? get user => _$this._user;
  set user(DocumentReference<Object?>? user) => _$this._user = user;

  DocumentReference<Object?>? _tag;
  DocumentReference<Object?>? get tag => _$this._tag;
  set tag(DocumentReference<Object?>? tag) => _$this._tag = tag;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TaggingRecordBuilder() {
    TaggingRecord._initializeBuilder(this);
  }

  TaggingRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _user = $v.user;
      _tag = $v.tag;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TaggingRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TaggingRecord;
  }

  @override
  void update(void Function(TaggingRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TaggingRecord build() => _build();

  _$TaggingRecord _build() {
    final _$result =
        _$v ?? new _$TaggingRecord._(user: user, tag: tag, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
