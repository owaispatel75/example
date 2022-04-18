// ignore_for_file: unrelated_type_equality_checks

class orderapi {
  List<Orders>? orders;

  orderapi({this.orders});

  orderapi.fromJson(dynamic json) {
    if (json != null) {
      orders = <Orders>[] ;
      json.forEach((v) {
        orders!.add(Orders.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (orders != dynamic) {
      data['orders'] = orders!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Orders {
  dynamic orderId;
  dynamic orderNumber;
  String? orderDate;
  String? orderStatus;
  dynamic shippingCost;
  dynamic taxAmount;
  dynamic taxRatePercent;
  String? paymentStatus;
  List<Items>? items;
  dynamic totalItems;
  AdditionalLines? additionalLines;
  dynamic orderTotal;
  dynamic subTotal;
  String? paymentMethodSystemName;
  List<ShippingAddress>? shippingAddress;
  List<BillingAddress>? billingAddress;
  List<dynamic>? shipment;
  dynamic invoiceNumber;
  String? invoiceDate;

  Orders(
      {this.orderId,
      this.orderNumber,
      this.orderDate,
      this.orderStatus,
      this.shippingCost,
      this.taxAmount,
      this.taxRatePercent,
      this.paymentStatus,
      this.items,
      this.totalItems,
      this.additionalLines,
      this.orderTotal,
      this.subTotal,
      this.paymentMethodSystemName,
      this.shippingAddress,
      this.billingAddress,
      this.shipment,
      this.invoiceNumber,
      this.invoiceDate});

  Orders.fromJson(Map<String, dynamic> json) {
    orderId = json['Order_Id'];
    orderNumber = json['OrderNumber'];
    orderDate = json['OrderDate'];
    orderStatus = json['OrderStatus'];
    shippingCost = json['ShippingCost'];
    taxAmount = json['TaxAmount'];
    taxRatePercent = json['TaxRatePercent'];
    paymentStatus = json['PaymentStatus'];
    if (json['items'] != dynamic) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    totalItems = json['TotalItems'];
    // additionalLines = json['additionalLines'] != dynamic
    //     ? AdditionalLines.fromJson(json['additionalLines'])
    //     : dynamic;
    orderTotal = json['OrderTotal'];
    subTotal = json['SubTotal'];
    paymentMethodSystemName = json['PaymentMethodSystemName'];
    if (json['shippingAddress'] != dynamic) {
      shippingAddress = <ShippingAddress>[];
      json['shippingAddress'].forEach((v) {
        shippingAddress!.add(ShippingAddress.fromJson(v));
      });
    }
    if (json['billingAddress'] != dynamic) {
      billingAddress = <BillingAddress>[];
      json['billingAddress'].forEach((v) {
        billingAddress!.add(BillingAddress.fromJson(v));
      });
    }
    // if (json['shipment'] != dynamic) {
    //   shipment = [];
    //   json['shipment'].forEach((v) {
    //     shipment!.add(shipment.fromJson(v));
    //   });
    // }
    invoiceNumber = json['InvoiceNumber'];
    invoiceDate = json['InvoiceDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Order_Id'] = orderId;
    data['OrderNumber'] = orderNumber;
    data['OrderDate'] = orderDate;
    data['OrderStatus'] = orderStatus;
    data['ShippingCost'] = shippingCost;
    data['TaxAmount'] = taxAmount;
    data['TaxRatePercent'] = taxRatePercent;
    data['PaymentStatus'] = paymentStatus;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    data['TotalItems'] = totalItems;
    if (additionalLines != null) {
      data['additionalLines'] = additionalLines!.toJson();
    }
    data['OrderTotal'] = orderTotal;
    data['SubTotal'] = subTotal;
    data['PaymentMethodSystemName'] = paymentMethodSystemName;
    if (shippingAddress != null) {
      data['shippingAddress'] =
          shippingAddress!.map((v) => v.toJson()).toList();
    }
    if (billingAddress != null) {
      data['billingAddress'] =
          billingAddress!.map((v) => v.toJson()).toList();
    }
    // if (shipment != ) {
    //   data['shipment'] = shipment!.map((v) => v.toJson()).toList();
    // }
    data['InvoiceNumber'] = invoiceNumber;
    data['InvoiceDate'] = invoiceDate;
    return data;
  }
}

class Items {
  dynamic productId;
  String? slug;
  String? name;
  dynamic imagePath;
  String? oDESCRIPTION;
  dynamic price;
  dynamic quantity;
  dynamic total;

  Items(
      {this.productId,
      this.slug,
      this.name,
      this.imagePath,
      this.oDESCRIPTION,
      this.price,
      this.quantity,
      this.total});

  Items.fromJson(Map<String, dynamic> json) {
    productId = json['Product_Id'];
    slug = json['slug'];
    name = json['Name'];
    imagePath = json['ImagePath'];
    oDESCRIPTION = json['O_DESCRIPTION'];
    price = json['Price'];
    quantity = json['Quantity'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Product_Id'] = productId;
    data['slug'] = slug;
    data['Name'] = name;
    data['ImagePath'] = imagePath;
    data['O_DESCRIPTION'] = oDESCRIPTION;
    data['Price'] = price;
    data['Quantity'] = quantity;
    data['total'] = total;
    return data;
  }
}

class AdditionalLines {
  String? text;

  AdditionalLines({this.text});

  AdditionalLines.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}

class ShippingAddress {
  String? firstName;
  String? lastName;
  String? email;
  String? company;
  String? phoneNumber;
  String? cOUNTRY;
  dynamic sTATE;
  String? cITY;
  dynamic street;
  dynamic apartment;
  dynamic pOSTALCODE;
  String? sITEUSECODE;

  ShippingAddress(
      {this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.phoneNumber,
      this.cOUNTRY,
      this.sTATE,
      this.cITY,
      this.street,
      this.apartment,
      this.pOSTALCODE,
      this.sITEUSECODE});

  ShippingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    company = json['Company'];
    phoneNumber = json['PhoneNumber'];
    cOUNTRY = json['COUNTRY'];
    sTATE = json['STATE'];
    cITY = json['CITY'];
    street = json['Street'];
    apartment = json['Apartment'];
    pOSTALCODE = json['POSTAL_CODE'];
    sITEUSECODE = json['SITE_USE_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Company'] = company;
    data['PhoneNumber'] = phoneNumber;
    data['COUNTRY'] = cOUNTRY;
    data['STATE'] = sTATE;
    data['CITY'] = cITY;
    data['Street'] = street;
    data['Apartment'] = apartment;
    data['POSTAL_CODE'] = pOSTALCODE;
    data['SITE_USE_CODE'] = sITEUSECODE;
    return data;
  }
}

class BillingAddress {
  String? firstName;
  String? lastName;
  String? email;
  String? company;
  String? phoneNumber;
  String? cOUNTRY;
  dynamic sTATE;
  String? cITY;
  dynamic street;
  dynamic apartment;
  String? pOSTALCODE;
  String? sITEUSECODE;

  BillingAddress(
      {this.firstName,
      this.lastName,
      this.email,
      this.company,
      this.phoneNumber,
      this.cOUNTRY,
      this.sTATE,
      this.cITY,
      this.street,
      this.apartment,
      this.pOSTALCODE,
      this.sITEUSECODE});

  BillingAddress.fromJson(Map<String, dynamic> json) {
    firstName = json['FirstName'];
    lastName = json['LastName'];
    email = json['Email'];
    company = json['Company'];
    phoneNumber = json['PhoneNumber'];
    cOUNTRY = json['COUNTRY'];
    sTATE = json['STATE'];
    cITY = json['CITY'];
    street = json['Street'];
    apartment = json['Apartment'];
    pOSTALCODE = json['POSTAL_CODE'];
    sITEUSECODE = json['SITE_USE_CODE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['FirstName'] = firstName;
    data['LastName'] = lastName;
    data['Email'] = email;
    data['Company'] = company;
    data['PhoneNumber'] = phoneNumber;
    data['COUNTRY'] = cOUNTRY;
    data['STATE'] = sTATE;
    data['CITY'] = cITY;
    data['Street'] = street;
    data['Apartment'] = apartment;
    data['POSTAL_CODE'] = pOSTALCODE;
    data['SITE_USE_CODE'] = sITEUSECODE;
    return data;
  }
}
