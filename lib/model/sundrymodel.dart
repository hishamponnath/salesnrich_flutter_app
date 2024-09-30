class SundryModel {
  String? pid;
  String? name;
  String? alias;
  String? description;
  bool? hasDefaultAccount;
  bool? hasSecondarySales;
  List<ActivityAccountTypes>? activityAccountTypes;
  List<Documents>? documents;
  bool? planThrouchOnly;
  bool? excludeAccountsInPlan;
  bool? activated;
  bool? completePlans;
  bool? saveActivityDuration;
  bool? targetDisplayOnDayplan;
  bool? emailTocomplaint;
  int? sortOrder;
  String? lastModifiedDate;
  bool? interimSave;
  String? companyPid;
  String? companyName;
  bool? geoFencing;
  bool? hasTelephonicOrder;
  double? locationRadius;
  bool? secondarySalesThroughApi;
  bool? kmCalculationDisabled;
  bool? autoTaskCreation;
  String? contactManagement;

  SundryModel(
      {this.pid,
      this.name,
      this.alias,
      this.description,
      this.hasDefaultAccount,
      this.hasSecondarySales,
      this.activityAccountTypes,
      this.documents,
      this.planThrouchOnly,
      this.excludeAccountsInPlan,
      this.activated,
      this.completePlans,
      this.saveActivityDuration,
      this.targetDisplayOnDayplan,
      this.emailTocomplaint,
      this.sortOrder,
      this.lastModifiedDate,
      this.interimSave,
      this.companyPid,
      this.companyName,
      this.geoFencing,
      this.hasTelephonicOrder,
      this.locationRadius,
      this.secondarySalesThroughApi,
      this.kmCalculationDisabled,
      this.autoTaskCreation,
      this.contactManagement});

  SundryModel.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    hasDefaultAccount = json['hasDefaultAccount'];
    hasSecondarySales = json['hasSecondarySales'];
    if (json['activityAccountTypes'] != String) {
      activityAccountTypes = <ActivityAccountTypes>[];
      json['activityAccountTypes'].forEach((v) {
        activityAccountTypes!.add(ActivityAccountTypes.fromJson(v));
      });
    }
    if (json['documents'] != String) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(Documents.fromJson(v));
      });
    }
    planThrouchOnly = json['planThrouchOnly'];
    excludeAccountsInPlan = json['excludeAccountsInPlan'];
    activated = json['activated'];
    completePlans = json['completePlans'];
    saveActivityDuration = json['saveActivityDuration'];
    targetDisplayOnDayplan = json['targetDisplayOnDayplan'];
    emailTocomplaint = json['emailTocomplaint'];
    sortOrder = json['sortOrder'];
    lastModifiedDate = json['lastModifiedDate'];
    interimSave = json['interimSave'];
    companyPid = json['companyPid'];
    companyName = json['companyName'];
    geoFencing = json['geoFencing'];
    hasTelephonicOrder = json['hasTelephonicOrder'];
    locationRadius = json['locationRadius'];
    secondarySalesThroughApi = json['secondarySalesThroughApi'];
    kmCalculationDisabled = json['kmCalculationDisabled'];
    autoTaskCreation = json['autoTaskCreation'];
    contactManagement = json['contactManagement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['name'] = name;
    data['alias'] = alias;
    data['description'] = description;
    data['hasDefaultAccount'] = hasDefaultAccount;
    data['hasSecondarySales'] = hasSecondarySales;
    if (activityAccountTypes != String) {
      data['activityAccountTypes'] =
          activityAccountTypes!.map((v) => v.toJson()).toList();
    }
    if (documents != String) {
      data['documents'] = documents!.map((v) => v.toJson()).toList();
    }
    data['planThrouchOnly'] = planThrouchOnly;
    data['excludeAccountsInPlan'] = excludeAccountsInPlan;
    data['activated'] = activated;
    data['completePlans'] = completePlans;
    data['saveActivityDuration'] = saveActivityDuration;
    data['targetDisplayOnDayplan'] = targetDisplayOnDayplan;
    data['emailTocomplaint'] = emailTocomplaint;
    data['sortOrder'] = sortOrder;
    data['lastModifiedDate'] = lastModifiedDate;
    data['interimSave'] = interimSave;
    data['companyPid'] = companyPid;
    data['companyName'] = companyName;
    data['geoFencing'] = geoFencing;
    data['hasTelephonicOrder'] = hasTelephonicOrder;
    data['locationRadius'] = locationRadius;
    data['secondarySalesThroughApi'] = secondarySalesThroughApi;
    data['kmCalculationDisabled'] = kmCalculationDisabled;
    data['autoTaskCreation'] = autoTaskCreation;
    data['contactManagement'] = contactManagement;
    return data;
  }
}

