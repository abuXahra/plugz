import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'dart:io';
import '../../utils/constants.dart';
import '../models/dispatch_model.dart';
import '../models/get_price_model.dart';

// Future<http.Response?> dispatchRequest(Dispatch data) async {
//   http.Response? response;
//   try {
//     response = await http.post(Uri.parse(newRideApi),
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//         body: jsonEncode(data.toJson()));
//   } catch (e) {
//     log(e.toString());
//   }

//   log(response!.body);

//   return response;
// }

// Future<http.Response?> priceRequest(GetPriceModel data) async {
//   http.Response? response;
//   try {
//     response = await http.post(Uri.parse(priceApi),
//         headers: {
//           HttpHeaders.contentTypeHeader: "application/json",
//         },
//         body: jsonEncode(data.toJson()));
//   } catch (e) {
//     log(e.toString());
//   }
//   log(response!.body);
//   return response;
// }

class Api {
  static Api instance = Api();

  String token =
      'eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTMzMTQ3MjYzNDEzOTAzMTMzIiwiZXhwIjoxNjcxNzExNDExLCJpc3MiOiJodHRwOi8vcm9hZHN0YXIuY29tIiwiYXVkIjoiaHR0cDovL3JvYWRzdGFyLmNvbSJ9.sAZb_Okjveg0shIdfFEYGY0UePgXRceulFqggJ2RSZw';

  Future<http.Response> getPrice(double pickupLongitude, double pickupLatitude,
      double dropoffLongitude, double dropoffLatitude, int countryId) async {
    final response = await http.post(
        Uri.parse('https://rr-api.cloudware.com.ng/api/Rides/GetPrice'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'bearer $token'
        },
        // body: jsonEncode(
        //   <String, dynamic>{
        //     "pickupLongitude": pickupLongitude,
        //     "pickupLatitude": pickupLatitude,
        //     "dropoffLongitude": dropoffLongitude,
        //     "dropoffLatitude": dropoffLongitude,
        //     "countryId": "$countryId",
        //   },
        // ),
        body: jsonEncode(<String, dynamic>{
          "pickupLongitude": 7.4084544,
          "pickupLatitude": 9.0886462,
          "dropoffLongitude": 7.40844166666667,
          "dropoffLatitude": 9.08902166666667,
          "countryId": "234"
        }));
    print('=========Get price====================');
    print(response.body);
    print(response.statusCode);
    return response;
  }

  Future<List<dynamic>?> getNewRidePrice() async {
    try {
      final response = await http
          .get(Uri.parse("https://rr-api.cloudware.com.ng/api/Rides/GetPrice"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);
        return body;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<http.Response> postNewRide(
      String? typeOfRide,
      String? packageDescription,
      String? packageImage,
      String? senderId,
      String? pickupType,
      String? pickupDateTime,
      double? pickupLongitude,
      double? pickupLatitude,
      String? pickupAddress,
      String? receiverId,
      String? receiverTelephone,
      String? dropoffDateTime,
      double? dropoffLongitude,
      double? dropoffLatitude,
      String? dropoffAddress,
      String? paymentType,
      int? price) async {
    final response = await http.post(
      Uri.parse('https://rr-api.cloudware.com.ng/api/Rides/NewRide'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token'
      },
      body: jsonEncode(
        <String, dynamic>{
          'typeOfRide': '$typeOfRide',
          'packageDescription': '$packageDescription',
          'packageImage': '$packageImage',
          'senderId': '$senderId',
          'pickupType': '$pickupType',
          'pickupDateTime': '$pickupDateTime',
          'pickupLongitude': pickupLongitude,
          'pickupLatitude': pickupLatitude,
          'pickupAddress': '$pickupAddress',
          'receiverId': '$receiverId',
          'receiverTelephone': '$receiverTelephone',
          'dropoffDateTime': '$dropoffDateTime',
          'dropoffLongitude': dropoffLongitude,
          'dropoffLatitude': dropoffLatitude,
          'dropoffAddress': '$dropoffAddress',
          'paymentType': '$paymentType',
          'price': '$price'
        },
      ),
    );
    print('=========Get price====================');
    print(response.body);
    return response;
  }

  // Future<http.Response> postNewRideii() async {

  // var map = new Map<String, dynamic>();

  //     var typeOfRide;
  //     var packageDescription;
  //     var packageImage;
  //     var senderId;
  //     var pickupType;
  //     var pickuDateTime;
  //     var pickupLongitude;
  //     var pickupLatitude;
  //     var pickupAddress;
  //     var receiverId;
  //     var receiverTelephone;
  //     var dropoffDateTime;
  //     var dropoffLongitude;
  //     var dropoffLatitude;
  //     var dropoffAddress;
  //     var paymentType;

  //        var data = {[

  //     "typeOfRide": typeOfRide,
  //     ]
  //     String? packageDescription,
  //     String? packageImage,
  //     String? senderId,
  //     String? pickupType,
  //     String? pickupDateTime,
  //     double? pickupLongitude,
  //     double? pickupLatitude,
  //     String? pickupAddress,
  //     String? receiverId,
  //     String? receiverTelephone,
  //     String? dropoffDateTime,
  //     double? dropoffLongitude,
  //     double? dropoffLatitude,
  //     String? dropoffAddress,
  //     String? paymentType,
  //     int? price]}
  //   final response = await http.post(
  //     Uri.parse('https://rr-api.cloudware.com.ng/api/Rides/NewRide'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //       'Authorization': 'bearer $token'
  //     },
  //     body: jsonEncode(
  //       <String, dynamic>{
  //         'typeOfRide': '$typeOfRide',
  //         'packageDescription': '$packageDescription',
  //         'packageImage': '$packageImage',
  //         'senderId': '$senderId',
  //         'pickupType': '$pickupType',
  //         'pickupDateTime': '$pickupDateTime',
  //         'pickupLongitude': pickupLongitude,
  //         'pickupLatitude': pickupLatitude,
  //         'pickupAddress': '$pickupAddress',
  //         'receiverId': '$receiverId',
  //         'receiverTelephone': '$receiverTelephone',
  //         'dropoffDateTime': '$dropoffDateTime',
  //         'dropoffLongitude': dropoffLongitude,
  //         'dropoffLatitude': dropoffLatitude,
  //         'dropoffAddress': '$dropoffAddress',
  //         'paymentType': '$paymentType',
  //         'price': '$price'
  //       },
  //     ),
  //   );
  //   print('=========Get price====================');
  //   print(response.body);
  //   return response;
  // }
}
