// ignore_for_file: camel_case_types

class profile {
  dynamic customerId;
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  dynamic password;
  dynamic phone;
  dynamic cUSTSTATUS;
  dynamic deleted;
  dynamic cUSTOMERCREATIONDATE;
  dynamic cUSTOMERUPDATEDATE;
  dynamic dOB;
  dynamic istaxexempt;
  dynamic cUSTOMERNAME;
  dynamic rEMARKS1;
  dynamic storeId;
  dynamic cUSTOMERNUMBER;
  dynamic eAUTOCUSTOMERID;
  dynamic eAUTOCUSTNUMBER;
  dynamic eAUTOCUSTOMERNAME;
  dynamic eAUTOLOCATIONID;
  dynamic tERMID;
  dynamic tERMNAME;
  dynamic tERMDESCRIPTION;
  dynamic tAXNUMBER;
  dynamic tAXCODE;
  dynamic tAXNAME;
  dynamic tAXREGIMECODE;
  dynamic cREDITHOLDSTATUS;
  dynamic tERRITORY;
  dynamic tERRITORYID;
  dynamic pRIMARYSALESREPID;
  dynamic sALESPERSON;
  dynamic existingCustomer;
  dynamic tRADELICENCENO;
  dynamic cUSTOMERSECTOR;
  dynamic cUSTOMERTYPE;

  profile(
      {this.customerId,
      this.firstName,
      this.lastName,
      this.email,
      this.password,
      this.phone,
      this.cUSTSTATUS,
      this.deleted,
      this.cUSTOMERCREATIONDATE,
      this.cUSTOMERUPDATEDATE,
      this.dOB,
      this.istaxexempt,
      this.cUSTOMERNAME,
      this.rEMARKS1,
      this.storeId,
      this.cUSTOMERNUMBER,
      this.eAUTOCUSTOMERID,
      this.eAUTOCUSTNUMBER,
      this.eAUTOCUSTOMERNAME,
      this.eAUTOLOCATIONID,
      this.tERMID,
      this.tERMNAME,
      this.tERMDESCRIPTION,
      this.tAXNUMBER,
      this.tAXCODE,
      this.tAXNAME,
      this.tAXREGIMECODE,
      this.cREDITHOLDSTATUS,
      this.tERRITORY,
      this.tERRITORYID,
      this.pRIMARYSALESREPID,
      this.sALESPERSON,
      this.existingCustomer,
      this.tRADELICENCENO,
      this.cUSTOMERSECTOR,
      this.cUSTOMERTYPE});

  profile.fromJson(dynamic json) {
    customerId = json['Customer_Id'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    password = json['Password'];
    phone = json['Phone'];
    cUSTSTATUS = json['CUST_STATUS'];
    deleted = json['Deleted'];
    cUSTOMERCREATIONDATE = json['CUSTOMER_CREATION_DATE'];
    cUSTOMERUPDATEDATE = json['CUSTOMER_UPDATE_DATE'];
    dOB = json['DOB'];
    istaxexempt = json['Istaxexempt'];
    cUSTOMERNAME = json['CUSTOMER_NAME'];
    rEMARKS1 = json['REMARKS1'];
    storeId = json['Store_Id'];
    cUSTOMERNUMBER = json['CUSTOMER_NUMBER'];
    eAUTOCUSTOMERID = json['EAUTO_CUSTOMERID'];
    eAUTOCUSTNUMBER = json['EAUTO_CUST_NUMBER'];
    eAUTOCUSTOMERNAME = json['EAUTO_CUSTOMER_NAME'];
    eAUTOLOCATIONID = json['EAUTO_LOCATION_ID'];
    tERMID = json['TERM_ID'];
    tERMNAME = json['TERM_NAME'];
    tERMDESCRIPTION = json['TERM_DESCRIPTION'];
    tAXNUMBER = json['TAX_NUMBER'];
    tAXCODE = json['TAX_CODE'];
    tAXNAME = json['TAX_NAME'];
    tAXREGIMECODE = json['TAX_REGIME_CODE'];
    cREDITHOLDSTATUS = json['CREDIT_HOLD_STATUS'];
    tERRITORY = json['TERRITORY'];
    tERRITORYID = json['TERRITORY_ID'];
    pRIMARYSALESREPID = json['PRIMARY_SALESREP_ID'];
    sALESPERSON = json['SALES_PERSON'];
    existingCustomer = json['Existing_Customer'];
    tRADELICENCENO = json['TRADE_LICENCE_NO'];
    cUSTOMERSECTOR = json['CUSTOMER_SECTOR'];
    cUSTOMERTYPE = json['CUSTOMER_TYPE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['Customer_Id'] = customerId;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Password'] = password;
    data['Phone'] = phone;
    data['CUST_STATUS'] = cUSTSTATUS;
    data['Deleted'] = deleted;
    data['CUSTOMER_CREATION_DATE'] = cUSTOMERCREATIONDATE;
    data['CUSTOMER_UPDATE_DATE'] = cUSTOMERUPDATEDATE;
    data['DOB'] = dOB;
    data['Istaxexempt'] = istaxexempt;
    data['CUSTOMER_NAME'] = cUSTOMERNAME;
    data['REMARKS1'] = rEMARKS1;
    data['Store_Id'] = storeId;
    data['CUSTOMER_NUMBER'] = cUSTOMERNUMBER;
    data['EAUTO_CUSTOMERID'] = eAUTOCUSTOMERID;
    data['EAUTO_CUST_NUMBER'] = eAUTOCUSTNUMBER;
    data['EAUTO_CUSTOMER_NAME'] = eAUTOCUSTOMERNAME;
    data['EAUTO_LOCATION_ID'] = eAUTOLOCATIONID;
    data['TERM_ID'] = tERMID;
    data['TERM_NAME'] = tERMNAME;
    data['TERM_DESCRIPTION'] = tERMDESCRIPTION;
    data['TAX_NUMBER'] = tAXNUMBER;
    data['TAX_CODE'] = tAXCODE;
    data['TAX_NAME'] = tAXNAME;
    data['TAX_REGIME_CODE'] = tAXREGIMECODE;
    data['CREDIT_HOLD_STATUS'] = cREDITHOLDSTATUS;
    data['TERRITORY'] = tERRITORY;
    data['TERRITORY_ID'] = tERRITORYID;
    data['PRIMARY_SALESREP_ID'] = pRIMARYSALESREPID;
    data['SALES_PERSON'] = sALESPERSON;
    data['Existing_Customer'] = existingCustomer;
    data['TRADE_LICENCE_NO'] = tRADELICENCENO;
    data['CUSTOMER_SECTOR'] = cUSTOMERSECTOR;
    data['CUSTOMER_TYPE'] = cUSTOMERTYPE;
    return data;
  }

}