class ActivityAccountTypes {
  String? pid;
  String? name;
  String? alias;
  String? description;
  bool? activated;
  String? lastModifiedDate;
  String? accountNameType;
  String? receiverSupplierType;

  ActivityAccountTypes(
      {this.pid,
      this.name,
      this.alias,
      this.description,
      this.activated,
      this.lastModifiedDate,
      this.accountNameType,
      this.receiverSupplierType});

  ActivityAccountTypes.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    activated = json['activated'];
    lastModifiedDate = json['lastModifiedDate'];
    accountNameType = json['accountNameType'];
    receiverSupplierType = json['receiverSupplierType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['name'] = name;
    data['alias'] = alias;
    data['description'] = description;
    data['activated'] = activated;
    data['lastModifiedDate'] = lastModifiedDate;
    data['accountNameType'] = accountNameType;
    data['receiverSupplierType'] = receiverSupplierType;
    return data;
  }
}

class Documents {
  String? pid;
  String? name;
  String? documentPrefix;
  String? alias;
  String? description;
  String? termsAndConditions;
  String? pdfBodyContent;
  String? discountPercentage;
  String? documentType;
  String? activityAccount;
  bool? save;
  String? sourceStockLocationPid;
  String? sourceStockLocationName;
  String? destinationStockLocationPid;
  String? destinationStockLocationName;
  bool? editable;
  bool? batchEnabled;
  bool? promptStockLocation;
  bool? activityDocRequired;
  int? activityDocSortOrder;
  bool? singleVoucherMode;
  bool? photoMandatory;
  bool? isTakeImageFromGallery;
  String? lastModifiedDate;
  String? companyName;
  String? companyPid;
  bool? imageOption;
  String? mode;
  String? stockFlow;
  bool? qrCodeEnabled;
  bool? orderNoEnabled;
  bool? addNewCustomer;
  bool? termsAndConditionsColumn;
  bool? hasTelephonicOrder;
  String? voucherNumberGenerationType;
  bool? rateWithTax;
  bool? discountScaleBar;
  bool? smsApiEnable;
  bool? preventNegativeStock;
  String? headerImage;
  String? headerImageContentType;
  String? footerImage;
  String? footerImageContentType;
  bool? enableHeaderPrintOut;
  bool? resetLeadTrackerData;
  bool? setMargin;
  bool? enableLoadingInStockProducts;
  bool? geotagMandatory;

  Documents(
      {this.pid,
      this.name,
      this.documentPrefix,
      this.alias,
      this.description,
      this.termsAndConditions,
      this.pdfBodyContent,
      this.discountPercentage,
      this.documentType,
      this.activityAccount,
      this.save,
      this.sourceStockLocationPid,
      this.sourceStockLocationName,
      this.destinationStockLocationPid,
      this.destinationStockLocationName,
      this.editable,
      this.batchEnabled,
      this.promptStockLocation,
      this.activityDocRequired,
      this.activityDocSortOrder,
      this.singleVoucherMode,
      this.photoMandatory,
      this.isTakeImageFromGallery,
      this.lastModifiedDate,
      this.companyName,
      this.companyPid,
      this.imageOption,
      this.mode,
      this.stockFlow,
      this.qrCodeEnabled,
      this.orderNoEnabled,
      this.addNewCustomer,
      this.termsAndConditionsColumn,
      this.hasTelephonicOrder,
      this.voucherNumberGenerationType,
      this.rateWithTax,
      this.discountScaleBar,
      this.smsApiEnable,
      this.preventNegativeStock,
      this.headerImage,
      this.headerImageContentType,
      this.footerImage,
      this.footerImageContentType,
      this.enableHeaderPrintOut,
      this.resetLeadTrackerData,
      this.setMargin,
      this.enableLoadingInStockProducts,
      this.geotagMandatory});

