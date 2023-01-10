import 'package:flutter/material.dart';

import '../../widgets/dispatch_widget.dart';
import 'dispatch_booking.dart';

class DispatchedBooked extends StatelessWidget {
  const DispatchedBooked(
      {Key? key,
      this.pickupAddress,
      this.deliveryAddress,
      this.receiverTelephone,
      this.packageDescription,
      this.imageUrl,
      this.price,
      this.paymentMethodSelected,
      this.pickUpType,
      this.pickupDateTime,
      this.dropOffDateTime})
      : super(key: key);

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
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Column(
              children: [
                DispatchWidget(
                  title: 'Dispatch Booked',
                  pickupAddress: pickupAddress,
                  deliveryAddress: deliveryAddress,
                  receiverTelephone: receiverTelephone,
                  packageDescription: packageDescription,
                  pickupDateTime: pickupDateTime,
                  dropOffDateTime: dropOffDateTime,
                  imageUrl: imageUrl,
                  price: price,
                  paymentMethodSelected: paymentMethodSelected,
                  btnText: "Drop Off",
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DispatchBooking()));
                  },
                  btnText2: "Cancel",
                  onTap2: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DispatchBooking()));
                  },
                ),
              ],
            ),
          ),
        ));
  }
}
