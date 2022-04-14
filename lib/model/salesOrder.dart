// ignore_for_file: camel_case_types

class salesOrderApi {
  List<Data>? data;

  salesOrderApi({this.data});

  salesOrderApi.fromJson(dynamic json) {
    if (json != null) {
      data = <Data>[];
      for (var v in (json as List)) {
        data!.add(Data.fromJson(v));
      }
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (this.data != null) {
  //     data['data'] = this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Data {
  int? orderId;
  int? oORDERID;
  dynamic oRGID;
  int? storeID;
  String? storeName;
  int? oRDERTYPEID;
  String? oRDERTYPE;
  String? oRDERCATEGORY;
  String? oRDERNUMBER;
  String? oRDERSTATUS;
  String? oRDEREDDATE;
  String? cREATIONDATE;
  String? cREATEDBY;
  String? cUSTPONUMBER;
  dynamic cUSTOMERID;
  int? ecommCUSTOMERID;
  String? cUSTOMERNAME;
  dynamic bILLTOSITEUSEID;
  dynamic sHIPTOSITEUSEID;
  int? sALESREPID;
  String? sALESPEROSN;
  int? pAYMENTTERMID;
  String? term;
  dynamic pRICELISTID;
  dynamic cONTRACTTYPE;
  dynamic eSTIMATEDCOST;
  String? pACKINGINSTRUCTIONS;
  String? oRDERAMOUNT;
  String? tAXAMOUNT;
  String? tOTALAMOUNT;
  String? cURRENCYCODE;
  String? cONVERSIONRATE;
  String? lASTUPDATEDATE;
  dynamic bADDRESS1;
  dynamic bADDRESS2;
  dynamic bADDRESS3;
  dynamic bCITY;
  dynamic bCOUNTRY;
  dynamic bPOSTALCODE;
  dynamic sADDRESS1;
  dynamic sADDRESS2;
  dynamic sADDRESS3;
  dynamic sCITY;
  dynamic sCOUNTRY;
  dynamic sPOSTALCODE;

  Data(
      {this.orderId,
      this.oORDERID,
      this.oRGID,
      this.storeID,
      this.storeName,
      this.oRDERTYPEID,
      this.oRDERTYPE,
      this.oRDERCATEGORY,
      this.oRDERNUMBER,
      this.oRDERSTATUS,
      this.oRDEREDDATE,
      this.cREATIONDATE,
      this.cREATEDBY,
      this.cUSTPONUMBER,
      this.cUSTOMERID,
      this.ecommCUSTOMERID,
      this.cUSTOMERNAME,
      this.bILLTOSITEUSEID,
      this.sHIPTOSITEUSEID,
      this.sALESREPID,
      this.sALESPEROSN,
      this.pAYMENTTERMID,
      this.term,
      this.pRICELISTID,
      this.cONTRACTTYPE,
      this.eSTIMATEDCOST,
      this.pACKINGINSTRUCTIONS,
      this.oRDERAMOUNT,
      this.tAXAMOUNT,
      this.tOTALAMOUNT,
      this.cURRENCYCODE,
      this.cONVERSIONRATE,
      this.lASTUPDATEDATE,
      this.bADDRESS1,
      this.bADDRESS2,
      this.bADDRESS3,
      this.bCITY,
      this.bCOUNTRY,
      this.bPOSTALCODE,
      this.sADDRESS1,
      this.sADDRESS2,
      this.sADDRESS3,
      this.sCITY,
      this.sCOUNTRY,
      this.sPOSTALCODE});

  Data.fromJson(dynamic json) {
    orderId = json['Order_Id'];
    oORDERID = json['O_ORDER_ID'];
    oRGID = json['ORG_ID'];
    storeID = json['Store_ID'];
    storeName = json['StoreName'];
    oRDERTYPEID = json['ORDER_TYPE_ID'];
    oRDERTYPE = json['ORDER_TYPE'];
    oRDERCATEGORY = json['ORDER_CATEGORY'];
    oRDERNUMBER = json['ORDER_NUMBER'];
    oRDERSTATUS = json['ORDER_STATUS'];
    oRDEREDDATE = json['ORDERED_DATE'];
    cREATIONDATE = json['CREATION_DATE'];
    cREATEDBY = json['CREATED_BY'];
    cUSTPONUMBER = json['CUST_PO_NUMBER'];
    cUSTOMERID = json['CUSTOMER_ID'];
    ecommCUSTOMERID = json['Ecomm_CUSTOMER_ID'];
    cUSTOMERNAME = json['CUSTOMER_NAME'];
    bILLTOSITEUSEID = json['BILL_TO_SITE_USE_ID'];
    sHIPTOSITEUSEID = json['SHIP_TO_SITE_USE_ID'];
    sALESREPID = json['SALESREP_ID'];
    sALESPEROSN = json['SALESPEROSN'];
    pAYMENTTERMID = json['PAYMENT_TERM_ID'];
    term = json['Term'];
    pRICELISTID = json['PRICE_LIST_ID'];
    cONTRACTTYPE = json['CONTRACT_TYPE'];
    eSTIMATEDCOST = json['ESTIMATED_COST'];
    pACKINGINSTRUCTIONS = json['PACKING_INSTRUCTIONS'];
    oRDERAMOUNT = json['ORDER_AMOUNT'];
    tAXAMOUNT = json['TAX_AMOUNT'];
    tOTALAMOUNT = json['TOTAL_AMOUNT'];
    cURRENCYCODE = json['CURRENCY_CODE'];
    cONVERSIONRATE = json['CONVERSION_RATE'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    bADDRESS1 = json['B_ADDRESS1'];
    bADDRESS2 = json['B_ADDRESS2'];
    bADDRESS3 = json['B_ADDRESS3'];
    bCITY = json['B_CITY'];
    bCOUNTRY = json['B_COUNTRY'];
    bPOSTALCODE = json['B_POSTAL_CODE'];
    sADDRESS1 = json['S_ADDRESS1'];
    sADDRESS2 = json['S_ADDRESS2'];
    sADDRESS3 = json['S_ADDRESS3'];
    sCITY = json['S_CITY'];
    sCOUNTRY = json['S_COUNTRY'];
    sPOSTALCODE = json['S_POSTAL_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Order_Id'] = orderId;
    data['O_ORDER_ID'] = oORDERID;
    data['ORG_ID'] = oRGID;
    data['Store_ID'] = storeID;
    data['StoreName'] = storeName;
    data['ORDER_TYPE_ID'] = oRDERTYPEID;
    data['ORDER_TYPE'] = oRDERTYPE;
    data['ORDER_CATEGORY'] = oRDERCATEGORY;
    data['ORDER_NUMBER'] = oRDERNUMBER;
    data['ORDER_STATUS'] = oRDERSTATUS;
    data['ORDERED_DATE'] = oRDEREDDATE;
    data['CREATION_DATE'] = cREATIONDATE;
    data['CREATED_BY'] = cREATEDBY;
    data['CUST_PO_NUMBER'] = cUSTPONUMBER;
    data['CUSTOMER_ID'] = cUSTOMERID;
    data['Ecomm_CUSTOMER_ID'] = ecommCUSTOMERID;
    data['CUSTOMER_NAME'] = cUSTOMERNAME;
    data['BILL_TO_SITE_USE_ID'] = bILLTOSITEUSEID;
    data['SHIP_TO_SITE_USE_ID'] = sHIPTOSITEUSEID;
    data['SALESREP_ID'] = sALESREPID;
    data['SALESPEROSN'] = sALESPEROSN;
    data['PAYMENT_TERM_ID'] = pAYMENTTERMID;
    data['Term'] = term;
    data['PRICE_LIST_ID'] = pRICELISTID;
    data['CONTRACT_TYPE'] = cONTRACTTYPE;
    data['ESTIMATED_COST'] = eSTIMATEDCOST;
    data['PACKING_INSTRUCTIONS'] = pACKINGINSTRUCTIONS;
    data['ORDER_AMOUNT'] = oRDERAMOUNT;
    data['TAX_AMOUNT'] = tAXAMOUNT;
    data['TOTAL_AMOUNT'] = tOTALAMOUNT;
    data['CURRENCY_CODE'] = cURRENCYCODE;
    data['CONVERSION_RATE'] = cONVERSIONRATE;
    data['LAST_UPDATE_DATE'] = lASTUPDATEDATE;
    data['B_ADDRESS1'] = bADDRESS1;
    data['B_ADDRESS2'] = bADDRESS2;
    data['B_ADDRESS3'] = bADDRESS3;
    data['B_CITY'] = bCITY;
    data['B_COUNTRY'] = bCOUNTRY;
    data['B_POSTAL_CODE'] = bPOSTALCODE;
    data['S_ADDRESS1'] = sADDRESS1;
    data['S_ADDRESS2'] = sADDRESS2;
    data['S_ADDRESS3'] = sADDRESS3;
    data['S_CITY'] = sCITY;
    data['S_COUNTRY'] = sCOUNTRY;
    data['S_POSTAL_CODE'] = sPOSTALCODE;
    return data;
  }
}
