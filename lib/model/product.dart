// ignore_for_file: camel_case_types

class productApi {
  int? productId;
  String? iTEMDESCRIPTION;
  String? shortDescription;
  String? lognDescription;
  String? services;
  String? accessories;
  String? iTEMCODE;
  dynamic brandId;
  dynamic brand;
  String? manufacturerPartNo;
  List<ImagePath>? imagePath;
  List<Categories>? categories;
  dynamic markAsNew;
  int? stockQuantity;
  int? price;
  dynamic showOnHomepage;
  dynamic disableBuyButton;
  dynamic disableWishlistButton;
  bool? published;
  int? storeId;
  List<dynamic>? relatedproducts;
  dynamic iNVENTORYITEMID;
  dynamic oDESCRIPTION;
  dynamic oITEMCODE;
  String? iTEMCREATIONDATE;
  String? iTEMLASTUPDATEDATE;
  dynamic tRFTOECOMM;
  dynamic pRIMARYUNITOFMEASURE;
  dynamic eAUTOITEMID;
  dynamic eAUTOITEM;
  dynamic bRAND;
  dynamic bRANDDESC;
  dynamic mAJORCAT;
  dynamic mAJORCATDESC;
  dynamic mINORCAT;
  dynamic mINORCATDESC;
  dynamic sUBMINORCAT;
  dynamic sUBMINORCATDESC;
  dynamic pRODUCTTYPE;
  dynamic pRODCATDESC;

  productApi(
      {this.productId,
      this.iTEMDESCRIPTION,
      this.shortDescription,
      this.lognDescription,
      this.services,
      this.accessories,
      this.iTEMCODE,
      this.brandId,
      this.brand,
      this.manufacturerPartNo,
      this.imagePath,
      this.categories,
      this.markAsNew,
      this.stockQuantity,
      this.price,
      this.showOnHomepage,
      this.disableBuyButton,
      this.disableWishlistButton,
      this.published,
      this.storeId,
      this.relatedproducts,
      this.iNVENTORYITEMID,
      this.oDESCRIPTION,
      this.oITEMCODE,
      this.iTEMCREATIONDATE,
      this.iTEMLASTUPDATEDATE,
      this.tRFTOECOMM,
      this.pRIMARYUNITOFMEASURE,
      this.eAUTOITEMID,
      this.eAUTOITEM,
      this.bRAND,
      this.bRANDDESC,
      this.mAJORCAT,
      this.mAJORCATDESC,
      this.mINORCAT,
      this.mINORCATDESC,
      this.sUBMINORCAT,
      this.sUBMINORCATDESC,
      this.pRODUCTTYPE,
      this.pRODCATDESC});

