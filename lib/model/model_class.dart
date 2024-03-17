class CustomerModel {
  int? id;
  String? name;
  String? email;
  String? primaryAddress;
  String? secoundaryAddress;
  String? notes;
  String? phone;
  String? custType;
  String? parentCustomer;
  String? imagePath;
  double? totalDue;
  String? lastSalesDate;
  String? lastInvoiceNo;
  String? lastSoldProduct;
  double? totalSalesValue;
  double? totalSalesReturnValue;
  double? totalAmountBack;
  double? totalCollection;
  String? lastTransactionDate;
  String? clinetCompanyName;

  CustomerModel(
      {this.id,
        this.name,
        this.email,
        this.primaryAddress,
        this.secoundaryAddress,
        this.notes,
        this.phone,
        this.custType,
        this.parentCustomer,
        this.imagePath,
        this.totalDue,
        this.lastSalesDate,
        this.lastInvoiceNo,
        this.lastSoldProduct,
        this.totalSalesValue,
        this.totalSalesReturnValue,
        this.totalAmountBack,
        this.totalCollection,
        this.lastTransactionDate,
        this.clinetCompanyName});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    name = json['Name'];
    email = json['Email'];
    primaryAddress = json['PrimaryAddress'];
    secoundaryAddress = json['SecoundaryAddress'];
    notes = json['Notes'];
    phone = json['Phone'];
    custType = json['CustType'];
    parentCustomer = json['ParentCustomer'];
    imagePath = json['ImagePath'];
    totalDue = json['TotalDue'];
    lastSalesDate = json['LastSalesDate'];
    lastInvoiceNo = json['LastInvoiceNo'];
    lastSoldProduct = json['LastSoldProduct'];
    totalSalesValue = json['TotalSalesValue'];
    totalSalesReturnValue = json['TotalSalesReturnValue'];
    totalAmountBack = json['TotalAmountBack'];
    totalCollection = json['TotalCollection'];
    lastTransactionDate = json['LastTransactionDate'];
    clinetCompanyName = json['ClinetCompanyName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Id'] = id;
    data['Name'] = name;
    data['Email'] = email;
    data['PrimaryAddress'] = primaryAddress;
    data['SecoundaryAddress'] = secoundaryAddress;
    data['Notes'] = notes;
    data['Phone'] = phone;
    data['CustType'] = custType;
    data['ParentCustomer'] = parentCustomer;
    data['ImagePath'] = imagePath;
    data['TotalDue'] = totalDue;
    data['LastSalesDate'] = lastSalesDate;
    data['LastInvoiceNo'] = lastInvoiceNo;
    data['LastSoldProduct'] = lastSoldProduct;
    data['TotalSalesValue'] = totalSalesValue;
    data['TotalSalesReturnValue'] = totalSalesReturnValue;
    data['TotalAmountBack'] = totalAmountBack;
    data['TotalCollection'] = totalCollection;
    data['LastTransactionDate'] = lastTransactionDate;
    data['ClinetCompanyName'] = clinetCompanyName;
    return data;
  }
}
