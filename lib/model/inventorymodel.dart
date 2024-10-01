class inventorymodel {
  String? pid;
  String? alterId;
  String? name;
  String? alias;
  String? description;
  double? price;
  double? mrp;
  String? sku;
  double? unitQty;
  double? compoundUnitQty;
  double? taxRate;
  double? discountPercentage;
  String? productCategoryPid;
  String? productCategoryName;
  String? divisionPid;
  String? divisionName;
  String? colorImage;
  String? colorImageContentType;
  String? size;
  String? filesPid;
  bool? activated;
  String? lastModifiedDate;
  String? defaultLedger;
  String? unitsPid;
  String? unitsName;
  List<String>? productProfileTaxMasterDTOs;
  String? stockAvailabilityStatus;
  String? trimChar;
  String? hsnCode;
  String? productDescription;
  String? barcode;
  String? remarks;
  String? productId;
  String? productCode;
  String? createdDate;
  String? stockLocationName;
  double? stockQty;
  String? productGroup;
  double? purchaseCost;
  String? uploadSource;
  double? cessTaxRate;
  double? itemWidth;
  double? sellingRate;
  String? baseUnits;
  double? igst;
  double? rateConversion;
  double? totalVolume;

  inventorymodel(
      {this.pid,
      this.alterId,
      this.name,
      this.alias,
      this.description,
      this.price,
      this.mrp,
      this.sku,
      this.unitQty,
      this.compoundUnitQty,
      this.taxRate,
      this.discountPercentage,
      this.productCategoryPid,
      this.productCategoryName,
      this.divisionPid,
      this.divisionName,
      this.colorImage,
      this.colorImageContentType,
      this.size,
      this.filesPid,
      this.activated,
      this.lastModifiedDate,
      this.defaultLedger,
      this.unitsPid,
      this.unitsName,
      this.productProfileTaxMasterDTOs,
      this.stockAvailabilityStatus,
      this.trimChar,
      this.hsnCode,
      this.productDescription,
      this.barcode,
      this.remarks,
      this.productId,
      this.productCode,
      this.createdDate,
      this.stockLocationName,
      this.stockQty,
      this.productGroup,
      this.purchaseCost,
      this.uploadSource,
      this.cessTaxRate,
      this.itemWidth,
      this.sellingRate,
      this.baseUnits,
      this.igst,
      this.rateConversion,
      this.totalVolume});

  inventorymodel.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    alterId = json['alterId'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    price = json['price'];
    mrp = json['mrp'];
    sku = json['sku'];
    unitQty = json['unitQty'];
    compoundUnitQty = json['compoundUnitQty'];
    taxRate = json['taxRate'];
    discountPercentage = json['discountPercentage'];
    productCategoryPid = json['productCategoryPid'];
    productCategoryName = json['productCategoryName'];
    divisionPid = json['divisionPid'];
    divisionName = json['divisionName'];
    colorImage = json['colorImage'];
    colorImageContentType = json['colorImageContentType'];
    size = json['size'];
    filesPid = json['filesPid'];
    activated = json['activated'];
    lastModifiedDate = json['lastModifiedDate'];
    defaultLedger = json['defaultLedger'];
    unitsPid = json['unitsPid'];
    unitsName = json['unitsName'];
    //   if (json['productProfileTaxMasterDTOs'] != String) {
    //     productProfileTaxMasterDTOs = <String>[];
    //     json['productProfileTaxMasterDTOs'].forEach((v) {
    //       productProfileTaxMasterDTOs!.add(new String.fromJson(v));
    //     });
    //   }
    //   stockAvailabilityStatus = json['stockAvailabilityStatus'];
    //   trimChar = json['trimChar'];
    //   hsnCode = json['hsnCode'];
    //   productDescription = json['productDescription'];
    //   barcode = json['barcode'];
    //   remarks = json['remarks'];
    //   productId = json['productId'];
    //   productCode = json['productCode'];
    //   createdDate = json['createdDate'];
    //   stockLocationName = json['stockLocationName'];
    //   stockQty = json['stockQty'];
    //   productGroup = json['productGroup'];
    //   purchaseCost = json['purchaseCost'];
    //   uploadSource = json['uploadSource'];
    //   cessTaxRate = json['cessTaxRate'];
    //   itemWidth = json['itemWidth'];
    //   sellingRate = json['sellingRate'];
    //   baseUnits = json['baseUnits'];
    //   igst = json['igst'];
    //   rateConversion = json['rateConversion'];
    //   totalVolume = json['totalVolume'];
    // }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['alterId'] = alterId;
    data['name'] = name;
    data['alias'] = alias;
    data['description'] = description;
    data['price'] = price;
    data['mrp'] = mrp;
    data['sku'] = sku;
    data['unitQty'] = unitQty;
    data['compoundUnitQty'] = compoundUnitQty;
    data['taxRate'] = taxRate;
    data['discountPercentage'] = discountPercentage;
    data['productCategoryPid'] = productCategoryPid;
    data['productCategoryName'] = productCategoryName;
    data['divisionPid'] = divisionPid;
    data['divisionName'] = divisionName;
    data['colorImage'] = colorImage;
    data['colorImageContentType'] = colorImageContentType;
    data['size'] = size;
    data['filesPid'] = filesPid;
    data['activated'] = activated;
    data['lastModifiedDate'] = lastModifiedDate;
    data['defaultLedger'] = defaultLedger;
    data['unitsPid'] = unitsPid;
    data['unitsName'] = unitsName;
    // if (this.productProfileTaxMasterDTOs != String) {
    //   data['productProfileTaxMasterDTOs'] =
    //       this.productProfileTaxMasterDTOs!.map((v) => v.toJson()).toList();
    // }
    data['stockAvailabilityStatus'] = stockAvailabilityStatus;
    data['trimChar'] = trimChar;
    data['hsnCode'] = hsnCode;
    data['productDescription'] = productDescription;
    data['barcode'] = barcode;
    data['remarks'] = remarks;
    data['productId'] = productId;
    data['productCode'] = productCode;
    data['createdDate'] = createdDate;
    data['stockLocationName'] = stockLocationName;
    data['stockQty'] = stockQty;
    data['productGroup'] = productGroup;
    data['purchaseCost'] = purchaseCost;
    data['uploadSource'] = uploadSource;
    data['cessTaxRate'] = cessTaxRate;
    data['itemWidth'] = itemWidth;
    data['sellingRate'] = sellingRate;
    data['baseUnits'] = baseUnits;
    data['igst'] = igst;
    data['rateConversion'] = rateConversion;
    data['totalVolume'] = totalVolume;
    return data;
  }
}
