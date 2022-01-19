class ProductModel {
  ProductModel({
    required this.products,
  });
  late final List<Products> products;

  ProductModel.fromJson(Map<String, dynamic> json) {
    products = List.from(json['products']).map((e) => Products.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['products'] = products.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Products {
  Products({
    required this.productId,
    required this.ean,
    required this.name,
    required this.description,
    required this.siteSelected,
    required this.active,
    required this.status,
    required this.siteId,
    required this.picking,
    required this.sku,
    required this.skuWithDetail,
    required this.imagesUrl,
    required this.makerId,
    required this.maker,
    required this.brandId,
    required this.brand,
    required this.brandImage,
    required this.quantity,
    required this.productCategory,
    required this.productLocation,
    required this.size,
    required this.packingSize,
    required this.attributes,
    required this.variacoes,
    required this.price,
    required this.estoque,
    required this.label,
    required this.rating,
  });
  late final int productId;
  late final String ean;
  late final String name;
  late final String description;
  late final String siteSelected;
  late final bool active;
  late final bool status;
  late final int siteId;
  late final String picking;
  late final String sku;
  late final String skuWithDetail;
  late final List<String> imagesUrl;
  late final int makerId;
  late final String maker;
  late final int brandId;
  late final String brand;
  late final String brandImage;
  late final int quantity;
  late final ProductCategory productCategory;
  late final ProductLocation productLocation;
  late final Size size;
  late final PackingSize packingSize;
  late final List<Attributes> attributes;
  late final List<dynamic> variacoes;
  late final Price price;
  late final Estoque estoque;
  late final Label label;
  late final double rating;

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    ean = json['ean'];
    name = json['name'];
    description = json['description'];
    siteSelected = json['siteSelected'];
    active = json['active'];
    status = json['status'];
    siteId = json['siteId'];
    picking = json['picking'];
    sku = json['sku'];
    skuWithDetail = json['skuWithDetail'];
    imagesUrl = List.castFrom<dynamic, String>(json['imagesUrl']);
    makerId = json['makerId'];
    maker = json['maker'];
    brandId = json['brandId'];
    brand = json['brand'];
    brandImage = json['brandImage'];
    quantity = json['quantity'];
    productCategory = ProductCategory.fromJson(json['productCategory']);
    productLocation = ProductLocation.fromJson(json['productLocation']);
    size = Size.fromJson(json['size']);
    packingSize = PackingSize.fromJson(json['packingSize']);
    attributes = List.from(json['attributes']).map((e) => Attributes.fromJson(e)).toList();
    variacoes = List.castFrom<dynamic, dynamic>(json['variacoes']);
    price = Price.fromJson(json['price']);
    estoque = Estoque.fromJson(json['estoque']);
    label = Label.fromJson(json['label']);
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['productId'] = productId;
    _data['ean'] = ean;
    _data['name'] = name;
    _data['description'] = description;
    _data['siteSelected'] = siteSelected;
    _data['active'] = active;
    _data['status'] = status;
    _data['siteId'] = siteId;
    _data['picking'] = picking;
    _data['sku'] = sku;
    _data['skuWithDetail'] = skuWithDetail;
    _data['imagesUrl'] = imagesUrl;
    _data['makerId'] = makerId;
    _data['maker'] = maker;
    _data['brandId'] = brandId;
    _data['brand'] = brand;
    _data['brandImage'] = brandImage;
    _data['quantity'] = quantity;
    _data['productCategory'] = productCategory.toJson();
    _data['productLocation'] = productLocation.toJson();
    _data['size'] = size.toJson();
    _data['packingSize'] = packingSize.toJson();
    _data['attributes'] = attributes.map((e) => e.toJson()).toList();
    _data['variacoes'] = variacoes;
    _data['price'] = price.toJson();
    _data['estoque'] = estoque.toJson();
    _data['label'] = label.toJson();
    _data['rating'] = rating;
    return _data;
  }
}

class ProductCategory {
  ProductCategory({
    required this.lojaId,
    required this.nomeCategoriaLoja,
    required this.categoryId,
    required this.categoryName,
    required this.subCategoryId,
    required this.subCategoryName,
  });
  late final int lojaId;
  late final String nomeCategoriaLoja;
  late final int categoryId;
  late final String categoryName;
  late final int subCategoryId;
  late final String subCategoryName;

  ProductCategory.fromJson(Map<String, dynamic> json) {
    lojaId = json['lojaId'];
    nomeCategoriaLoja = json['nomeCategoriaLoja'];
    categoryId = json['categoryId'];
    categoryName = json['categoryName'];
    subCategoryId = json['subCategoryId'];
    subCategoryName = json['subCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['lojaId'] = lojaId;
    _data['nomeCategoriaLoja'] = nomeCategoriaLoja;
    _data['categoryId'] = categoryId;
    _data['categoryName'] = categoryName;
    _data['subCategoryId'] = subCategoryId;
    _data['subCategoryName'] = subCategoryName;
    return _data;
  }
}

class ProductLocation {
  ProductLocation({
    required this.distribuidor,
    required this.clienteStatusDistribuidor,
  });
  late final String distribuidor;
  late final String clienteStatusDistribuidor;

  ProductLocation.fromJson(Map<String, dynamic> json) {
    distribuidor = json['distribuidor'];
    clienteStatusDistribuidor = json['clienteStatusDistribuidor'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['distribuidor'] = distribuidor;
    _data['clienteStatusDistribuidor'] = clienteStatusDistribuidor;
    return _data;
  }
}

class Size {
  Size({
    required this.height,
    required this.width,
    required this.length,
    required this.weight,
  });
  late final int height;
  late final int width;
  late final int length;
  late final int weight;

  Size.fromJson(Map<String, dynamic> json) {
    height = json['height'];
    width = json['width'];
    length = json['length'];
    weight = json['weight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['height'] = height;
    _data['width'] = width;
    _data['length'] = length;
    _data['weight'] = weight;
    return _data;
  }
}

class PackingSize {
  PackingSize({
    required this.packingHeight,
    required this.packingWidth,
    required this.packingLength,
    required this.packingWeight,
  });
  late final int packingHeight;
  late final int packingWidth;
  late final int packingLength;
  late final int packingWeight;

  PackingSize.fromJson(Map<String, dynamic> json) {
    packingHeight = json['packingHeight'];
    packingWidth = json['packingWidth'];
    packingLength = json['packingLength'];
    packingWeight = json['packingWeight'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['packingHeight'] = packingHeight;
    _data['packingWidth'] = packingWidth;
    _data['packingLength'] = packingLength;
    _data['packingWeight'] = packingWeight;
    return _data;
  }
}

class Attributes {
  Attributes({
    required this.attributeId,
    required this.attributeName,
    required this.type,
    required this.showProduct,
    required this.attributeValues,
  });
  late final int attributeId;
  late final String attributeName;
  late final int type;
  late final bool showProduct;
  late final List<AttributeValues> attributeValues;

  Attributes.fromJson(Map<String, dynamic> json) {
    attributeId = json['attributeId'];
    attributeName = json['attributeName'];
    type = json['type'];
    showProduct = json['showProduct'];
    attributeValues =
        List.from(json['attributeValues']).map((e) => AttributeValues.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributeId'] = attributeId;
    _data['attributeName'] = attributeName;
    _data['type'] = type;
    _data['showProduct'] = showProduct;
    _data['attributeValues'] = attributeValues.map((e) => e.toJson()).toList();
    return _data;
  }
}

class AttributeValues {
  AttributeValues({
    required this.attributeValueId,
    required this.attributeValue,
    required this.attributeContent,
  });
  late final int attributeValueId;
  late final String attributeValue;
  late final String attributeContent;

  AttributeValues.fromJson(Map<String, dynamic> json) {
    attributeValueId = json['attributeValueId'];
    attributeValue = json['attributeValue'];
    attributeContent = json['attributeContent'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['attributeValueId'] = attributeValueId;
    _data['attributeValue'] = attributeValue;
    _data['attributeContent'] = attributeContent;
    return _data;
  }
}

class Price {
  Price({
    required this.unitPrice,
    required this.price,
    required this.salePrice,
    required this.discountValue,
  });
  late final double unitPrice;
  late final double price;
  late final double salePrice;
  late final double discountValue;

  Price.fromJson(Map<String, dynamic> json) {
    unitPrice = json['unitPrice'];
    price = json['price'];
    salePrice = json['salePrice'];
    discountValue = json['discountValue'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['unitPrice'] = unitPrice;
    _data['price'] = price;
    _data['salePrice'] = salePrice;
    _data['discountValue'] = discountValue;
    return _data;
  }
}

class Estoque {
  Estoque({
    required this.total,
    required this.reserved,
    required this.available,
    required this.availabilityDate,
    required this.hasInternalStock,
    required this.hasStock,
  });
  late final int total;
  late final int reserved;
  late final int available;
  late final int availabilityDate;
  late final bool hasInternalStock;
  late final bool hasStock;

  Estoque.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    reserved = json['reserved'];
    available = json['available'];
    availabilityDate = json['availabilityDate'];
    hasInternalStock = json['hasInternalStock'];
    hasStock = json['hasStock'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['total'] = total;
    _data['reserved'] = reserved;
    _data['available'] = available;
    _data['availabilityDate'] = availabilityDate;
    _data['hasInternalStock'] = hasInternalStock;
    _data['hasStock'] = hasStock;
    return _data;
  }
}

class Label {
  Label({
    required this.labelName,
    required this.labelSrc,
    required this.labelSrcList,
  });
  late final String labelName;
  late final String labelSrc;
  late final String labelSrcList;

  Label.fromJson(Map<String, dynamic> json) {
    labelName = json['labelName'];
    labelSrc = json['labelSrc'];
    labelSrcList = json['labelSrcList'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['labelName'] = labelName;
    _data['labelSrc'] = labelSrc;
    _data['labelSrcList'] = labelSrcList;
    return _data;
  }
}
