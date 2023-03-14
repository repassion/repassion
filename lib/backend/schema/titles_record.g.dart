// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'titles_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TitlesRecord> _$titlesRecordSerializer =
    new _$TitlesRecordSerializer();

class _$TitlesRecordSerializer implements StructuredSerializer<TitlesRecord> {
  @override
  final Iterable<Type> types = const [TitlesRecord, _$TitlesRecord];
  @override
  final String wireName = 'TitlesRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TitlesRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.abbreviation;
    if (value != null) {
      result
        ..add('abbreviation')
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
  TitlesRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TitlesRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'abbreviation':
          result.abbreviation = serializers.deserialize(value,
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

class _$TitlesRecord extends TitlesRecord {
  @override
  final String? name;
  @override
  final String? abbreviation;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TitlesRecord([void Function(TitlesRecordBuilder)? updates]) =>
      (new TitlesRecordBuilder()..update(updates))._build();

  _$TitlesRecord._({this.name, this.abbreviation, this.ffRef}) : super._();

  @override
  TitlesRecord rebuild(void Function(TitlesRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TitlesRecordBuilder toBuilder() => new TitlesRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TitlesRecord &&
        name == other.name &&
        abbreviation == other.abbreviation &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, name.hashCode), abbreviation.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TitlesRecord')
          ..add('name', name)
          ..add('abbreviation', abbreviation)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TitlesRecordBuilder
    implements Builder<TitlesRecord, TitlesRecordBuilder> {
  _$TitlesRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _abbreviation;
  String? get abbreviation => _$this._abbreviation;
  set abbreviation(String? abbreviation) => _$this._abbreviation = abbreviation;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TitlesRecordBuilder() {
    TitlesRecord._initializeBuilder(this);
  }

  TitlesRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _abbreviation = $v.abbreviation;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TitlesRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TitlesRecord;
  }

  @override
  void update(void Function(TitlesRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TitlesRecord build() => _build();

  _$TitlesRecord _build() {
    final _$result = _$v ??
        new _$TitlesRecord._(
            name: name, abbreviation: abbreviation, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