  productApi.fromJson(dynamic json) {
    productId = json['Product_Id'];
    iTEMDESCRIPTION = json['ITEM_DESCRIPTION'];
    shortDescription = json['ShortDescription'];
    lognDescription = json['LognDescription'];
    services = json['Services'];
    accessories = json['Accessories'];
    iTEMCODE = json['ITEM_CODE'];
    brandId = json['Brand_Id'];
    brand = json['Brand'];
    manufacturerPartNo = json['ManufacturerPartNo'];
    if (json['ImagePath'] != null) {
      imagePath = <ImagePath>[];
      json['ImagePath'].forEach((v) {
        imagePath!.add(ImagePath.fromJson(v));
      });
    }
    if (json['Categories'] != null) {
      categories = <Categories>[];
      json['Categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    markAsNew = json['MarkAsNew'];
    stockQuantity = json['StockQuantity'];
    price = json['Price'];
    showOnHomepage = json['ShowOnHomepage'];
    disableBuyButton = json['DisableBuyButton'];
    disableWishlistButton = json['DisableWishlistButton'];
    published = json['Published'];
    storeId = json['Store_Id'];
    if (json['relatedproducts'] != null) {
      relatedproducts = <dynamic>[];
      json['relatedproducts'].forEach((v) {
        relatedproducts!.add(v);
      });
    }
    iNVENTORYITEMID = json['INVENTORY_ITEM_ID'];
    oDESCRIPTION = json['O_DESCRIPTION'];
    oITEMCODE = json['O_ITEM_CODE'];
    iTEMCREATIONDATE = json['ITEM_CREATION_DATE'];
    iTEMLASTUPDATEDATE = json['ITEM_LAST_UPDATE_DATE'];
    tRFTOECOMM = json['TRF_TO_ECOMM'];
    pRIMARYUNITOFMEASURE = json['PRIMARY_UNIT_OF_MEASURE'];
    eAUTOITEMID = json['EAUTO_ITEMID'];
    eAUTOITEM = json['EAUTO_ITEM'];
    bRAND = json['BRAND'];
    bRANDDESC = json['BRAND_DESC'];
    mAJORCAT = json['MAJOR_CAT'];
    mAJORCATDESC = json['MAJORCAT_DESC'];
    mINORCAT = json['MINOR_CAT'];
    mINORCATDESC = json['MINORCAT_DESC'];
    sUBMINORCAT = json['SUBMINOR_CAT'];
    sUBMINORCATDESC = json['SUB_MINORCAT_DESC'];
    pRODUCTTYPE = json['PRODUCT_TYPE'];
    pRODCATDESC = json['PROD_CATDESC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Id'] = productId;
    data['ITEM_DESCRIPTION'] = iTEMDESCRIPTION;
    data['ShortDescription'] = shortDescription;
    data['LognDescription'] = lognDescription;
    data['Services'] = services;
    data['Accessories'] = accessories;
    data['ITEM_CODE'] = iTEMCODE;
    data['Brand_Id'] = brandId;
    data['Brand'] = brand;
    data['ManufacturerPartNo'] = manufacturerPartNo;
    if (imagePath != null) {
      data['ImagePath'] = imagePath!.map((v) => v.toJson()).toList();
    }
    if (categories != null) {
      data['Categories'] = categories!.map((v) => v.toJson()).toList();
    }
    data['MarkAsNew'] = markAsNew;
    data['StockQuantity'] = stockQuantity;
    data['Price'] = price;
    data['ShowOnHomepage'] = showOnHomepage;
    data['DisableBuyButton'] = disableBuyButton;
    data['DisableWishlistButton'] = disableWishlistButton;
    data['Published'] = published;
    data['Store_Id'] = storeId;
    if (relatedproducts != null) {
      data['relatedproducts'] =
          relatedproducts!.map((v) => v.toJson()).toList();
    }
    data['INVENTORY_ITEM_ID'] = iNVENTORYITEMID;
    data['O_DESCRIPTION'] = oDESCRIPTION;
    data['O_ITEM_CODE'] = oITEMCODE;
    data['ITEM_CREATION_DATE'] = iTEMCREATIONDATE;
    data['ITEM_LAST_UPDATE_DATE'] = iTEMLASTUPDATEDATE;
    data['TRF_TO_ECOMM'] = tRFTOECOMM;
    data['PRIMARY_UNIT_OF_MEASURE'] = pRIMARYUNITOFMEASURE;
    data['EAUTO_ITEMID'] = eAUTOITEMID;
    data['EAUTO_ITEM'] = eAUTOITEM;
    data['BRAND'] = bRAND;
    data['BRAND_DESC'] = bRANDDESC;
    data['MAJOR_CAT'] = mAJORCAT;
    data['MAJORCAT_DESC'] = mAJORCATDESC;
    data['MINOR_CAT'] = mINORCAT;
    data['MINORCAT_DESC'] = mINORCATDESC;
    data['SUBMINOR_CAT'] = sUBMINORCAT;
    data['SUB_MINORCAT_DESC'] = sUBMINORCATDESC;
    data['PRODUCT_TYPE'] = pRODUCTTYPE;
    data['PROD_CATDESC'] = pRODCATDESC;
    return data;
  }
}

class ImagePath {
  String? imagePath;
  dynamic titleAttribute;
  int? productImagesId;
  dynamic displayOrder;
  String? altAttribute;

  ImagePath(
      {this.imagePath,
      this.titleAttribute,
      this.productImagesId,
      this.displayOrder,
      this.altAttribute});

  ImagePath.fromJson(Map<String, dynamic> json) {
    imagePath = json['ImagePath'];
    titleAttribute = json['TitleAttribute'];
    productImagesId = json['ProductImages_Id'];
    displayOrder = json['DisplayOrder'];
    altAttribute = json['AltAttribute'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ImagePath'] = imagePath;
    data['TitleAttribute'] = titleAttribute;
    data['ProductImages_Id'] = productImagesId;
    data['DisplayOrder'] = displayOrder;
    data['AltAttribute'] = altAttribute;
    return data;
  }
}

class Categories {
  int? value;
  String? label;

  Categories({this.value, this.label});

  Categories.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    label = json['label'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['value'] = value;
    data['label'] = label;
    return data;
  }
}
