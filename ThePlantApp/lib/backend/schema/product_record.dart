import 'dart:async';

//import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_record.g.dart';

abstract class ProductRecord
    implements Built<ProductRecord, ProductRecordBuilder> {
  static Serializer<ProductRecord> get serializer => _$productRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  DocumentReference? get plantRef;

  @BuiltValueField(wireName: 'Image')
  String? get image;

  @BuiltValueField(wireName: 'Desc')
  String? get desc;

  @BuiltValueField(wireName: 'Price')
  int? get price;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..desc = ''
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Product');

  static Stream<ProductRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductRecord._();
  factory ProductRecord([void Function(ProductRecordBuilder) updates]) =
      _$ProductRecord;

  static ProductRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductRecordData({
  String? name,
  DocumentReference? plantRef,
  String? image,
  String? desc,
  int? price,
}) {
  final firestoreData = serializers.toFirestore(
    ProductRecord.serializer,
    ProductRecord(
      (p) => p
        ..name = name
        ..plantRef = plantRef
        ..image = image
        ..desc = desc
        ..price = price,
    ),
  );

  return firestoreData;
}
