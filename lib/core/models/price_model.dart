class Price {
  String? pickupType;
  double? price;
  String? currency;

  Price({this.pickupType, this.price, this.currency});

  Price.fromJson(Map<String, dynamic> json) {
    pickupType = json['pickupType'];
    price = json['price'];
    currency = json['currency'];
  }

  Map<String, dynamic> toJson() {
    return {
      'pickupType': this.pickupType,
      'price': this.price,
      'currency': this.currency,
    };
  }
}
