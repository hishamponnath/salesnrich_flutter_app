class ProductcategoryModel {
  String? pid;
  dynamic? alterId;
  String? name;
  dynamic? alias;
  dynamic? description;
  bool? activated;
  bool? thirdpartyUpdate;
  dynamic? productCategoryId;
  String? lastModifiedDate;
  bool? assignedToAccountSalesReport;

  ProductcategoryModel(
      {this.pid,
      this.alterId,
      this.name,
      this.alias,
      this.description,
      this.activated,
      this.thirdpartyUpdate,
      this.productCategoryId,
      this.lastModifiedDate,
      this.assignedToAccountSalesReport});

  ProductcategoryModel.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    alterId = json['alterId'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    activated = json['activated'];
    thirdpartyUpdate = json['thirdpartyUpdate'];
    productCategoryId = json['productCategoryId'];
    lastModifiedDate = json['lastModifiedDate'];
    assignedToAccountSalesReport = json['assignedToAccountSalesReport'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pid'] = this.pid;
    data['alterId'] = this.alterId;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['activated'] = this.activated;
    data['thirdpartyUpdate'] = this.thirdpartyUpdate;
    data['productCategoryId'] = this.productCategoryId;
    data['lastModifiedDate'] = this.lastModifiedDate;
    data['assignedToAccountSalesReport'] = this.assignedToAccountSalesReport;
    return data;
  }
}