  Documents.fromJson(Map<String, dynamic> json) {
    pid = json['pid'];
    name = json['name'];
    documentPrefix = json['documentPrefix'];
    alias = json['alias'];
    description = json['description'];
    termsAndConditions = json['termsAndConditions'];
    pdfBodyContent = json['pdfBodyContent'];
    discountPercentage = json['discountPercentage'].toString();
    documentType = json['documentType'];
    activityAccount = json['activityAccount'];
    save = json['save'];
    sourceStockLocationPid = json['sourceStockLocationPid'];
    sourceStockLocationName = json['sourceStockLocationName'];
    destinationStockLocationPid = json['destinationStockLocationPid'];
    destinationStockLocationName = json['destinationStockLocationName'];
    editable = json['editable'];
    batchEnabled = json['batchEnabled'];
    promptStockLocation = json['promptStockLocation'];
    activityDocRequired = json['activityDocRequired'];
    activityDocSortOrder = json['activityDocSortOrder'];
    singleVoucherMode = json['singleVoucherMode'];
    photoMandatory = json['photoMandatory'];
    isTakeImageFromGallery = json['isTakeImageFromGallery'];
    lastModifiedDate = json['lastModifiedDate'];
    companyName = json['companyName'];
    companyPid = json['companyPid'];
    imageOption = json['imageOption'];
    mode = json['mode'];
    stockFlow = json['stockFlow'];
    qrCodeEnabled = json['qrCodeEnabled'];
    orderNoEnabled = json['orderNoEnabled'];
    addNewCustomer = json['addNewCustomer'];
    termsAndConditionsColumn = json['termsAndConditionsColumn'];
    hasTelephonicOrder = json['hasTelephonicOrder'];
    voucherNumberGenerationType = json['voucherNumberGenerationType'];
    rateWithTax = json['rateWithTax'];
    discountScaleBar = json['discountScaleBar'];
    smsApiEnable = json['smsApiEnable'];
    preventNegativeStock = json['preventNegativeStock'];
    headerImage = json['headerImage'];
    headerImageContentType = json['headerImageContentType'];
    footerImage = json['footerImage'];
    footerImageContentType = json['footerImageContentType'];
    enableHeaderPrintOut = json['enableHeaderPrintOut'];
    resetLeadTrackerData = json['resetLeadTrackerData'];
    setMargin = json['setMargin'];
    enableLoadingInStockProducts = json['enableLoadingInStockProducts'];
    geotagMandatory = json['geotagMandatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pid'] = pid;
    data['name'] = name;
    data['documentPrefix'] = documentPrefix;
    data['alias'] = alias;
    data['description'] = description;
    data['termsAndConditions'] = termsAndConditions;
    data['pdfBodyContent'] = pdfBodyContent;
    data['discountPercentage'] = discountPercentage;
    data['documentType'] = documentType;
    data['activityAccount'] = activityAccount;
    data['save'] = save;
    data['sourceStockLocationPid'] = sourceStockLocationPid;
    data['sourceStockLocationName'] = sourceStockLocationName;
    data['destinationStockLocationPid'] = destinationStockLocationPid;
    data['destinationStockLocationName'] = destinationStockLocationName;
    data['editable'] = editable;
    data['batchEnabled'] = batchEnabled;
    data['promptStockLocation'] = promptStockLocation;
    data['activityDocRequired'] = activityDocRequired;
    data['activityDocSortOrder'] = activityDocSortOrder;
    data['singleVoucherMode'] = singleVoucherMode;
    data['photoMandatory'] = photoMandatory;
    data['isTakeImageFromGallery'] = isTakeImageFromGallery;
    data['lastModifiedDate'] = lastModifiedDate;
    data['companyName'] = companyName;
    data['companyPid'] = companyPid;
    data['imageOption'] = imageOption;
    data['mode'] = mode;
    data['stockFlow'] = stockFlow;
    data['qrCodeEnabled'] = qrCodeEnabled;
    data['orderNoEnabled'] = orderNoEnabled;
    data['addNewCustomer'] = addNewCustomer;
    data['termsAndConditionsColumn'] = termsAndConditionsColumn;
    data['hasTelephonicOrder'] = hasTelephonicOrder;
    data['voucherNumberGenerationType'] = voucherNumberGenerationType;
    data['rateWithTax'] = rateWithTax;
    data['discountScaleBar'] = discountScaleBar;
    data['smsApiEnable'] = smsApiEnable;
    data['preventNegativeStock'] = preventNegativeStock;
    data['headerImage'] = headerImage;
    data['headerImageContentType'] = headerImageContentType;
    data['footerImage'] = footerImage;
    data['footerImageContentType'] = footerImageContentType;
    data['enableHeaderPrintOut'] = enableHeaderPrintOut;
    data['resetLeadTrackerData'] = resetLeadTrackerData;
    data['setMargin'] = setMargin;
    data['enableLoadingInStockProducts'] = enableLoadingInStockProducts;
    data['geotagMandatory'] = geotagMandatory;
    return data;
  }
}
