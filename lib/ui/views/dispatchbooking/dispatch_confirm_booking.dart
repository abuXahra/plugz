import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:plugz/core/models/dispatch_model.dart';
import 'package:plugz/ui/views/dispatchbooking/dispatch_booking.dart';
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
    this.pickupDateTime,
    this.dropOffDateTime,
  }) : super(key: key);

  final String? pickupAddress;
  final String? pickUpType;
  final String? deliveryAddress;
  final String? receiverTelephone;
  final String? packageDescription;
  final dynamic pickupDateTime;
  final dynamic dropOffDateTime;
  final String? imageUrl;
  final int? price;
  final String? paymentMethodSelected;

  Future<void> newRide() async {
    Api.instance.postNewRide(
        "", //typeOfRide
        packageDescription, //packageDescription
        imageUrl, //packageImage
        '', // senderId
        pickUpType, //pickupType,
        '$pickupDateTime', //pickupDateTime,
        0.0, // pickupLongitude,
        0.0, //pickupLatitude,
        pickupAddress, //pickupAddress
        '', //receiverId,
        receiverTelephone, //receiverTelephone
        '$dropOffDateTime', //dropoffDateTime,
        0.0, // dropoffLongitude,
        0.0, //dropoffLatitude,
        deliveryAddress, //dropoffAddress
        paymentMethodSelected, // paymentType,
        price //priceList
        );
  }

  // Future<void> newRide() async {
  //   postNewRide()
  // Dispatch dispatch = Dispatch(
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
        body:
            // Consumer<DataClass>(builder: (context, data, child) {
            //   return data.loading
            //       ? Center(
            //           child: Container(
            //             child: SpinKitThreeBounce(
            //               itemBuilder: (BuildContext context, int index) {
            //                 return DecoratedBox(
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(15),
            //                     color: index.isEven
            //                         ? Color(0xff9B51E0)
            //                         : Color(0xff9B51E0),
            //                   ),
            //                 );
            //               },
            //             ),
            //           ),
            //         )
            //       :
            SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: DispatchWidget(
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

//
//
// Future<void> _newRide() async {
//
//   Dispatch dispatch = Dispatch(
//       typeOfRide: "",
//       packageDescription: _packageDescription.text.trim(),
//       packageImage: imageUrl,
//       senderId: "",
//       pickupType: "",
//       pickupDateTime: "${_deliveryDate.text} ${_deliveryTime.text}",
//       pickupLongitude: 22,
//       pickupLatitude: 23,
//       pickupAddress: _pickupAddress.text,
//       receiverId: "",
//       receiverTelephone: _receiverTelephone.text,
//       dropoffDateTime: "${_deliveryDate.text} ${_deliveryTime.text}",
//       dropoffLongitude: 20,
//       dropoffLatitude: 21,
//       dropoffAddress: _deliveryAddress.text,
//       paymentType: paymentMethodSelected,
//       price: price);
//
//   var provider = Provider.of<DataClass>(context, listen: false);
//   await provider.postData(dispatch);
//   if (provider.isBack) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) =>  DispatchBooking()),
//     );
//   }
// }

// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// const SizedBox(height: 20),
// const Text(
// 'Confirm',
// textAlign: TextAlign.left,
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// color: Colors.black),
// ),
// const SizedBox(
// height: 40,
// ),
// const Text(
// 'Pickup Address',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// const SizedBox(height: 10),
// Text(
// '$pickupAddress',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// const SizedBox(
// height: 20,
// ),
// const Text(
// 'Delivery Address',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// const SizedBox(height: 10),
// Text(
// '$deliveryAddress',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// const SizedBox(
// height: 20,
// ),
// const Text(
// 'Package Description',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// const SizedBox(height: 10),
// Text(
// '$packageDescription',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// const SizedBox(
// height: 20,
// ),
// const Text(
// 'Delivery Date',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// const SizedBox(height: 10),
// Text(
// '$deliveryDate',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// const SizedBox(
// height: 20,
// ),
// const Text(
// 'Delivery Time',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// SizedBox(height: 10),
// Text(
// '$deliveryTime',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// SizedBox(height: 10),
// Text(
// '$paymentMethodSelected',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
//
// const SizedBox(
// height: 20,
// ),
// const Text(
// 'Payment Summary',
// textAlign: TextAlign.left,
// style:
// TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
// ),
// const SizedBox(height: 10),
// Text(
// '$price',
// textAlign: TextAlign.left,
// style: const TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 18,
// color: Colors.black),
// ),
// const SizedBox(height: 20.0),
//
// ElevatedButton(
// style: ButtonStyle(
// foregroundColor:
// MaterialStateProperty.all<Color>(Colors.white),
// backgroundColor: MaterialStateProperty.all<Color>(
// const Color(0xff9B51E0)),
// shape: MaterialStateProperty.all<
//     RoundedRectangleBorder>(
// RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(5.0),
// ))),
// onPressed: () {
// _newRide();
// Navigator.pushReplacement(context, MaterialPageRoute(
// builder: (context) => DispatchBooking()));
//
// },
// child: Container(
// height: 50,
// child: const Center(
// child: Text("Confirm Booking",
// style: TextStyle(fontSize: 16))),
// ),
// ),
//
// const SizedBox(height: 20.0),
// //the card container
//
// //the three dot
// ],
// )
