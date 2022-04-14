class Userinvoices {
  List<Invoices>? invoices;

  Userinvoices({this.invoices});

  Userinvoices.fromJson(dynamic json) {
    if (json != null) {
      invoices = [] ;
      json.forEach((v) {
        invoices!.add(Invoices.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   if (invoices != null) {
  //     data['invoices'] = invoices!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Invoices {
  dynamic invoiceId;
  dynamic oInvoiceId;
  String? invoiceNumber;
  String? invoiceDate;
  String? invoiceStatus;
  String? invoiceDueDate;
  String? invoiceGlDate;
  dynamic invoiceAmount;
  dynamic amountDueRemaining;
 dynamic amountAdjusted;
  String? invoiceCurrencyCode;
  String? invoiceTypeId;
  String? invoiceType;
  String? meaning;
  String? batchSource;
  dynamic batchSourceId;
  dynamic ecomCustomerId;
  dynamic customerId;
  String? customerNumber;
  String? billToSiteUseId;
  String? bILLTOLOCATION;
  String? creationDate;
  String? lastUpdateDateda;
  dynamic orgId;
  String? salesOrder;
  dynamic storeID;
 dynamic oTermID;
  String? pRIMARYSALESREPID;
  String? cTREFERENCE;
 dynamic paymentTerm;
  List<Lines>? lines;

  Invoices(
      {this.invoiceId,
      this.oInvoiceId,
      this.invoiceNumber,
      this.invoiceDate,
      this.invoiceStatus,
      this.invoiceDueDate,
      this.invoiceGlDate,
      this.invoiceAmount,
      this.amountDueRemaining,
      this.amountAdjusted,
      this.invoiceCurrencyCode,
      this.invoiceTypeId,
      this.invoiceType,
      this.meaning,
      this.batchSource,
      this.batchSourceId,
      this.ecomCustomerId,
      this.customerId,
      this.customerNumber,
      this.billToSiteUseId,
      this.bILLTOLOCATION,
      this.creationDate,
      this.lastUpdateDateda,
      this.orgId,
      this.salesOrder,
      this.storeID,
      this.oTermID,
      this.pRIMARYSALESREPID,
      this.cTREFERENCE,
      this.paymentTerm,
      this.lines});

  Invoices.fromJson(dynamic json) {
    invoiceId = json['Invoice_Id'];
    oInvoiceId = json['O_Invoice_Id'];
    invoiceNumber = json['Invoice_Number'];
    invoiceDate = json['Invoice_Date'];
    invoiceStatus = json['Invoice_Status'];
    invoiceDueDate = json['Invoice_Due_Date'];
    invoiceGlDate = json['Invoice_Gl_Date'];
    invoiceAmount = json['Invoice_Amount'];
    amountDueRemaining = json['Amount_Due_Remaining'];
    amountAdjusted = json['Amount_Adjusted'];
    invoiceCurrencyCode = json['Invoice_Currency_Code'];
    invoiceTypeId = json['Invoice_Type_Id'];
    invoiceType = json['Invoice_Type'];
    meaning = json['Meaning'];
    batchSource = json['Batch_Source'];
    batchSourceId = json['Batch_Source_Id'];
    ecomCustomerId = json['Ecom_CustomerId'];
    customerId = json['Customer_Id'];
    customerNumber = json['Customer_Number'];
    billToSiteUseId = json['Bill_To_Site_Use_Id'];
    bILLTOLOCATION = json['BILL_TO_LOCATION'];
    creationDate = json['Creation_Date'];
    lastUpdateDateda = json['Last_Update_Dateda'];
    orgId = json['Org_Id'];
    salesOrder = json['Sales_Order'];
    storeID = json['Store_ID'];
    oTermID = json['OTerm_ID'];
    pRIMARYSALESREPID = json['PRIMARY_SALESREP_ID'];
    cTREFERENCE = json['CT_REFERENCE'];
    paymentTerm = json['Payment_Term'];
    if (json['lines'] != null) {
      lines = <Lines>[];
      json['lines'].forEach((v) {
        lines!.add(Lines.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Invoice_Id'] = invoiceId;
    data['O_Invoice_Id'] = oInvoiceId;
    data['Invoice_Number'] = invoiceNumber;
    data['Invoice_Date'] = invoiceDate;
    data['Invoice_Status'] = invoiceStatus;
    data['Invoice_Due_Date'] = invoiceDueDate;
    data['Invoice_Gl_Date'] = invoiceGlDate;
    data['Invoice_Amount'] = invoiceAmount;
    data['Amount_Due_Remaining'] = amountDueRemaining;
    data['Amount_Adjusted'] = amountAdjusted;
    data['Invoice_Currency_Code'] = invoiceCurrencyCode;
    data['Invoice_Type_Id'] = invoiceTypeId;
    data['Invoice_Type'] = invoiceType;
    data['Meaning'] = meaning;
    data['Batch_Source'] = batchSource;
    data['Batch_Source_Id'] = batchSourceId;
    data['Ecom_CustomerId'] = ecomCustomerId;
    data['Customer_Id'] = customerId;
    data['Customer_Number'] = customerNumber;
    data['Bill_To_Site_Use_Id'] = billToSiteUseId;
    data['BILL_TO_LOCATION'] = bILLTOLOCATION;
    data['Creation_Date'] = creationDate;
    data['Last_Update_Dateda'] = lastUpdateDateda;
    data['Org_Id'] = orgId;
    data['Sales_Order'] = salesOrder;
    data['Store_ID'] = storeID;
    data['OTerm_ID'] = oTermID;
    data['PRIMARY_SALESREP_ID'] = pRIMARYSALESREPID;
    data['CT_REFERENCE'] = cTREFERENCE;
    data['Payment_Term'] = paymentTerm;
    if (lines != null) {
      data['lines'] = lines!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Lines {
  String? quantity;
  String? unitSellingPrice;
  dynamic amount;
 dynamic taxRate;
 dynamic taxAmount;
  String? oDESCRIPTION;
 dynamic total;
  String? salesOrder;

  Lines(
      {this.quantity,
      this.unitSellingPrice,
      this.amount,
      this.taxRate,
      this.taxAmount,
      this.oDESCRIPTION,
      this.total,
      this.salesOrder});

  Lines.fromJson(Map<String, dynamic> json) {
    quantity = json['Quantity'];
    unitSellingPrice = json['Unit_Selling_Price'];
    amount = json['Amount'];
    taxRate = json['Tax_Rate'];
    taxAmount = json['Tax_Amount'];
    oDESCRIPTION = json['O_DESCRIPTION'];
    total = json['Total'];
    salesOrder = json['Sales_Order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Quantity'] = quantity;
    data['Unit_Selling_Price'] = unitSellingPrice;
    data['Amount'] = amount;
    data['Tax_Rate'] = taxRate;
    data['Tax_Amount'] = taxAmount;
    data['O_DESCRIPTION'] = oDESCRIPTION;
    data['Total'] = total;
    data['Sales_Order'] = salesOrder;
    return data;
  }
}
