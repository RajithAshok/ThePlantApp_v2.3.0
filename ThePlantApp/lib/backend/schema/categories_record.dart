import 'dart:async';

//import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'categories_record.g.dart';

abstract class CategoriesRecord
    implements Built<CategoriesRecord, CategoriesRecordBuilder> {
  static Serializer<CategoriesRecord> get serializer =>
      _$categoriesRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  @BuiltValueField(wireName: 'Image')
  String? get image;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(CategoriesRecordBuilder builder) => builder
    ..name = ''
    ..image = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  CategoriesRecord._();
  factory CategoriesRecord([void Function(CategoriesRecordBuilder) updates]) =
      _$CategoriesRecord;

  static CategoriesRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  String? image,
}) {
  final firestoreData = serializers.toFirestore(
    CategoriesRecord.serializer,
    CategoriesRecord(
      (c) => c
        ..name = name
        ..image = image,
    ),
  );

  return firestoreData;
}
