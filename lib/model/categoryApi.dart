// ignore_for_file: unnecessary_new, camel_case_types, file_names, prefer_collection_literals

class categoryApi {
  int? productCategoryId;
  String? name;
  dynamic description;
  bool? published;
  String? createdAt;
  dynamic createdBy;
  String? updatedAt;
  int? updatedBy;
  int? storeId;
  String? nestedCategoryPath;
  bool? recommendation;
  String? slug;
  int? items;
  String? path;
  List<childrenApi>? children;

  categoryApi(
      {this.productCategoryId,
      this.name,
      this.description,
      this.published,
      this.createdAt,
      this.createdBy,
      this.updatedAt,
      this.updatedBy,
      this.storeId,
      this.nestedCategoryPath,
      this.recommendation,
      this.slug,
      this.items,
      this.path,
      this.children});

  categoryApi.fromJson(dynamic json) {
    productCategoryId = json['ProductCategory_Id'];
    name = json['name'];
    description = json['description'];
    published = json['published'];
    createdAt = json['CreatedAt'];
    createdBy = json['CreatedBy'];
    updatedAt = json['UpdatedAt'];
    updatedBy = json['UpdatedBy'];
    storeId = json['Store_Id'];
    nestedCategoryPath = json['NestedCategoryPath'];
    recommendation = json['Recommendation'];
    slug = json['slug'];
    items = json['items'];
    path = json['path'];


    if ((json["children"] as List).isNotEmpty) {
      children = <childrenApi>[];
      for (var v in (json["children"] as List)) {
        children!.add(childrenApi.fromJson(v));
      }
    }

  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['ProductCategory_Id'] = productCategoryId;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['published'] = published;
  //   data['CreatedAt'] = createdAt;
  //   data['CreatedBy'] = createdBy;
  //   data['UpdatedAt'] = updatedAt;
  //   data['UpdatedBy'] = updatedBy;
  //   data['Store_Id'] = storeId;
  //   data['NestedCategoryPath'] = nestedCategoryPath;
  //   data['Recommendation'] = recommendation;
  //   data['slug'] = slug;
  //   data['items'] = items;
  //   data['path'] = path;
  //   if (children != null) {
  //     data['children'] = children!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class childrenApi {
  int? id;
  String? name;
  String? slug;
  dynamic image;
  String? path;
  dynamic recommendation;
  int? items;
  dynamic children;

  childrenApi(
      {this.id,
      this.name,
      this.slug,
      this.image,
      this.path,
      this.recommendation,
      this.items,
      this.children});

  childrenApi.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    path = json['path'];
    recommendation = json['Recommendation'];
    items = json['items'];
    if ((json['children'] as List).isNotEmpty) {
      children = [] as List;
      for (var v in (json['children'] as List)) {
        children.add((v));
      }
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['slug'] = slug;
  //   data['image'] = image;
  //   data['path'] = path;
  //   data['Recommendation'] = recommendation;
  //   data['items'] = items;
  //   if (children != null) {
  //     data['children'] = children!.map((v) => v).toList();
  //   }
  //   return data;
  // }
}
