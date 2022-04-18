// ignore_for_file: file_names, camel_case_types, unnecessary_null_comparison

class salesOrderDetailsApi {
  List<SalesOrderDetailsData>? data;

  salesOrderDetailsApi({this.data});

  salesOrderDetailsApi.fromJson(Map<String, dynamic> json) {
    if (json != null) {
      data = <SalesOrderDetailsData>[];
      for (var v in (json as List)) {
        data!.add(SalesOrderDetailsData.fromJson(v));
      }
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class SalesOrderDetailsData {
  int? oRDERID;
  int? oORDERID;
  String? oRDERNUMBER;
  String? oRDERLINEID;
  String? cOMPANY;
  int? oRGID;
  int? sTOREID;
  String? storeNam;
  String? sTATUS;
  String? oRDERLINESTATUS;
  int? cUSTOMERID;
  int? eCOMCUSTOMERID;
  String? cUSTOMERNUMBER;
  String? cUSTOMERNAME;
  String? qUOTENUMBER;
  String? qUOTEDATE;
  String? oRDEREDDATE;
  String? cREATIONDATE;
  String? iTEMCODE;
  String? iNVENTORYITEMID;
  String? iTEMDESCRIPTION;
  dynamic pRODUCTITEMCODE;
  dynamic pRODUCTITEMDESCRIPTION;
  String? uOM;
  String? oRDEREDQUANTITY;
  String? sHIPPEDQUANTITY;
  String? uNITSELLINGPRICE;
  String? uNITLISTPRICE;
  String? dISCOUNT;
  String? cURRENCY;
  String? fCAMOUNT;
  String? eXCHANGERATE;
  String? aMOUNTINAED;
  String? cUSTPO;
  String? cREATEDBY;
  String? oRGANIZATIONNAME;
  int? oRGANIZATIONID;
  dynamic tRXNUMBER;
  String? tRXDATE;
  String? dELIVERYNAME;
  String? dELIVERYDATE;
  String? uNITCOST;
  String? lASTUPDATEDATE;
  dynamic oRIGINALORDER;
  dynamic oRIGINALORDERID;
  dynamic oRIGINALORDERLINEID;

  SalesOrderDetailsData(
      {this.oRDERID,
      this.oORDERID,
      this.oRDERNUMBER,
      this.oRDERLINEID,
      this.cOMPANY,
      this.oRGID,
      this.sTOREID,
      this.storeNam,
      this.sTATUS,
      this.oRDERLINESTATUS,
      this.cUSTOMERID,
      this.eCOMCUSTOMERID,
      this.cUSTOMERNUMBER,
      this.cUSTOMERNAME,
      this.qUOTENUMBER,
      this.qUOTEDATE,
      this.oRDEREDDATE,
      this.cREATIONDATE,
      this.iTEMCODE,
      this.iNVENTORYITEMID,
      this.iTEMDESCRIPTION,
      this.pRODUCTITEMCODE,
      this.pRODUCTITEMDESCRIPTION,
      this.uOM,
      this.oRDEREDQUANTITY,
      this.sHIPPEDQUANTITY,
      this.uNITSELLINGPRICE,
      this.uNITLISTPRICE,
      this.dISCOUNT,
      this.cURRENCY,
      this.fCAMOUNT,
      this.eXCHANGERATE,
      this.aMOUNTINAED,
      this.cUSTPO,
      this.cREATEDBY,
      this.oRGANIZATIONNAME,
      this.oRGANIZATIONID,
      this.tRXNUMBER,
      this.tRXDATE,
      this.dELIVERYNAME,
      this.dELIVERYDATE,
      this.uNITCOST,
      this.lASTUPDATEDATE,
      this.oRIGINALORDER,
      this.oRIGINALORDERID,
      this.oRIGINALORDERLINEID});

  SalesOrderDetailsData.fromJson(Map<String, dynamic> json) {
    oRDERID = json['ORDER_ID'];
    oORDERID = json['O_ORDER_ID'];
    oRDERNUMBER = json['ORDER_NUMBER'];
    oRDERLINEID = json['ORDER_LINE_ID'];
    cOMPANY = json['COMPANY'];
    oRGID = json['ORG_ID'];
    sTOREID = json['STORE_ID'];
    storeNam = json['StoreNam'];
    sTATUS = json['STATUS'];
    oRDERLINESTATUS = json['ORDER_LINE_STATUS'];
    cUSTOMERID = json['CUSTOMER_ID'];
    eCOMCUSTOMERID = json['ECOM_CUSTOMER_ID'];
    cUSTOMERNUMBER = json['CUSTOMER_NUMBER'];
    cUSTOMERNAME = json['CUSTOMER_NAME'];
    qUOTENUMBER = json['QUOTE_NUMBER'];
    qUOTEDATE = json['QUOTE_DATE'];
    oRDEREDDATE = json['ORDERED_DATE'];
    cREATIONDATE = json['CREATION_DATE'];
    iTEMCODE = json['ITEM_CODE'];
    iNVENTORYITEMID = json['INVENTORY_ITEM_ID'];
    iTEMDESCRIPTION = json['ITEM_DESCRIPTION'];
    pRODUCTITEMCODE = json['PRODUCT_ITEM_CODE'];
    pRODUCTITEMDESCRIPTION = json['PRODUCT_ITEM_DESCRIPTION'];
    uOM = json['UOM'];
    oRDEREDQUANTITY = json['ORDERED_QUANTITY'];
    sHIPPEDQUANTITY = json['SHIPPED_QUANTITY'];
    uNITSELLINGPRICE = json['UNIT_SELLING_PRICE'];
    uNITLISTPRICE = json['UNIT_LIST_PRICE'];
    dISCOUNT = json['DISCOUNT'];
    cURRENCY = json['CURRENCY'];
    fCAMOUNT = json['FC_AMOUNT'];
    eXCHANGERATE = json['EXCHANGE_RATE'];
    aMOUNTINAED = json['AMOUNT_IN_AED'];
    cUSTPO = json['CUST_PO'];
    cREATEDBY = json['CREATED_BY'];
    oRGANIZATIONNAME = json['ORGANIZATION_NAME'];
    oRGANIZATIONID = json['ORGANIZATION_ID'];
    tRXNUMBER = json['TRX_NUMBER'];
    tRXDATE = json['TRX_DATE'];
    dELIVERYNAME = json['DELIVERY_NAME'];
    dELIVERYDATE = json['DELIVERY_DATE'];
    uNITCOST = json['UNIT_COST'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    oRIGINALORDER = json['ORIGINAL_ORDER'];
    oRIGINALORDERID = json['ORIGINAL_ORDER_ID'];
    oRIGINALORDERLINEID = json['ORIGINAL_ORDER_LINE_ID'];
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['ORDER_ID'] = oRDERID;
  //   data['O_ORDER_ID'] = oORDERID;
  //   data['ORDER_NUMBER'] = oRDERNUMBER;
  //   data['ORDER_LINE_ID'] = oRDERLINEID;
  //   data['COMPANY'] = cOMPANY;
  //   data['ORG_ID'] = oRGID;
  //   data['STORE_ID'] = sTOREID;
  //   data['StoreNam'] = storeNam;
  //   data['STATUS'] = sTATUS;
  //   data['ORDER_LINE_STATUS'] = oRDERLINESTATUS;
  //   data['CUSTOMER_ID'] = cUSTOMERID;
  //   data['ECOM_CUSTOMER_ID'] = eCOMCUSTOMERID;
  //   data['CUSTOMER_NUMBER'] = cUSTOMERNUMBER;
  //   data['CUSTOMER_NAME'] = cUSTOMERNAME;
  //   data['QUOTE_NUMBER'] = qUOTENUMBER;
  //   data['QUOTE_DATE'] = qUOTEDATE;
  //   data['ORDERED_DATE'] = oRDEREDDATE;
  //   data['CREATION_DATE'] = cREATIONDATE;
  //   data['ITEM_CODE'] = iTEMCODE;
  //   data['INVENTORY_ITEM_ID'] = iNVENTORYITEMID;
  //   data['ITEM_DESCRIPTION'] = iTEMDESCRIPTION;
  //   data['PRODUCT_ITEM_CODE'] = pRODUCTITEMCODE;
  //   data['PRODUCT_ITEM_DESCRIPTION'] = pRODUCTITEMDESCRIPTION;
  //   data['UOM'] = uOM;
  //   data['ORDERED_QUANTITY'] = oRDEREDQUANTITY;
  //   data['SHIPPED_QUANTITY'] = sHIPPEDQUANTITY;
  //   data['UNIT_SELLING_PRICE'] = uNITSELLINGPRICE;
  //   data['UNIT_LIST_PRICE'] = uNITLISTPRICE;
  //   data['DISCOUNT'] = dISCOUNT;
  //   data['CURRENCY'] = cURRENCY;
  //   data['FC_AMOUNT'] = fCAMOUNT;
  //   data['EXCHANGE_RATE'] = eXCHANGERATE;
  //   data['AMOUNT_IN_AED'] = aMOUNTINAED;
  //   data['CUST_PO'] = cUSTPO;
  //   data['CREATED_BY'] = cREATEDBY;
  //   data['ORGANIZATION_NAME'] = oRGANIZATIONNAME;
  //   data['ORGANIZATION_ID'] = oRGANIZATIONID;
  //   data['TRX_NUMBER'] = tRXNUMBER;
  //   data['TRX_DATE'] = tRXDATE;
  //   data['DELIVERY_NAME'] = dELIVERYNAME;
  //   data['DELIVERY_DATE'] = dELIVERYDATE;
  //   data['UNIT_COST'] = uNITCOST;
  //   data['LAST_UPDATE_DATE'] = lASTUPDATEDATE;
  //   data['ORIGINAL_ORDER'] = oRIGINALORDER;
  //   data['ORIGINAL_ORDER_ID'] = oRIGINALORDERID;
  //   data['ORIGINAL_ORDER_LINE_ID'] = oRIGINALORDERLINEID;
  //   return data;
  // }
}
