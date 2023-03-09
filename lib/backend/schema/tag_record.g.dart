// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tag_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TagRecord> _$tagRecordSerializer = new _$TagRecordSerializer();

class _$TagRecordSerializer implements StructuredSerializer<TagRecord> {
  @override
  final Iterable<Type> types = const [TagRecord, _$TagRecord];
  @override
  final String wireName = 'TagRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, TagRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.colour;
    if (value != null) {
      result
        ..add('colour')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(Color)));
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
  TagRecord deserialize(Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TagRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'colour':
          result.colour = serializers.deserialize(value,
              specifiedType: const FullType(Color)) as Color?;
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

class _$TagRecord extends TagRecord {
  @override
  final String? text;
  @override
  final Color? colour;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$TagRecord([void Function(TagRecordBuilder)? updates]) =>
      (new TagRecordBuilder()..update(updates))._build();

  _$TagRecord._({this.text, this.colour, this.ffRef}) : super._();

  @override
  TagRecord rebuild(void Function(TagRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TagRecordBuilder toBuilder() => new TagRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TagRecord &&
        text == other.text &&
        colour == other.colour &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf(
        $jc($jc($jc(0, text.hashCode), colour.hashCode), ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'TagRecord')
          ..add('text', text)
          ..add('colour', colour)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class TagRecordBuilder implements Builder<TagRecord, TagRecordBuilder> {
  _$TagRecord? _$v;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  Color? _colour;
  Color? get colour => _$this._colour;
  set colour(Color? colour) => _$this._colour = colour;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  TagRecordBuilder() {
    TagRecord._initializeBuilder(this);
  }

  TagRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _text = $v.text;
      _colour = $v.colour;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TagRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TagRecord;
  }

  @override
  void update(void Function(TagRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  TagRecord build() => _build();

  _$TagRecord _build() {
    final _$result =
        _$v ?? new _$TagRecord._(text: text, colour: colour, ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
