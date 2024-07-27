class AccountModel {
  int? id;
  String? pid;
  Null? companyId;
  String? companyPid;
  String? companyName;
  String? gstNumber;
  String? companyPhoneNo;
  String? companyAddress;
  String? companyEmail;
  String? login;
  String? firstName;
  String? lastName;
  String? email;
  String? mobile;
  bool? activated;
  String? langKey;
  String? deviceKey;
  List<String>? authorities;
  bool? showAllUserData;
  Null? chartColor;
  String? dashboardUIType;
  bool? discontinued;
  String? employeeName;
  String? employeeAlias;
  String? userPassword;
  bool? enableModcFeature;

  AccountModel(
      {this.id,
      this.pid,
      this.companyId,
      this.companyPid,
      this.companyName,
      this.gstNumber,
      this.companyPhoneNo,
      this.companyAddress,
      this.companyEmail,
      this.login,
      this.firstName,
      this.lastName,
      this.email,
      this.mobile,
      this.activated,
      this.langKey,
      this.deviceKey,
      this.authorities,
      this.showAllUserData,
      this.chartColor,
      this.dashboardUIType,
      this.discontinued,
      this.employeeName,
      this.employeeAlias,
      this.userPassword,
      this.enableModcFeature});

  AccountModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    companyId = json['companyId'];
    companyPid = json['companyPid'];
    companyName = json['companyName'];
    gstNumber = json['gstNumber'];
    companyPhoneNo = json['companyPhoneNo'];
    companyAddress = json['companyAddress'];
    companyEmail = json['companyEmail'];
    login = json['login'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    mobile = json['mobile'];
    activated = json['activated'];
    langKey = json['langKey'];
    deviceKey = json['deviceKey'];
    authorities = json['authorities'].cast<String>();
    showAllUserData = json['showAllUserData'];
    chartColor = json['chartColor'];
    dashboardUIType = json['dashboardUIType'];
    discontinued = json['discontinued'];
    employeeName = json['employeeName'];
    employeeAlias = json['employeeAlias'];
    userPassword = json['userPassword'];
    enableModcFeature = json['enableModcFeature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pid'] = this.pid;
    data['companyId'] = this.companyId;
    data['companyPid'] = this.companyPid;
    data['companyName'] = this.companyName;
    data['gstNumber'] = this.gstNumber;
    data['companyPhoneNo'] = this.companyPhoneNo;
    data['companyAddress'] = this.companyAddress;
    data['companyEmail'] = this.companyEmail;
    data['login'] = this.login;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['email'] = this.email;
    data['mobile'] = this.mobile;
    data['activated'] = this.activated;
    data['langKey'] = this.langKey;
    data['deviceKey'] = this.deviceKey;
    data['authorities'] = this.authorities;
    data['showAllUserData'] = this.showAllUserData;
    data['chartColor'] = this.chartColor;
    data['dashboardUIType'] = this.dashboardUIType;
    data['discontinued'] = this.discontinued;
    data['employeeName'] = this.employeeName;
    data['employeeAlias'] = this.employeeAlias;
    data['userPassword'] = this.userPassword;
    data['enableModcFeature'] = this.enableModcFeature;
    return data;
  }
}
