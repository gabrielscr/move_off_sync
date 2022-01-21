import 'dart:convert';

import 'package:objectbox/objectbox.dart';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  ProductModel({
    this.products,
  });

  List<Product>? products;

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}

@Entity()
class Product {
  Product({
    this.id = 0,
    this.productId,
    this.ean,
    this.name,
    this.description,
    this.siteSelected,
    this.active,
    this.status,
    this.siteId,
    this.picking,
    this.sku,
    this.skuWithDetail,
    this.imagesUrl,
    this.makerId,
    this.maker,
    this.brandId,
    this.brand,
    this.brandImage,
    this.quantity,
    this.productCategory,
    this.productLocation,
    this.size,
    this.packingSize,
    this.attributes,
    this.variacoes,
    this.price,
    this.estoque,
    this.label,
    this.rating,
  });

  int id;
  int? productId;
  String? ean;
  String? name;
  String? description;
  String? siteSelected;
  bool? active;
  bool? status;
  int? siteId;
  String? picking;
  String? sku;
  String? skuWithDetail;
  List<String>? imagesUrl;
  int? makerId;
  String? maker;
  int? brandId;
  String? brand;
  String? brandImage;
  int? quantity;
  ProductCategory? productCategory;
  ProductLocation? productLocation;
  Size? size;
  PackingSize? packingSize;
  List<Attribute>? attributes;
  List<dynamic>? variacoes;
  Price? price;
  Estoque? estoque;
  Label? label;
  double? rating;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productId"],
        ean: json["ean"],
        name: json["name"],
        description: json["description"],
        siteSelected: json["siteSelected"],
        active: json["active"],
        status: json["status"],
        siteId: json["siteId"],
        picking: json["picking"],
        sku: json["sku"],
        skuWithDetail: json["skuWithDetail"],
        imagesUrl: List<String>.from(json["imagesUrl"].map((x) => x)),
        makerId: json["makerId"],
        maker: json["maker"],
        brandId: json["brandId"],
        brand: json["brand"],
        brandImage: json["brandImage"],
        quantity: json["quantity"],
        productCategory: ProductCategory.fromJson(json["productCategory"]),
        productLocation: ProductLocation.fromJson(json["productLocation"]),
        size: Size.fromJson(json["size"]),
        packingSize: PackingSize.fromJson(json["packingSize"]),
        attributes: List<Attribute>.from(
            json["attributes"].map((x) => Attribute.fromJson(x))),
        variacoes: List<dynamic>.from(json["variacoes"].map((x) => x)),
        price: Price.fromJson(json["price"]),
        estoque: Estoque.fromJson(json["estoque"]),
        label: Label.fromJson(json["label"]),
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "ean": ean,
        "name": name,
        "description": description,
        "siteSelected": siteSelected,
        "active": active,
        "status": status,
        "siteId": siteId,
        "picking": picking,
        "sku": sku,
        "skuWithDetail": skuWithDetail,
        "imagesUrl": List<dynamic>.from(imagesUrl!.map((x) => x)),
        "makerId": makerId,
        "maker": maker,
        "brandId": brandId,
        "brand": brand,
        "brandImage": brandImage,
        "quantity": quantity,
        "productCategory": productCategory!.toJson(),
        "productLocation": productLocation!.toJson(),
        "size": size!.toJson(),
        "packingSize": packingSize!.toJson(),
        "attributes": List<dynamic>.from(attributes!.map((x) => x.toJson())),
        "variacoes": List<dynamic>.from(variacoes!.map((x) => x)),
        "price": price!.toJson(),
        "estoque": estoque!.toJson(),
        "label": label!.toJson(),
        "rating": rating,
      };
}

class Attribute {
  Attribute({
    this.attributeId,
    this.attributeName,
    this.type,
    this.showProduct,
    this.attributeValues,
  });

  int? attributeId;
  String? attributeName;
  int? type;
  bool? showProduct;
  List<AttributeValue>? attributeValues;

