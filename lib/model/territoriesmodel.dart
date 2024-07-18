class TerritoryModel {
  String? id;
  String? pid;
  String? alterId;
  String? name;
  String? alias;
  String? description;
  String? latitude;
  String? longitude;
  String? locationId;
  bool? activated;
  String? lastModifiedDate;

  TerritoryModel(
      {this.id,
      this.pid,
      this.alterId,
      this.name,
      this.alias,
      this.description,
      this.latitude,
      this.longitude,
      this.locationId,
      this.activated,
      this.lastModifiedDate});

  TerritoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pid = json['pid'];
    alterId = json['alterId'];
    name = json['name'];
    alias = json['alias'];
    description = json['description'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    locationId = json['locationId'];
    activated = json['activated'];
    lastModifiedDate = json['lastModifiedDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pid'] = this.pid;
    data['alterId'] = this.alterId;
    data['name'] = this.name;
    data['alias'] = this.alias;
    data['description'] = this.description;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['locationId'] = this.locationId;
    data['activated'] = this.activated;
    data['lastModifiedDate'] = this.lastModifiedDate;
    return data;
  }
}
