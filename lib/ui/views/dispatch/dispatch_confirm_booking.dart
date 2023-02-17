import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plugz/core/models/dispatch_model.dart';
import 'package:plugz/ui/views/dispatch/dispatch_booking.dart';
import 'package:provider/provider.dart';
import '../../../core/services/api.dart';
import '../../../core/view_model/dispatch_view_model.dart';
import '../../widgets/dispatch_widget.dart';
import 'dispatch_booked.dart';

class ConfirmDispatchBooking extends StatelessWidget {
  const ConfirmDispatchBooking({
    Key? key,
    this.pickupAddress,
    this.deliveryAddress,
    this.receiverTelephone,
    this.packageDescription,
    this.imageUrl,
    this.price,
    this.paymentMethodSelected,
    this.pickUpType,
    required this.pickupDateTime,
    required this.dropOffDateTime,
  }) : super(key: key);

  final String? pickupAddress;
  final String? pickUpType;
  final String? deliveryAddress;
  final String? receiverTelephone;
  final String? packageDescription;
  final DateTime pickupDateTime;
  final DateTime dropOffDateTime;
  final String? imageUrl;
  final double? price;
  final String? paymentMethodSelected;


  // {
  // "pickupLongitude": 7.4084544,
  // "pickupLatitude": 9.0886462,
  // "dropoffLongitude": 7.40844166666667,
  // "dropoffLatitude": 9.08902166666667,
  // "countryId": "234"
  // }

  Future<dynamic> newRide() async {
    var req = Dispatch(
      typeOfRide: '',
        packageDescription: packageDescription,
        packageImage: imageUrl,
        senderId: 'senderId',
        pickupType: pickUpType,
        pickupDateTime: pickupDateTime,
        pickupLongitude: 7.4084544,
        pickupLatitude: 9.0886462,
        pickupAddress: pickupAddress,
        receiverId: 'receiverId',
        receiverTelephone: receiverTelephone,
        dropoffDateTime: dropOffDateTime,
        dropoffLongitude: 7.40844166666667,
        dropoffLatitude: 9.08902166666667,
        dropoffAddress: deliveryAddress,
        paymentType: paymentMethodSelected,
        price: price,
    );

    return Api.instance.postNewRide(req);
  }


  // late Dispatch resp;
  // late List<Dispatch> resp2;
  //
  // Future<void> newRide() async {
  //   var req = Dispatch( packageDescription: packageDescription, packageImage: packageImage, senderId: senderId, pickupType: pickupType, pickupDateTime: pickupDateTime, pickupLongitude: pickupLongitude, pickupLatitude: pickupLatitude, pickupAddress: pickupAddress, receiverId: receiverId, receiverTelephone: receiverTelephone, dropoffDateTime: dropoffDateTime, dropoffLongitude: dropoffLongitude, dropoffLatitude: dropoffLatitude, dropoffAddress: dropoffAddress, paymentType: paymentType, price: price);
  //
  //   var headers = Map<String, String>{
  //     "Content-Type": "application/json; UTF-8"
  //   };
  //
  //   var response = await Api.instance.post( req,headers, 'https://rr-api.cloudware.com.ng/api/Rides/NewRide');
  //
  //   if(response.statusCode != 200){
  //     //return error response here
  //   }
  //
  //   var body = response.body;
  //   Map<String, dynamic> jsonObj = jsonDecode(body);
  //   resp = Dispatch.fromJson(jsonObj);
  //
  // }

  // Future<void> newRide() async {
  //   postNewRide()
  // Dispatch dispatch = Dispatch(e
  //         typeOfRide: "",
  //         packageDescription: packageDescription,
  //         packageImage: imageUrl,
  //         senderId: "",
  //         pickupType: "",
  //         pickupDateTime: "$deliveryDate $deliveryTime",
  //         pickupLongitude: 22,
  //         pickupLatitude: 23,
  //         pickupAddress: pickupAddress,
  //         receiverId: "",
  //         receiverTelephone: receiverTelephone,
  //         dropoffDateTime: "$deliveryDate $deliveryTime",
  //         dropoffLongitude: 20,
  //         dropoffLatitude: 21,
  //         dropoffAddress: deliveryAddress,
  //         paymentType: paymentMethodSelected,
  //       MaterialPageRoute(builder: (context) => DispatchBooking()),
  //     );
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.grey,
            ),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.account_circle, color: Color(0xff9B51E0)),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Wi
        ),
        body:SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child:
            // Column(
            //   children: resp2.map((e) => ListTile(
            //     title: e.packageDescription,
            //     subtitle: e.pickupType,
            //   )).toList(),
            // ),

            DispatchWidget(
              title: 'Confirm Dispatch',
              pickupAddress: pickupAddress,
              deliveryAddress: deliveryAddress,
              receiverTelephone: receiverTelephone,
              packageDescription: packageDescription,
              pickupDateTime: pickupDateTime,
              dropOffDateTime: dropOffDateTime,
              imageUrl: imageUrl,
              price: price,
              paymentMethodSelected: paymentMethodSelected,
              btnText: "Accept",
              onTap: () {
                newRide();
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DispatchedBooked(
                              pickupAddress: pickupAddress,
                              deliveryAddress: deliveryAddress,
                              receiverTelephone: receiverTelephone,
                              packageDescription: packageDescription,
                              pickupDateTime: pickupDateTime,
                              dropOffDateTime: dropOffDateTime,
                              imageUrl: imageUrl,
                              price: price,
                              pickUpType: pickUpType,
                              paymentMethodSelected: paymentMethodSelected,
                            )));
              },
              btnText2: "Cancel",
              onTap2: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => DispatchBooking()));
              },
            ),
          ),
        ));
  }
}

