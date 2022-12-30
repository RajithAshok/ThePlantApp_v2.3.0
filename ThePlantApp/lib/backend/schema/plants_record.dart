import 'dart:async';

//import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'plants_record.g.dart';

abstract class PlantsRecord
    implements Built<PlantsRecord, PlantsRecordBuilder> {
  static Serializer<PlantsRecord> get serializer => _$plantsRecordSerializer;

  @BuiltValueField(wireName: 'Name')
  String? get name;

  @BuiltValueField(wireName: 'Image')
  String? get image;

  @BuiltValueField(wireName: 'Desc')
  String? get desc;

  @BuiltValueField(wireName: 'Price')
  int? get price;

  DocumentReference? get catRef;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(PlantsRecordBuilder builder) => builder
    ..name = ''
    ..image = ''
    ..desc = ''
    ..price = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Plants');

  static Stream<PlantsRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<PlantsRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  PlantsRecord._();
  factory PlantsRecord([void Function(PlantsRecordBuilder) updates]) =
      _$PlantsRecord;

  static PlantsRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createPlantsRecordData({
  String? name,
  String? image,
  String? desc,
  int? price,
  DocumentReference? catRef,
}) {
  final firestoreData = serializers.toFirestore(
    PlantsRecord.serializer,
    PlantsRecord(
      (p) => p
        ..name = name
        ..image = image
        ..desc = desc
        ..price = price
        ..catRef = catRef,
    ),
  );

  return firestoreData;
}
