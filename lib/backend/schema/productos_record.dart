import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'productos_record.g.dart';

abstract class ProductosRecord
    implements Built<ProductosRecord, ProductosRecordBuilder> {
  static Serializer<ProductosRecord> get serializer =>
      _$productosRecordSerializer;

  String? get nombre;

  double? get precio;

  int? get cantidad;

  String? get foto;

  DocumentReference? get categoria;

  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference? get ffRef;
  DocumentReference get reference => ffRef!;

  static void _initializeBuilder(ProductosRecordBuilder builder) => builder
    ..nombre = ''
    ..precio = 0.0
    ..cantidad = 0
    ..foto = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Productos');

  static Stream<ProductosRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  static Future<ProductosRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s))!);

  ProductosRecord._();
  factory ProductosRecord([void Function(ProductosRecordBuilder) updates]) =
      _$ProductosRecord;

  static ProductosRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference})!;
}

Map<String, dynamic> createProductosRecordData({
  String? nombre,
  double? precio,
  int? cantidad,
  String? foto,
  DocumentReference? categoria,
}) {
  final firestoreData = serializers.toFirestore(
    ProductosRecord.serializer,
    ProductosRecord(
      (p) => p
        ..nombre = nombre
        ..precio = precio
        ..cantidad = cantidad
        ..foto = foto
        ..categoria = categoria,
    ),
  );

  return firestoreData;
}
