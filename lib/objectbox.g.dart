// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'app/model/product_model.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 2038652428357253319),
      name: 'Product',
      lastPropertyId: const IdUid(20, 3367550042807965969),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 164920824180743285),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 4677034713847739221),
            name: 'productId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 1567208003542915021),
            name: 'ean',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 6105330724265116599),
            name: 'name',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1505543811306565457),
            name: 'description',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3081227081226197890),
            name: 'siteSelected',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3880411643533312047),
            name: 'active',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 388422781776437987),
            name: 'status',
            type: 1,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4379723894877588699),
            name: 'siteId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 5995995036652280368),
            name: 'picking',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(11, 38504668873652823),
            name: 'sku',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(12, 5684142023987239884),
            name: 'skuWithDetail',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(13, 1481874661670080585),
            name: 'imagesUrl',
            type: 30,
            flags: 0),
        ModelProperty(
            id: const IdUid(14, 7504376494157381935),
            name: 'makerId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(15, 8504346657728166299),
            name: 'maker',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(16, 2211442239002566408),
            name: 'brandId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(17, 1052304276964951315),
            name: 'brand',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(18, 4955296733903528921),
            name: 'brandImage',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(19, 5977330996276310855),
            name: 'quantity',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(20, 3367550042807965969),
            name: 'rating',
            type: 8,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 2038652428357253319),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    Product: EntityDefinition<Product>(
        model: _entities[0],
        toOneRelations: (Product object) => [],
        toManyRelations: (Product object) => {},
        getId: (Product object) => object.id,
        setId: (Product object, int id) {
          object.id = id;
        },
        objectToFB: (Product object, fb.Builder fbb) {
          final eanOffset =
              object.ean == null ? null : fbb.writeString(object.ean!);
          final nameOffset =
              object.name == null ? null : fbb.writeString(object.name!);
          final descriptionOffset = object.description == null
              ? null
              : fbb.writeString(object.description!);
          final siteSelectedOffset = object.siteSelected == null
              ? null
              : fbb.writeString(object.siteSelected!);
          final pickingOffset =
              object.picking == null ? null : fbb.writeString(object.picking!);
          final skuOffset =
              object.sku == null ? null : fbb.writeString(object.sku!);
          final skuWithDetailOffset = object.skuWithDetail == null
              ? null
              : fbb.writeString(object.skuWithDetail!);
          final imagesUrlOffset = object.imagesUrl == null
              ? null
              : fbb.writeList(object.imagesUrl!
                  .map(fbb.writeString)
                  .toList(growable: false));
          final makerOffset =
              object.maker == null ? null : fbb.writeString(object.maker!);
          final brandOffset =
              object.brand == null ? null : fbb.writeString(object.brand!);
          final brandImageOffset = object.brandImage == null
              ? null
              : fbb.writeString(object.brandImage!);
          fbb.startTable(21);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.productId);
          fbb.addOffset(2, eanOffset);
          fbb.addOffset(3, nameOffset);
          fbb.addOffset(4, descriptionOffset);
          fbb.addOffset(5, siteSelectedOffset);
          fbb.addBool(6, object.active);
          fbb.addBool(7, object.status);
          fbb.addInt64(8, object.siteId);
          fbb.addOffset(9, pickingOffset);
          fbb.addOffset(10, skuOffset);
          fbb.addOffset(11, skuWithDetailOffset);
          fbb.addOffset(12, imagesUrlOffset);
          fbb.addInt64(13, object.makerId);
          fbb.addOffset(14, makerOffset);
          fbb.addInt64(15, object.brandId);
          fbb.addOffset(16, brandOffset);
          fbb.addOffset(17, brandImageOffset);
          fbb.addInt64(18, object.quantity);
          fbb.addFloat64(19, object.rating);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = Product(
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              productId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 6),
              ean: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 8),
              name: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 10),
              description: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 12),
              siteSelected: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 14),
              active: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 16),
              status: const fb.BoolReader()
                  .vTableGetNullable(buffer, rootOffset, 18),
              siteId: const fb.Int64Reader()
                  .vTableGetNullable(buffer, rootOffset, 20),
              picking: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 22),
              sku: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 24),
              skuWithDetail: const fb.StringReader()
                  .vTableGetNullable(buffer, rootOffset, 26),
              imagesUrl:
                  const fb.ListReader<String>(fb.StringReader(), lazy: false).vTableGetNullable(buffer, rootOffset, 28),
              makerId: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 30),
              maker: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 32),
              brandId: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 34),
              brand: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 36),
              brandImage: const fb.StringReader().vTableGetNullable(buffer, rootOffset, 38),
              quantity: const fb.Int64Reader().vTableGetNullable(buffer, rootOffset, 40),
              rating: const fb.Float64Reader().vTableGetNullable(buffer, rootOffset, 42));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [Product] entity fields to define ObjectBox queries.
class Product_ {
  /// see [Product.id]
  static final id = QueryIntegerProperty<Product>(_entities[0].properties[0]);

  /// see [Product.productId]
  static final productId =
      QueryIntegerProperty<Product>(_entities[0].properties[1]);

  /// see [Product.ean]
  static final ean = QueryStringProperty<Product>(_entities[0].properties[2]);

  /// see [Product.name]
  static final name = QueryStringProperty<Product>(_entities[0].properties[3]);

  /// see [Product.description]
  static final description =
      QueryStringProperty<Product>(_entities[0].properties[4]);

  /// see [Product.siteSelected]
  static final siteSelected =
      QueryStringProperty<Product>(_entities[0].properties[5]);

  /// see [Product.active]
  static final active =
      QueryBooleanProperty<Product>(_entities[0].properties[6]);

  /// see [Product.status]
  static final status =
      QueryBooleanProperty<Product>(_entities[0].properties[7]);

  /// see [Product.siteId]
  static final siteId =
      QueryIntegerProperty<Product>(_entities[0].properties[8]);

  /// see [Product.picking]
  static final picking =
      QueryStringProperty<Product>(_entities[0].properties[9]);

  /// see [Product.sku]
  static final sku = QueryStringProperty<Product>(_entities[0].properties[10]);

  /// see [Product.skuWithDetail]
  static final skuWithDetail =
      QueryStringProperty<Product>(_entities[0].properties[11]);

  /// see [Product.imagesUrl]
  static final imagesUrl =
      QueryStringVectorProperty<Product>(_entities[0].properties[12]);

  /// see [Product.makerId]
  static final makerId =
      QueryIntegerProperty<Product>(_entities[0].properties[13]);

  /// see [Product.maker]
  static final maker =
      QueryStringProperty<Product>(_entities[0].properties[14]);

  /// see [Product.brandId]
  static final brandId =
      QueryIntegerProperty<Product>(_entities[0].properties[15]);

  /// see [Product.brand]
  static final brand =
      QueryStringProperty<Product>(_entities[0].properties[16]);

  /// see [Product.brandImage]
  static final brandImage =
      QueryStringProperty<Product>(_entities[0].properties[17]);

  /// see [Product.quantity]
  static final quantity =
      QueryIntegerProperty<Product>(_entities[0].properties[18]);

  /// see [Product.rating]
  static final rating =
      QueryDoubleProperty<Product>(_entities[0].properties[19]);
}
