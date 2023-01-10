import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:plugz/main.dart';
import 'package:plugz/pages/expences_ontime.dart';
import 'package:plugz/ui/widgets/custom_button_widget.dart';
import 'package:plugz/utils/validatorScreen.dart';

class ConfirmErrandBooking extends StatelessWidget {
  ConfirmErrandBooking(
      {super.key,
      this.errandTypeSelected,
      this.paymentMethodSelected,
      this.address,
      this.errandDetail,
      this.price,
      this.pickupDateTime});

  final String? errandTypeSelected;
  final String? paymentMethodSelected;
  final String? address;
  final String? errandDetail;
  final dynamic pickupDateTime;
  final int? price;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              const Text(
                'Confirm Booking',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 40,
              ),
              const Text(
                'Errand Type',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                '$errandTypeSelected',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),

              const SizedBox(
                height: 20,
              ),
              Text(
                'Address',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                '$address',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),

              const SizedBox(
                height: 20,
              ),
              const Text(
                'Errand Details',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                '$errandDetail',
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),

              SizedBox(
                height: 20,
              ),

              const Text(
                'Date and Time',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),

              Row(
                children: [
                  Text(
                    '${pickupDateTime.year}/${pickupDateTime.month}/${pickupDateTime.day}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Text(
                    '${pickupDateTime.hour.toString().padLeft(2, '0')}:${pickupDateTime.minute.toString().padLeft(2, '0')}',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),

              SizedBox(
                height: 20,
              ),
              const Text(
                'Payment Summary',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              SizedBox(height: 10),

              Row(
                children: [
                  const Text(
                    'Total',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Expanded(child: Container()),
                  Text(
                    '$price',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                ],
              ),

              SizedBox(height: 20.0),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButtonWidget(
                      btnText: 'Pay with $paymentMethodSelected',
                      onTap: () {},
                      btnColor: Color(0xff9B51E0)),
                  CustomButtonWidget(
                      btnText: 'Cancel',
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Homepage()));
                      },
                      btnColor: Colors.black),
                ],
              ),

              const SizedBox(height: 20.0),
              //the card container

              //the three dot
            ],
          ),
        ),
      )),
    );
  }
}
