import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:plugz/core/models/price_model.dart';
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
  late Dispatch resp;
  late Price priceRespons;
  late dynamic imgResp;

  String token ='abcdefeyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCIsImN0eSI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoiMTMzMTQ3MjYzNDEzOTAzMTMzIiwiZXhwIjoxNjc2NjM2NTI4LCJpc3MiOiJodHRwOi8vcm9hZHN0YXIuY29tIiwiYXVkIjoiaHR0cDovL3JvYWRzdGFyLmNvbSJ9.uGoYshbsXU_Rut7fI07ouECMGZ_AmHsrmLIPVN_bKwY';


  Future<http.Response> getPriceii(dynamic data) async{
    final response = await http.post(
      Uri.parse('https://rr-api.cloudware.com.ng/api/Rides/NewRide'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token'
      },
      body: jsonEncode(data.toJson()),
    );
    if(response.statusCode != 200){
      //return error response here
    }
    var body = response.body;
    Map<String, dynamic> jsonObj = jsonDecode(body);

    priceRespons = Price.fromJson(jsonObj);

    log(body);

    return response;
  }




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



  Future<http.Response> postNewRide(dynamic dispatch) async {
    final response = await http.post(
      Uri.parse('https://rr-api.cloudware.com.ng/api/Rides/NewRide'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token'
      },
      body: jsonEncode(dispatch.toJson()),
    );
    if(response.statusCode != 200){
      //return error response here
    }
    var body = response.body;
    Map<String, dynamic> jsonObj = jsonDecode(body);

    resp = Dispatch.fromJson(jsonObj);

   log(response.body);

   return response;

  }



  //live 149
  Future<http.Response> postNewPicture(dynamic imgUrl) async {
    final response = await http.post(
      Uri.parse('https://plugzwallet.supportdom.com/api/Identity/FaceLivelinessCheck'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'bearer $token'
      },
      body: jsonEncode(imgUrl.toJson()),
    );
    if(response.statusCode != 200){
      //return error response here
    }
    var body = response.body;
    Map<String, dynamic> jsonObj = jsonDecode(body);

    imgResp = imgUrl.fromJson(jsonObj);

    log(imgResp);
    log("sucessfully uploaded");

    return response;

  }





  Future<http.Response> post(dynamic request, Map<String, String> headers, String url,) async {
    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(request.toJson()),
    );
    return response;
  }

}
