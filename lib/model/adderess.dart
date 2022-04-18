// ignore_for_file: unrelated_type_equality_checks, avoid_types_as_parameter_names, non_constant_identifier_names

class address {
  // Map<String, dynamic>? addresses = {};
  List<Addresses>? addresses;

  address({this.addresses});

  address.fromJson(dynamic json) {
    if (json != null) {
      addresses = [];
      json.forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
  }
}

class Addresses {
  dynamic customerAddressId;
  dynamic customerId;
  bool? isDefault;
  String? firstName;
  String? lastName;
  String? email;
  String? company;
  String? cOUNTRY;
  dynamic sTATE;
  String? cITY;
  dynamic street;
  dynamic apartment;
  String? pOSTALCODE;
  String? phoneNumber;
  String? aDDRESS1;
  String? aDDRESS2;
  String? aDDRESS3;
  String? sITECODE;
  dynamic sITEUSEID;
  String? sITEUSESTATUS;
  dynamic lOCATIONID;
  String? lOCATIONCODE;
  String? cUSTOMERNUMBER;
  String? cUSTSITEUSESUPDATEDATE;
  String? sITEUSECODE;
  bool? existingCustomer;
  String? companyWebsite;
  String? oCUSTSTATUS;
  dynamic cREDITLIMIT;
  dynamic cREDITHOLD;
  dynamic cREDITCHECK;
  dynamic cOLLECTOR;
  dynamic eAUTOLOCATIONID;
  dynamic rEMARKS1;
  String? address;

  Addresses(
      {this.customerAddressId,
      this.customerId,
      this.isDefault,
      this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.cOUNTRY,
      this.sTATE,
      this.cITY,
      this.street,
      this.apartment,
      this.pOSTALCODE,
      this.phoneNumber,
      this.aDDRESS1,
      this.aDDRESS2,
      this.aDDRESS3,
      this.sITECODE,
      this.sITEUSEID,
      this.sITEUSESTATUS,
      this.lOCATIONID,
      this.lOCATIONCODE,
      this.cUSTOMERNUMBER,
      this.cUSTSITEUSESUPDATEDATE,
      this.sITEUSECODE,
      this.existingCustomer,
      this.companyWebsite,
      this.oCUSTSTATUS,
      this.cREDITLIMIT,
      this.cREDITHOLD,
      this.cREDITCHECK,
      this.cOLLECTOR,
      this.eAUTOLOCATIONID,
      this.rEMARKS1,
      this.address});

  

  factory Addresses.fromJson(dynamic json) {
    return Addresses(
      customerAddressId: json['CustomerAddress_Id'],
      customerId: json['CustomerId'],
      isDefault: json['IsDefault'],
      firstName: json['FirstName'],
      lastName: json['LastName'],
      email: json['Email'],
      company: json['Company'],
      cOUNTRY: json['COUNTRY'],
      sTATE: json['STATE'],
      cITY: json['CITY'],
      street: json['Street'],
      apartment: json['Apartment'],
      pOSTALCODE: json['POSTAL_CODE'],
      phoneNumber: json['PhoneNumber'],
      aDDRESS1: json['ADDRESS1'],
      aDDRESS2: json['ADDRESS2'],
      aDDRESS3: json['ADDRESS3'],
      sITECODE: json['SITE_CODE'],
      sITEUSEID: json['SITE_USE_ID'],
      sITEUSESTATUS: json['SITE_USE_STATUS'],
      lOCATIONID: json['LOCATION_ID'],
      lOCATIONCODE: json['LOCATION_CODE'],
      cUSTOMERNUMBER: json['CUSTOMER_NUMBER'],
      cUSTSITEUSESUPDATEDATE: json['CUST_SITE_USES_UPDATE_DATE'],
      sITEUSECODE: json['SITE_USE_CODE'],
      existingCustomer: json['Existing_Customer'],
      companyWebsite: json['Company_Website'],
      oCUSTSTATUS: json['O_CUST_STATUS'],
      cREDITLIMIT: json['CREDIT_LIMIT'],
      cREDITHOLD: json['CREDIT_HOLD'],
      cREDITCHECK: json['CREDIT_CHECK'],
      cOLLECTOR: json['COLLECTOR'],
      eAUTOLOCATIONID: json['EAUTO_LOCATION_ID'],
      rEMARKS1: json['REMARKS1'],
      address: json['Address'],
    );
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['CustomerAddress_Id'] = customerAddressId;
  //   data['CustomerId'] = customerId;
  //   data['IsDefault'] = isDefault;
  //   data['FirstName'] = firstName;
  //   data['LastName'] = lastName;
  //   data['Email'] = email;
  //   data['Company'] = company;
  //   data['COUNTRY'] = cOUNTRY;
  //   data['STATE'] = sTATE;
  //   data['CITY'] = cITY;
  //   data['Street'] = street;
  //   data['Apartment'] = apartment;
  //   data['POSTAL_CODE'] = pOSTALCODE;
  //   data['PhoneNumber'] = phoneNumber;
  //   data['ADDRESS1'] = aDDRESS1;
  //   data['ADDRESS2'] = aDDRESS2;
  //   data['ADDRESS3'] = aDDRESS3;
  //   data['SITE_CODE'] = sITECODE;
  //   data['SITE_USE_ID'] = sITEUSEID;
  //   data['SITE_USE_STATUS'] = sITEUSESTATUS;
  //   data['LOCATION_ID'] = lOCATIONID;
  //   data['LOCATION_CODE'] = lOCATIONCODE;
  //   data['CUSTOMER_NUMBER'] = cUSTOMERNUMBER;
  //   data['CUST_SITE_USES_UPDATE_DATE'] = cUSTSITEUSESUPDATEDATE;
  //   data['SITE_USE_CODE'] = sITEUSECODE;
  //   data['Existing_Customer'] = existingCustomer;
  //   data['Company_Website'] = companyWebsite;
  //   data['O_CUST_STATUS'] = oCUSTSTATUS;
  //   data['CREDIT_LIMIT'] = cREDITLIMIT;
  //   data['CREDIT_HOLD'] = cREDITHOLD;
  //   data['CREDIT_CHECK'] = cREDITCHECK;
  //   data['COLLECTOR'] = cOLLECTOR;
  //   data['EAUTO_LOCATION_ID'] = eAUTOLOCATIONID;
  //   data['REMARKS1'] = rEMARKS1;
  //   data['Address'] = address;
  //   return data;
  // }
}
