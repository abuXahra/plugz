class GetPriceModel {
  double? pickupLongitude;
  double? pickupLatitude;
  double? dropoffLongitude;
  double? dropoffLatitude;
  int? countryId;

  GetPriceModel(
      {this.pickupLongitude,
      this.pickupLatitude,
      this.dropoffLongitude,
      this.dropoffLatitude,
      this.countryId});

  GetPriceModel.fromJson(Map<String, dynamic> json) {
    pickupLongitude = json['pickupLongitude'];
    pickupLatitude = json['pickupLatitude'];
    dropoffLongitude = json['dropoffLongitude'];
    dropoffLatitude = json['dropoffLatitude'];
    countryId = json['countryId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pickupLongitude'] = this.pickupLongitude;
    data['pickupLatitude'] = this.pickupLatitude;
    data['dropoffLongitude'] = this.dropoffLongitude;
    data['dropoffLatitude'] = this.dropoffLatitude;
    data['countryId'] = this.countryId;
    return data;
  }
}
