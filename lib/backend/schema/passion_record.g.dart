// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'passion_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<PassionRecord> _$passionRecordSerializer =
    new _$PassionRecordSerializer();

class _$PassionRecordSerializer implements StructuredSerializer<PassionRecord> {
  @override
  final Iterable<Type> types = const [PassionRecord, _$PassionRecord];
  @override
  final String wireName = 'PassionRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, PassionRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.title;
    if (value != null) {
      result
        ..add('title')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.description;
    if (value != null) {
      result
        ..add('description')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.video;
    if (value != null) {
      result
        ..add('video')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.text;
    if (value != null) {
      result
        ..add('text')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.likes;
    if (value != null) {
      result
        ..add('likes')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.author;
    if (value != null) {
      result
        ..add('author')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.edited;
    if (value != null) {
      result
        ..add('edited')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(DateTime)));
    }
    value = object.verified;
    if (value != null) {
      result
        ..add('verified')
        ..add(
            serializers.serialize(value, specifiedType: const FullType(bool)));
    }
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.none;
    if (value != null) {
      result
        ..add('none')
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
  PassionRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new PassionRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'title':
          result.title = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'description':
          result.description = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'video':
          result.video = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'text':
          result.text = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'likes':
          result.likes = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'author':
          result.author = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'edited':
          result.edited = serializers.deserialize(value,
              specifiedType: const FullType(DateTime)) as DateTime?;
          break;
        case 'verified':
          result.verified = serializers.deserialize(value,
              specifiedType: const FullType(bool)) as bool?;
          break;
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'none':
          result.none = serializers.deserialize(value,
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

class _$PassionRecord extends PassionRecord {
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final String? video;
  @override
  final String? text;
  @override
  final int? likes;
  @override
  final DocumentReference<Object?>? author;
  @override
  final DateTime? edited;
  @override
  final bool? verified;
  @override
  final String? type;
  @override
  final bool? none;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$PassionRecord([void Function(PassionRecordBuilder)? updates]) =>
      (new PassionRecordBuilder()..update(updates))._build();

  _$PassionRecord._(
      {this.title,
      this.description,
      this.image,
      this.video,
      this.text,
      this.likes,
      this.author,
      this.edited,
      this.verified,
      this.type,
      this.none,
      this.ffRef})
      : super._();

  @override
  PassionRecord rebuild(void Function(PassionRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  PassionRecordBuilder toBuilder() => new PassionRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is PassionRecord &&
        title == other.title &&
        description == other.description &&
        image == other.image &&
        video == other.video &&
        text == other.text &&
        likes == other.likes &&
        author == other.author &&
        edited == other.edited &&
        verified == other.verified &&
        type == other.type &&
        none == other.none &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc(
                                        $jc(
                                            $jc($jc(0, title.hashCode),
                                                description.hashCode),
                                            image.hashCode),
                                        video.hashCode),
                                    text.hashCode),
                                likes.hashCode),
                            author.hashCode),
                        edited.hashCode),
                    verified.hashCode),
                type.hashCode),
            none.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'PassionRecord')
          ..add('title', title)
          ..add('description', description)
          ..add('image', image)
          ..add('video', video)
          ..add('text', text)
          ..add('likes', likes)
          ..add('author', author)
          ..add('edited', edited)
          ..add('verified', verified)
          ..add('type', type)
          ..add('none', none)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class PassionRecordBuilder
    implements Builder<PassionRecord, PassionRecordBuilder> {
  _$PassionRecord? _$v;

  String? _title;
  String? get title => _$this._title;
  set title(String? title) => _$this._title = title;

  String? _description;
  String? get description => _$this._description;
  set description(String? description) => _$this._description = description;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _video;
  String? get video => _$this._video;
  set video(String? video) => _$this._video = video;

  String? _text;
  String? get text => _$this._text;
  set text(String? text) => _$this._text = text;

  int? _likes;
  int? get likes => _$this._likes;
  set likes(int? likes) => _$this._likes = likes;

  DocumentReference<Object?>? _author;
  DocumentReference<Object?>? get author => _$this._author;
  set author(DocumentReference<Object?>? author) => _$this._author = author;

  DateTime? _edited;
  DateTime? get edited => _$this._edited;
  set edited(DateTime? edited) => _$this._edited = edited;

  bool? _verified;
  bool? get verified => _$this._verified;
  set verified(bool? verified) => _$this._verified = verified;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  bool? _none;
  bool? get none => _$this._none;
  set none(bool? none) => _$this._none = none;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  PassionRecordBuilder() {
    PassionRecord._initializeBuilder(this);
  }

  PassionRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _title = $v.title;
      _description = $v.description;
      _image = $v.image;
      _video = $v.video;
      _text = $v.text;
      _likes = $v.likes;
      _author = $v.author;
      _edited = $v.edited;
      _verified = $v.verified;
      _type = $v.type;
      _none = $v.none;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(PassionRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$PassionRecord;
  }

  @override
  void update(void Function(PassionRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  PassionRecord build() => _build();

  _$PassionRecord _build() {
    final _$result = _$v ??
        new _$PassionRecord._(
            title: title,
            description: description,
            image: image,
            video: video,
            text: text,
            likes: likes,
            author: author,
            edited: edited,
            verified: verified,
            type: type,
            none: none,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
