class DocumentsModel {
  String? pid;
  String? name;
  String? documentPrefix;
  dynamic alias; // Changed from Null to dynamic
  String? description;
  dynamic termsAndConditions; // Changed from Null to dynamic
  dynamic pdfBodyContent; // Changed from Null to dynamic
  var discountPercentage;
  String? documentType;
  dynamic activityAccount; // Changed from Null to dynamic
  bool? save;
  dynamic sourceStockLocationPid; // Changed from Null to dynamic
  dynamic sourceStockLocationName; // Changed from Null to dynamic
  dynamic destinationStockLocationPid; // Changed from Null to dynamic
  dynamic destinationStockLocationName; // Changed from Null to dynamic
  bool? editable;
  bool? batchEnabled;
  bool? promptStockLocation;
  bool? activityDocRequired;
  var activityDocSortOrder;
  bool? singleVoucherMode;
  bool? photoMandatory;
  bool? isTakeImageFromGallery;
  String? lastModifiedDate;
  String? companyName;
  String? companyPid;
  bool? imageOption;
  dynamic mode; // Changed from Null to dynamic
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
  dynamic headerImage; // Changed from Null to dynamic
  dynamic headerImageContentType; // Changed from Null to dynamic
  dynamic footerImage; // Changed from Null to dynamic
  dynamic footerImageContentType; // Changed from Null to dynamic
  bool? enableHeaderPrintOut;
  bool? resetLeadTrackerData;
  bool? setMargin;

  DocumentsModel({
    this.pid,
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
  });

  factory DocumentsModel.fromJson(Map<String, dynamic> json) {
    return DocumentsModel(
      pid: json['pid'],
      name: json['name'],
      documentPrefix: json['documentPrefix'],
      alias: json['alias'],
      description: json['description'],
      termsAndConditions: json['termsAndConditions'],
      pdfBodyContent: json['pdfBodyContent'],
      discountPercentage: json['discountPercentage'],
      documentType: json['documentType'],
      activityAccount: json['activityAccount'],
      save: json['save'],
      sourceStockLocationPid: json['sourceStockLocationPid'],
      sourceStockLocationName: json['sourceStockLocationName'],
      destinationStockLocationPid: json['destinationStockLocationPid'],
      destinationStockLocationName: json['destinationStockLocationName'],
      editable: json['editable'],
      batchEnabled: json['batchEnabled'],
      promptStockLocation: json['promptStockLocation'],
      activityDocRequired: json['activityDocRequired'],
      activityDocSortOrder: json['activityDocSortOrder'],
      singleVoucherMode: json['singleVoucherMode'],
      photoMandatory: json['photoMandatory'],
      isTakeImageFromGallery: json['isTakeImageFromGallery'],
      lastModifiedDate: json['lastModifiedDate'],
      companyName: json['companyName'],
      companyPid: json['companyPid'],
      imageOption: json['imageOption'],
      mode: json['mode'],
      stockFlow: json['stockFlow'],
      qrCodeEnabled: json['qrCodeEnabled'],
      orderNoEnabled: json['orderNoEnabled'],
      addNewCustomer: json['addNewCustomer'],
      termsAndConditionsColumn: json['termsAndConditionsColumn'],
      hasTelephonicOrder: json['hasTelephonicOrder'],
      voucherNumberGenerationType: json['voucherNumberGenerationType'],
      rateWithTax: json['rateWithTax'],
      discountScaleBar: json['discountScaleBar'],
      smsApiEnable: json['smsApiEnable'],
      preventNegativeStock: json['preventNegativeStock'],
      headerImage: json['headerImage'],
      headerImageContentType: json['headerImageContentType'],
      footerImage: json['footerImage'],
      footerImageContentType: json['footerImageContentType'],
      enableHeaderPrintOut: json['enableHeaderPrintOut'],
      resetLeadTrackerData: json['resetLeadTrackerData'],
      setMargin: json['setMargin'],
    );
  }
}