  factory Attribute.fromJson(Map<String, dynamic> json) => Attribute(
        attributeId: json["attributeId"],
        attributeName: json["attributeName"],
        type: json["type"],
        showProduct: json["showProduct"],
        attributeValues: List<AttributeValue>.from(
            json["attributeValues"].map((x) => AttributeValue.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "attributeId": attributeId,
        "attributeName": attributeName,
        "type": type,
        "showProduct": showProduct,
        "attributeValues":
            List<dynamic>.from(attributeValues!.map((x) => x.toJson())),
      };
}

class AttributeValue {
  AttributeValue({
    this.attributeValueId,
    this.attributeValue,
    this.attributeContent,
  });

  int? attributeValueId;
  String? attributeValue;
  String? attributeContent;

  factory AttributeValue.fromJson(Map<String, dynamic> json) => AttributeValue(
        attributeValueId: json["attributeValueId"],
        attributeValue: json["attributeValue"],
        attributeContent: json["attributeContent"],
      );

  Map<String, dynamic> toJson() => {
        "attributeValueId": attributeValueId,
        "attributeValue": attributeValue,
        "attributeContent": attributeContent,
      };
}

class Estoque {
  Estoque({
    this.total,
    this.reserved,
    this.available,
    this.availabilityDate,
    this.hasInternalStock,
    this.hasStock,
  });

  int? total;
  int? reserved;
  int? available;
  int? availabilityDate;
  bool? hasInternalStock;
  bool? hasStock;

  factory Estoque.fromJson(Map<String, dynamic> json) => Estoque(
        total: json["total"],
        reserved: json["reserved"],
        available: json["available"],
        availabilityDate: json["availabilityDate"],
        hasInternalStock: json["hasInternalStock"],
        hasStock: json["hasStock"],
      );

  Map<String, dynamic> toJson() => {
        "total": total,
        "reserved": reserved,
        "available": available,
        "availabilityDate": availabilityDate,
        "hasInternalStock": hasInternalStock,
        "hasStock": hasStock,
      };
}

class Label {
  Label({
    this.labelName,
    this.labelSrc,
    this.labelSrcList,
  });

  String? labelName;
  String? labelSrc;
  String? labelSrcList;

  factory Label.fromJson(Map<String, dynamic> json) => Label(
        labelName: json["labelName"],
        labelSrc: json["labelSrc"],
        labelSrcList: json["labelSrcList"],
      );

  Map<String, dynamic> toJson() => {
        "labelName": labelName,
        "labelSrc": labelSrc,
        "labelSrcList": labelSrcList,
      };
}

class PackingSize {
  PackingSize({
    this.packingHeight,
    this.packingWidth,
    this.packingLength,
    this.packingWeight,
  });

  int? packingHeight;
  int? packingWidth;
  int? packingLength;
  int? packingWeight;

  factory PackingSize.fromJson(Map<String, dynamic> json) => PackingSize(
        packingHeight: json["packingHeight"],
        packingWidth: json["packingWidth"],
        packingLength: json["packingLength"],
        packingWeight: json["packingWeight"],
      );

  Map<String, dynamic> toJson() => {
        "packingHeight": packingHeight,
        "packingWidth": packingWidth,
        "packingLength": packingLength,
        "packingWeight": packingWeight,
      };
}

class Price {
  Price({
    this.unitPrice,
    this.price,
    this.salePrice,
    this.discountValue,
  });

  double? unitPrice;
  double? price;
  double? salePrice;
  double? discountValue;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        unitPrice: json["unitPrice"].toDouble(),
        price: json["price"].toDouble(),
        salePrice: json["salePrice"].toDouble(),
        discountValue: json["discountValue"],
      );

  Map<String, dynamic> toJson() => {
        "unitPrice": unitPrice,
        "price": price,
        "salePrice": salePrice,
        "discountValue": discountValue,
      };
}

class ProductCategory {
  ProductCategory({
    this.lojaId,
    this.nomeCategoriaLoja,
    this.categoryId,
    this.categoryName,
    this.subCategoryId,
    this.subCategoryName,
  });

  int? lojaId;
  String? nomeCategoriaLoja;
  int? categoryId;
  String? categoryName;
  int? subCategoryId;
  String? subCategoryName;

  factory ProductCategory.fromJson(Map<String, dynamic> json) =>
      ProductCategory(
        lojaId: json["lojaId"],
        nomeCategoriaLoja: json["nomeCategoriaLoja"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        subCategoryId: json["subCategoryId"],
        subCategoryName: json["subCategoryName"],
      );

  Map<String, dynamic> toJson() => {
        "lojaId": lojaId,
        "nomeCategoriaLoja": nomeCategoriaLoja,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "subCategoryId": subCategoryId,
        "subCategoryName": subCategoryName,
      };
}

class ProductLocation {
  ProductLocation({
    this.distribuidor,
    this.clienteStatusDistribuidor,
  });

  String? distribuidor;
  String? clienteStatusDistribuidor;

  factory ProductLocation.fromJson(Map<String, dynamic> json) =>
      ProductLocation(
        distribuidor: json["distribuidor"],
        clienteStatusDistribuidor: json["clienteStatusDistribuidor"],
      );

  Map<String, dynamic> toJson() => {
        "distribuidor": distribuidor,
        "clienteStatusDistribuidor": clienteStatusDistribuidor,
      };
}

class Size {
  Size({
    this.height,
    this.width,
    this.length,
    this.weight,
  });

  int? height;
  int? width;
  int? length;
  int? weight;

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        height: json["height"],
        width: json["width"],
        length: json["length"],
        weight: json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "width": width,
        "length": length,
        "weight": weight,
      };
}
