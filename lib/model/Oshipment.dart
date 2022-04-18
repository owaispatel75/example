class Shipment {
  List<OShipment>? oShipment;

  Shipment({this.oShipment});

  Shipment.fromJson(dynamic json) {
    if (json != null) {
      oShipment = [];
      json.forEach((v) {
        oShipment!.add(OShipment.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (oShipment != null) {
  //     data['O_Shipment'] = oShipment!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class OShipment {
  dynamic dELIVERYID;
  dynamic oDELIVERYID;
  String? dELIERYNAME;
  String? sTATUSNAME;
  String? iNITIALPICKUPDATE;
  String? uLTIMATEDROPOFFDATE;
  String? aCCEPTEDDATE;
  String? cONFIRMDATE;
  String? cREATIONDATE;
  String? lASTUPDATEDATE;
  String? eARLIESTPICKUPDATE;
  dynamic oRGANIZATIONID;
  dynamic cURRENCYCODE;
  dynamic iNITIALPICKUPLOCATIONID;
  dynamic uLTIMATEDROPOFFLOCATIONID;
  dynamic eCOMCUSTOMERID;
  dynamic cUSTOMERID;
  String? cUSTOMERNAME;
  String? shipToAddress;
  dynamic oRGID;
  dynamic sTOREID;
  List<OShipmentline>? oShipmentline;

  OShipment(
      {this.dELIVERYID,
      this.oDELIVERYID,
      this.dELIERYNAME,
      this.sTATUSNAME,
      this.iNITIALPICKUPDATE,
      this.uLTIMATEDROPOFFDATE,
      this.aCCEPTEDDATE,
      this.cONFIRMDATE,
      this.cREATIONDATE,
      this.lASTUPDATEDATE,
      this.eARLIESTPICKUPDATE,
      this.oRGANIZATIONID,
      this.cURRENCYCODE,
      this.iNITIALPICKUPLOCATIONID,
      this.uLTIMATEDROPOFFLOCATIONID,
      this.eCOMCUSTOMERID,
      this.cUSTOMERID,
      this.cUSTOMERNAME,
      this.shipToAddress,
      this.oRGID,
      this.sTOREID,
      this.oShipmentline});

  OShipment.fromJson(dynamic json) {
    dELIVERYID = json['DELIVERY_ID'];
    oDELIVERYID = json['O_DELIVERY_ID'];
    dELIERYNAME = json['DELIERY_NAME'];
    sTATUSNAME = json['STATUS_NAME'];
    iNITIALPICKUPDATE = json['INITIAL_PICKUP_DATE'];
    uLTIMATEDROPOFFDATE = json['ULTIMATE_DROPOFF_DATE'];
    aCCEPTEDDATE = json['ACCEPTED_DATE'];
    cONFIRMDATE = json['CONFIRM_DATE'];
    cREATIONDATE = json['CREATION_DATE'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    eARLIESTPICKUPDATE = json['EARLIEST_PICKUP_DATE'];
    oRGANIZATIONID = json['ORGANIZATION_ID'];
    cURRENCYCODE = json['CURRENCY_CODE'];
    iNITIALPICKUPLOCATIONID = json['INITIAL_PICKUP_LOCATION_ID'];
    uLTIMATEDROPOFFLOCATIONID = json['ULTIMATE_DROPOFF_LOCATION_ID'];
    eCOMCUSTOMERID = json['ECOM_CUSTOMER_ID'];
    cUSTOMERID = json['CUSTOMER_ID'];
    cUSTOMERNAME = json['CUSTOMER_NAME'];
    shipToAddress = json['Ship_To_Address'];
    oRGID = json['ORG_ID'];
    sTOREID = json['STORE_ID'];
    if (json['O_Shipmentline'] != null) {
      oShipmentline = <OShipmentline>[];
      json['O_Shipmentline'].forEach((v) {
        oShipmentline!.add(OShipmentline.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DELIVERY_ID'] = dELIVERYID;
    data['O_DELIVERY_ID'] = oDELIVERYID;
    data['DELIERY_NAME'] = dELIERYNAME;
    data['STATUS_NAME'] = sTATUSNAME;
    data['INITIAL_PICKUP_DATE'] = iNITIALPICKUPDATE;
    data['ULTIMATE_DROPOFF_DATE'] = uLTIMATEDROPOFFDATE;
    data['ACCEPTED_DATE'] = aCCEPTEDDATE;
    data['CONFIRM_DATE'] = cONFIRMDATE;
    data['CREATION_DATE'] = cREATIONDATE;
    data['LAST_UPDATE_DATE'] = lASTUPDATEDATE;
    data['EARLIEST_PICKUP_DATE'] = eARLIESTPICKUPDATE;
    data['ORGANIZATION_ID'] = oRGANIZATIONID;
    data['CURRENCY_CODE'] = cURRENCYCODE;
    data['INITIAL_PICKUP_LOCATION_ID'] = iNITIALPICKUPLOCATIONID;
    data['ULTIMATE_DROPOFF_LOCATION_ID'] = uLTIMATEDROPOFFLOCATIONID;
    data['ECOM_CUSTOMER_ID'] = eCOMCUSTOMERID;
    data['CUSTOMER_ID'] = cUSTOMERID;
    data['CUSTOMER_NAME'] = cUSTOMERNAME;
    data['Ship_To_Address'] = shipToAddress;
    data['ORG_ID'] = oRGID;
    data['STORE_ID'] = sTOREID;
    if (oShipmentline != null) {
      data['O_Shipmentline'] = oShipmentline!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OShipmentline {
  dynamic dELIVERYID;
  dynamic oDELIVERYID;
  String? dELIERYNAME;
  dynamic dELIVERYDETAILID;
  dynamic dELIVERYLINEID;
  String? sOURCENAME;
  dynamic sOURCEHEADERID;
  dynamic sOURCELINEID;
  String? sOURCEHEADERNUMBER;
  dynamic sOURCEHEADERTYPEID;
  String? sOURCEHEADERTYPENAME;
  String? sOURCELINENUMBER;
  String? sRCREQUESTEDQUANTITY;
  String? rEQUESTEDQUANTITY;
  String? sHIPPEDQUANTITY;
  String? pICKEDQUANTITY;
  dynamic dELIVEREDQUANTITY;
  dynamic cANCELLEDQUANTITY;
  String? cURRENCYCODE;
  String? uNITPRICE;
  String? sRCREQUESTEDQUANTITYUOM;
  dynamic cUSTOMERID;
  dynamic iNVENTORYITEMID;
  String? itemCode;
  String? iTEMDESCRIPTION;
  dynamic sHIPFROMLOCATIONID;
  dynamic sHIPTOLOCATIONID;
  dynamic dELIVERTOLOCATIONID;
  String? dATEREQUESTED;
  String? cREATIONDATE;
  String? lASTUPDATEDATE;
  dynamic lOTNUMBER;
  String? sERIALNUMBER;
  dynamic oRGANIZATIONID;
  String? cUSTPONUMBER;
  dynamic oRGID;
  dynamic storeId;

  OShipmentline(
      {this.dELIVERYID,
      this.oDELIVERYID,
      this.dELIERYNAME,
      this.dELIVERYDETAILID,
      this.dELIVERYLINEID,
      this.sOURCENAME,
      this.sOURCEHEADERID,
      this.sOURCELINEID,
      this.sOURCEHEADERNUMBER,
      this.sOURCEHEADERTYPEID,
      this.sOURCEHEADERTYPENAME,
      this.sOURCELINENUMBER,
      this.sRCREQUESTEDQUANTITY,
      this.rEQUESTEDQUANTITY,
      this.sHIPPEDQUANTITY,
      this.pICKEDQUANTITY,
      this.dELIVEREDQUANTITY,
      this.cANCELLEDQUANTITY,
      this.cURRENCYCODE,
      this.uNITPRICE,
      this.sRCREQUESTEDQUANTITYUOM,
      this.cUSTOMERID,
      this.iNVENTORYITEMID,
      this.itemCode,
      this.iTEMDESCRIPTION,
      this.sHIPFROMLOCATIONID,
      this.sHIPTOLOCATIONID,
      this.dELIVERTOLOCATIONID,
      this.dATEREQUESTED,
      this.cREATIONDATE,
      this.lASTUPDATEDATE,
      this.lOTNUMBER,
      this.sERIALNUMBER,
      this.oRGANIZATIONID,
      this.cUSTPONUMBER,
      this.oRGID,
      this.storeId});

  OShipmentline.fromJson(Map<String, dynamic> json) {
    dELIVERYID = json['DELIVERY_ID'];
    oDELIVERYID = json['O_DELIVERY_ID'];
    dELIERYNAME = json['DELIERY_NAME'];
    dELIVERYDETAILID = json['DELIVERY_DETAIL_ID'];
    dELIVERYLINEID = json['DELIVERY_LINE_ID'];
    sOURCENAME = json['SOURCE_NAME'];
    sOURCEHEADERID = json['SOURCE_HEADER_ID'];
    sOURCELINEID = json['SOURCE_LINE_ID'];
    sOURCEHEADERNUMBER = json['SOURCE_HEADER_NUMBER'];
    sOURCEHEADERTYPEID = json['SOURCE_HEADER_TYPE_ID'];
    sOURCEHEADERTYPENAME = json['SOURCE_HEADER_TYPE_NAME'];
    sOURCELINENUMBER = json['SOURCE_LINE_NUMBER'];
    sRCREQUESTEDQUANTITY = json['SRC_REQUESTED_QUANTITY'];
    rEQUESTEDQUANTITY = json['REQUESTED_QUANTITY'];
    sHIPPEDQUANTITY = json['SHIPPED_QUANTITY'];
    pICKEDQUANTITY = json['PICKED_QUANTITY'];
    dELIVEREDQUANTITY = json['DELIVERED_QUANTITY'];
    cANCELLEDQUANTITY = json['CANCELLED_QUANTITY'];
    cURRENCYCODE = json['CURRENCY_CODE'];
    uNITPRICE = json['UNIT_PRICE'];
    sRCREQUESTEDQUANTITYUOM = json['SRC_REQUESTED_QUANTITY_UOM'];
    cUSTOMERID = json['CUSTOMER_ID'];
    iNVENTORYITEMID = json['INVENTORY_ITEM_ID'];
    itemCode = json['Item_Code'];
    iTEMDESCRIPTION = json['ITEM_DESCRIPTION'];
    sHIPFROMLOCATIONID = json['SHIP_FROM_LOCATION_ID'];
    sHIPTOLOCATIONID = json['SHIP_TO_LOCATION_ID'];
    dELIVERTOLOCATIONID = json['DELIVER_TO_LOCATION_ID'];
    dATEREQUESTED = json['DATE_REQUESTED'];
    cREATIONDATE = json['CREATION_DATE'];
    lASTUPDATEDATE = json['LAST_UPDATE_DATE'];
    lOTNUMBER = json['LOT_NUMBER'];
    sERIALNUMBER = json['SERIAL_NUMBER'];
    oRGANIZATIONID = json['ORGANIZATION_ID'];
    cUSTPONUMBER = json['CUST_PO_NUMBER'];
    oRGID = json['ORG_ID'];
    storeId = json['Store_Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['DELIVERY_ID'] = dELIVERYID;
    data['O_DELIVERY_ID'] = oDELIVERYID;
    data['DELIERY_NAME'] = dELIERYNAME;
    data['DELIVERY_DETAIL_ID'] = dELIVERYDETAILID;
    data['DELIVERY_LINE_ID'] = dELIVERYLINEID;
    data['SOURCE_NAME'] = sOURCENAME;
    data['SOURCE_HEADER_ID'] = sOURCEHEADERID;
    data['SOURCE_LINE_ID'] = sOURCELINEID;
    data['SOURCE_HEADER_NUMBER'] = sOURCEHEADERNUMBER;
    data['SOURCE_HEADER_TYPE_ID'] = sOURCEHEADERTYPEID;
    data['SOURCE_HEADER_TYPE_NAME'] = sOURCEHEADERTYPENAME;
    data['SOURCE_LINE_NUMBER'] = sOURCELINENUMBER;
    data['SRC_REQUESTED_QUANTITY'] = sRCREQUESTEDQUANTITY;
    data['REQUESTED_QUANTITY'] = rEQUESTEDQUANTITY;
    data['SHIPPED_QUANTITY'] = sHIPPEDQUANTITY;
    data['PICKED_QUANTITY'] = pICKEDQUANTITY;
    data['DELIVERED_QUANTITY'] = dELIVEREDQUANTITY;
    data['CANCELLED_QUANTITY'] = cANCELLEDQUANTITY;
    data['CURRENCY_CODE'] = cURRENCYCODE;
    data['UNIT_PRICE'] = uNITPRICE;
    data['SRC_REQUESTED_QUANTITY_UOM'] = sRCREQUESTEDQUANTITYUOM;
    data['CUSTOMER_ID'] = cUSTOMERID;
    data['INVENTORY_ITEM_ID'] = iNVENTORYITEMID;
    data['Item_Code'] = itemCode;
    data['ITEM_DESCRIPTION'] = iTEMDESCRIPTION;
    data['SHIP_FROM_LOCATION_ID'] = sHIPFROMLOCATIONID;
    data['SHIP_TO_LOCATION_ID'] = sHIPTOLOCATIONID;
    data['DELIVER_TO_LOCATION_ID'] = dELIVERTOLOCATIONID;
    data['DATE_REQUESTED'] = dATEREQUESTED;
    data['CREATION_DATE'] = cREATIONDATE;
    data['LAST_UPDATE_DATE'] = lASTUPDATEDATE;
    data['LOT_NUMBER'] = lOTNUMBER;
    data['SERIAL_NUMBER'] = sERIALNUMBER;
    data['ORGANIZATION_ID'] = oRGANIZATIONID;
    data['CUST_PO_NUMBER'] = cUSTPONUMBER;
    data['ORG_ID'] = oRGID;
    data['Store_Id'] = storeId;
    return data;
  }
}
