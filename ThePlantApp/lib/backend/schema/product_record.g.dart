// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_record.dart';

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<ProductRecord> _$productRecordSerializer =
    new _$ProductRecordSerializer();

class _$ProductRecordSerializer implements StructuredSerializer<ProductRecord> {
  @override
  final Iterable<Type> types = const [ProductRecord, _$ProductRecord];
  @override
  final String wireName = 'ProductRecord';

  @override
  Iterable<Object?> serialize(Serializers serializers, ProductRecord object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.name;
    if (value != null) {
      result
        ..add('Name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.plantRef;
    if (value != null) {
      result
        ..add('plantRef')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                DocumentReference, const [const FullType.nullable(Object)])));
    }
    value = object.image;
    if (value != null) {
      result
        ..add('Image')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('Desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.price;
    if (value != null) {
      result
        ..add('Price')
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
  ProductRecord deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new ProductRecordBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current! as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'Name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'plantRef':
          result.plantRef = serializers.deserialize(value,
              specifiedType: const FullType(DocumentReference, const [
                const FullType.nullable(Object)
              ])) as DocumentReference<Object?>?;
          break;
        case 'Image':
          result.image = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'Price':
          result.price = serializers.deserialize(value,
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

class _$ProductRecord extends ProductRecord {
  @override
  final String? name;
  @override
  final DocumentReference<Object?>? plantRef;
  @override
  final String? image;
  @override
  final String? desc;
  @override
  final int? price;
  @override
  final DocumentReference<Object?>? ffRef;

  factory _$ProductRecord([void Function(ProductRecordBuilder)? updates]) =>
      (new ProductRecordBuilder()..update(updates))._build();

  _$ProductRecord._(
      {this.name, this.plantRef, this.image, this.desc, this.price, this.ffRef})
      : super._();

  @override
  ProductRecord rebuild(void Function(ProductRecordBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  ProductRecordBuilder toBuilder() => new ProductRecordBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ProductRecord &&
        name == other.name &&
        plantRef == other.plantRef &&
        image == other.image &&
        desc == other.desc &&
        price == other.price &&
        ffRef == other.ffRef;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc($jc($jc(0, name.hashCode), plantRef.hashCode),
                    image.hashCode),
                desc.hashCode),
            price.hashCode),
        ffRef.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper(r'ProductRecord')
          ..add('name', name)
          ..add('plantRef', plantRef)
          ..add('image', image)
          ..add('desc', desc)
          ..add('price', price)
          ..add('ffRef', ffRef))
        .toString();
  }
}

class ProductRecordBuilder
    implements Builder<ProductRecord, ProductRecordBuilder> {
  _$ProductRecord? _$v;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  DocumentReference<Object?>? _plantRef;
  DocumentReference<Object?>? get plantRef => _$this._plantRef;
  set plantRef(DocumentReference<Object?>? plantRef) =>
      _$this._plantRef = plantRef;

  String? _image;
  String? get image => _$this._image;
  set image(String? image) => _$this._image = image;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  int? _price;
  int? get price => _$this._price;
  set price(int? price) => _$this._price = price;

  DocumentReference<Object?>? _ffRef;
  DocumentReference<Object?>? get ffRef => _$this._ffRef;
  set ffRef(DocumentReference<Object?>? ffRef) => _$this._ffRef = ffRef;

  ProductRecordBuilder() {
    ProductRecord._initializeBuilder(this);
  }

  ProductRecordBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _name = $v.name;
      _plantRef = $v.plantRef;
      _image = $v.image;
      _desc = $v.desc;
      _price = $v.price;
      _ffRef = $v.ffRef;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(ProductRecord other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$ProductRecord;
  }

  @override
  void update(void Function(ProductRecordBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  ProductRecord build() => _build();

  _$ProductRecord _build() {
    final _$result = _$v ??
        new _$ProductRecord._(
            name: name,
            plantRef: plantRef,
            image: image,
            desc: desc,
            price: price,
            ffRef: ffRef);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,no_leading_underscores_for_local_identifiers,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new,unnecessary_lambdas
