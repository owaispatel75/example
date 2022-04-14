class ProductId {
  int? productId;
  bool? published;
  String? oDESCRIPTION;
  String? slug;
  String? name;
  String? compareAtPrice;
  String? sku;
  dynamic price;
  dynamic isNew;
  List<dynamic>? newProductCategories;
  dynamic featured;
  List<dynamic>? featuredProductCategories;
  String? shortDescription;
  String? longDescription;
  dynamic services;
  dynamic accessories;
  List<Images>? images;
  List<dynamic>? dataSheet;
  List<Brand>? brand;
  List<dynamic>? badges;
  String? rating;
  String? reviews;
  String? availability;
  int? storeId;
  List<Categories>? categories;
  List<Attributes>? attributes;
  List<dynamic>? relatedproducts;

  ProductId(
      {this.productId,
      this.published,
      this.oDESCRIPTION,
      this.slug,
      this.name,
      this.compareAtPrice,
      this.sku,
      this.price,
      this.isNew,
      this.newProductCategories,
      this.featured,
      this.featuredProductCategories,
      this.shortDescription,
      this.longDescription,
      this.services,
      this.accessories,
      this.images,
      this.dataSheet,
      this.brand,
      this.badges,
      this.rating,
      this.reviews,
      this.availability,
      this.storeId,
      this.categories,
      this.attributes,
      this.relatedproducts});

  ProductId.fromJson(Map<String, dynamic> json) {
    productId = json['Product_Id'];
    published = json['Published'];
    oDESCRIPTION = json['O_DESCRIPTION'];
    slug = json['slug'];
    name = json['name'];
    compareAtPrice = json['compareAtPrice'];
    sku = json['sku'];
    price = json['price'];
    isNew = json['isNew'];
    newProductCategories = json['newProductCategories'];
    featured = json['featured'];
    featuredProductCategories =
        json['featuredProductCategories'];
    shortDescription = json['short_description'];
    longDescription = json['long_description'];
    services = json['Services'];
    accessories = json['Accessories'];
    if (json['images'] != null) {
      images = <Images>[];
      for (var v in (json['images'] as List)) {
        images!.add(Images.fromJson(v));
      }
    }
    if (json['DataSheet'] != null) {
      dataSheet = <dynamic>[];
      json['DataSheet'].forEach((v) {
        dataSheet!.add(v);
      });
    }
    if (json['brand'] != null) {
      brand = <Brand>[];
      for (var v in (json['brand'] as List)) {
        brand!.add(Brand.fromJson(v));
      }
    }
    badges = json['badges'];

    rating = json['rating'];
    reviews = json['reviews'];
    availability = json['availability'];
    storeId = json['Store_Id'];

    if (json['categories'] != null) {
      categories = <Categories>[];
      for (var v in (json['categories']  as List)) {
        categories!.add(Categories.fromJson(v));
      }
    }

    if (json['attributes'] != null) {
      attributes = <Attributes>[];
      for (var v in (json['attributes'] as List)) {
        attributes!.add(Attributes.fromJson(v));
      }
    }

    if (json['relatedproducts'] != null) {
      relatedproducts = <dynamic>[];
      for (var v in (json['relatedproducts'] as List)) {
         relatedproducts!.add(v);
      }
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Id'] = productId;
    data['Published'] = published;
    data['O_DESCRIPTION'] = oDESCRIPTION;
    data['slug'] = slug;
    data['name'] = name;
    data['compareAtPrice'] = compareAtPrice;
    data['sku'] = sku;
    data['price'] = price;
    data['isNew'] = isNew;
    data['newProductCategories'] = newProductCategories;
    data['featured'] = featured;
    data['featuredProductCategories'] = featuredProductCategories;
    data['short_description'] = shortDescription;
    data['long_description'] = longDescription;
    data['Services'] = services;
    data['Accessories'] = accessories;
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
    if (dataSheet != null) {
      // data['DataSheet'] = dataSheet!.map((v) => v.toJson()).toList();
    }
    if (brand != null) {
      data['brand'] = brand!.map((v) => v.toJson()).toList();
    }
    data['badges'] = badges;
    data['rating'] = rating;
    data['reviews'] = reviews;
    data['availability'] = availability;
    data['Store_Id'] = storeId;
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    if (attributes != null) {
      data['attributes'] = attributes!.map((v) => v.toJson()).toList();
    }
    if (relatedproducts != null) {
      // data['relatedproducts'] =
      //     relatedproducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images {
  String? imagePath;
  dynamic displayOrder;

  Images({this.imagePath, this.displayOrder});

  Images.fromJson(Map<String, dynamic> json) {
    imagePath = json['ImagePath'];
    displayOrder = json['DisplayOrder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ImagePath'] = imagePath;
    data['DisplayOrder'] = displayOrder;
    return data;
  }
}

class Brand {
  int? id;
  String? slug;
  String? name;
  dynamic image;

  Brand({this.id, this.slug, this.name, this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    slug = json['slug'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['slug'] = slug;
    data['name'] = name;
    data['image'] = image;
    return data;
  }
}

class Categories {
  int? id;
  String? name;
  String? slug;
  dynamic image;
  String? path;
  String? type;
  String? children;
  String? parent;
  int? items;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.path,
      this.type,
      this.children,
      this.parent,
      this.items});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    path = json['path'];
    type = json['type'];
    children = json['children'];
    parent = json['parent'];
    items = json['items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['path'] = path;
    data['type'] = type;
    data['children'] = children;
    data['parent'] = parent;
    data['items'] = items;
    return data;
  }
}

class Attributes {
  int? prodcutId;
  int? productProductAttributeMappingId;
  String? name;
  String? slug;
  bool? allowFiltering;
  bool? featured;
  bool? recommendation;
  String? recommendQuestion;
  List<RecommendCategory>? recommendCategory;
  int? recommendDisplayOrder;
  int? attributedisplayorder;
  bool? displayOnProductPage;
  bool? specification;
  List<Values>? values;

  Attributes(
      {this.prodcutId,
      this.productProductAttributeMappingId,
      this.name,
      this.slug,
      this.allowFiltering,
      this.featured,
      this.recommendation,
      this.recommendQuestion,
      this.recommendCategory,
      this.recommendDisplayOrder,
      this.attributedisplayorder,
      this.displayOnProductPage,
      this.specification,
      this.values});

  Attributes.fromJson(Map<String, dynamic> json) {
    prodcutId = json['ProdcutId'];
    productProductAttributeMappingId =
        json['Product_ProductAttribute_Mapping_Id'];
    name = json['name'];
    slug = json['slug'];
    allowFiltering = json['AllowFiltering'];
    featured = json['featured'];
    recommendation = json['Recommendation'];
    recommendQuestion = json['Recommend_Question'];
    if (json['Recommend_Category'] != dynamic) {
      recommendCategory = <RecommendCategory>[];
      for (var v in (json['Recommend_Category'] as List)) {
        recommendCategory!.add(RecommendCategory.fromJson(v));
      }
    }
    recommendDisplayOrder = json['Recommend_DisplayOrder'];
    attributedisplayorder = json['Attributedisplayorder'];
    displayOnProductPage = json['DisplayOnProductPage'];
    specification = json['Specification'];
    if (json['values'] != dynamic) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProdcutId'] = prodcutId;
    data['Product_ProductAttribute_Mapping_Id'] =
        productProductAttributeMappingId;
    data['name'] = name;
    data['slug'] = slug;
    data['AllowFiltering'] = allowFiltering;
    data['featured'] = featured;
    data['Recommendation'] = recommendation;
    data['Recommend_Question'] = recommendQuestion;
    if (recommendCategory != null) {
      data['Recommend_Category'] =
          recommendCategory!.map((v) => v.toJson()).toList();
    }
    data['Recommend_DisplayOrder'] = recommendDisplayOrder;
    data['Attributedisplayorder'] = attributedisplayorder;
    data['DisplayOnProductPage'] = displayOnProductPage;
    data['Specification'] = specification;
    if (values != null) {
      data['values'] = values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class RecommendCategory {
  int? productCategoryId;
  String? name;

  RecommendCategory({this.productCategoryId, this.name});

  RecommendCategory.fromJson(Map<String, dynamic> json) {
    productCategoryId = json['ProductCategory_Id'];
    name = json['Name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ProductCategory_Id'] = productCategoryId;
    data['Name'] = name;
    return data;
  }
}

class Values {
  String? slug;
  String? name;
  int? valuedisplayorder;

  Values({this.slug, this.name, this.valuedisplayorder});

  Values.fromJson(Map<String, dynamic> json) {
    slug = json['slug'];
    name = json['name'];
    valuedisplayorder = json['valuedisplayorder'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['slug'] = slug;
    data['name'] = name;
    data['valuedisplayorder'] = valuedisplayorder;
    return data;
  }
}
