class Contactapi {
  List<Contacts>? contacts;

  Contactapi({this.contacts});

  Contactapi.fromJson(dynamic json) {
    if (json != null) {
      contacts = <Contacts>[];
      json.forEach((v) {
        contacts!.add(Contacts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (contacts != null) {
      data['contacts'] = contacts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Contacts {
  dynamic contactId;
  dynamic customerID;
  String? firstName;
  String? lastName;
  dynamic sITECONTACTPERSONEMAIL;
  String? password;
  dynamic sITECONTACTPERSONPHONE;
  dynamic adminComment;
  dynamic isActive;
  dynamic sITECONTACTPERLASTUPDDATE;
  dynamic updatedBy;
  dynamic createdBy;
  String? createdAt;

  Contacts(
      {this.contactId,
      this.customerID,
      this.firstName,
      this.lastName,
      this.sITECONTACTPERSONEMAIL,
      this.password,
      this.sITECONTACTPERSONPHONE,
      this.adminComment,
      this.isActive,
      this.sITECONTACTPERLASTUPDDATE,
      this.updatedBy,
      this.createdBy,
      this.createdAt});

  Contacts.fromJson(Map<String, dynamic> json) {
    contactId = json['ContactId'];
    customerID = json['Customer_ID'];
    firstName = json['FirstName'];
    lastName = json['LastName'];
    sITECONTACTPERSONEMAIL = json['SITE_CONTACT_PERSON_EMAIL'];
    password = json['Password'];
    sITECONTACTPERSONPHONE = json['SITE_CONTACT_PERSON_PHONE'];
    adminComment = json['AdminComment'];
    isActive = json['IsActive'];
    sITECONTACTPERLASTUPDDATE = json['SITE_CONTACT_PER_LAST_UPD_DATE'];
    updatedBy = json['UpdatedBy'];
    createdBy = json['CreatedBy'];
    createdAt = json['CreatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ContactId'] = contactId;
    data['Customer_ID'] = customerID;
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['SITE_CONTACT_PERSON_EMAIL'] = sITECONTACTPERSONEMAIL;
    data['Password'] = password;
    data['SITE_CONTACT_PERSON_PHONE'] = sITECONTACTPERSONPHONE;
    data['AdminComment'] = adminComment;
    data['IsActive'] = isActive;
    data['SITE_CONTACT_PER_LAST_UPD_DATE'] = sITECONTACTPERLASTUPDDATE;
    data['UpdatedBy'] = updatedBy;
    data['CreatedBy'] = createdBy;
    data['CreatedAt'] = createdAt;
    return data;
  }
}
