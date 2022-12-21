import 'price_model.dart';

class Dispatch {
  String? typeOfRide;
  String? packageDescription;
  String? packageImage;
  String? senderId;
  String? pickupType;
  String? pickupDateTime;
  double? pickupLongitude;
  double? pickupLatitude;
  String? pickupAddress;
  String? receiverId;
  String? receiverTelephone;
  String? dropoffDateTime;
  double? dropoffLongitude;
  double? dropoffLatitude;
  String? dropoffAddress;
  String? paymentType;
  Price? price;

  Dispatch(
      {required this.typeOfRide,
      required this.packageDescription,
      required this.packageImage,
      required this.senderId,
      required this.pickupType,
      required this.pickupDateTime,
      required this.pickupLongitude,
      required this.pickupLatitude,
      required this.pickupAddress,
      required this.receiverId,
      required this.receiverTelephone,
      required this.dropoffDateTime,
      required this.dropoffLongitude,
      required this.dropoffLatitude,
      required this.dropoffAddress,
      required this.paymentType,
      required this.price});

  Dispatch.fromJson(Map<String, dynamic> json) {
    typeOfRide = json['typeOfRide'];
    packageDescription = json['packageDescription'];
    packageImage = json['packageImage'];
    senderId = json['senderId'];
    pickupType = json['pickupType'];
    pickupDateTime = json['pickupDateTime'];
    pickupLongitude = json['pickupLongitude'];
    pickupLatitude = json['pickupLatitude'];
    pickupAddress = json['pickupAddress'];
    receiverId = json['receiverId'];
    receiverTelephone = json['receiverTelephone'];
    dropoffDateTime = json['dropoffDateTime'];
    dropoffLongitude = json['dropoffLongitude'];
    dropoffLatitude = json['dropoffLatitude'];
    dropoffAddress = json['dropoffAddress'];
    paymentType = json['paymentType'];
    price = Price.fromJson(json['amount']);
  }

  Map<String, dynamic> toJson() {
    return {
      'typeOfRide': this.typeOfRide,
      'packageDescription': this.packageDescription,
      'packageImage': this.packageImage,
      'senderId': this.senderId,
      'pickupType': this.pickupType,
      'pickupDateTime': this.pickupDateTime,
      'pickupLongitude': this.pickupLongitude,
      'pickupLatitude': this.pickupLatitude,
      'pickupAddress': this.pickupAddress,
      'receiverId': this.receiverId,
      'receiverTelephone': this.receiverTelephone,
      'dropoffDateTime': this.dropoffDateTime,
      'dropoffLongitude': this.dropoffLongitude,
      'dropoffLatitude': this.dropoffLatitude,
      'dropoffAddress': this.dropoffAddress,
      'paymentType': this.paymentType,
      'price': price!.toJson(),
    };
  }
}
