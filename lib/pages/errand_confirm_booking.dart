import 'package:flutter/material.dart';



import 'package:flutter/material.dart';
import 'package:plugz/main.dart';
import 'package:plugz/pages/expences_ontime.dart';
import 'package:plugz/utils/validatorScreen.dart';



class ConfirmErrandBooking extends StatefulWidget {
  const ConfirmErrandBooking({Key? key}) : super(key: key);

  @override
  State<ConfirmErrandBooking> createState() => _ConfirmErrandBooking();
}

class _ConfirmErrandBooking extends State<ConfirmErrandBooking> {


  // _DispatchBooking(){
  //   paymentMethodSelected = paymentMethod[0];
  // }
  // List paymentMethod = ["Wallet", "Card", "Cash"];
  // String paymentMethodSelected = "";
  //
  // TextEditingController pickupAddress = TextEditingController();
  // TextEditingController deliveryAddress = TextEditingController();
  // TextEditingController nameOfPackage = TextEditingController();
  // TextEditingController deliveryDate = TextEditingController();
  // TextEditingController deliveryTime = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.more_vert, color: Colors.grey,), onPressed: () {  },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle, color: Color(0xff9B51E0) ),
            tooltip: 'Comment Icon',
            onPressed: () {},
          ), //IconButton
        ], //<Wi
      ),
      body:  SafeArea(
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
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), ),
                  SizedBox(height: 40,),
                  const Text(
                    'Errand Type',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  SizedBox(height: 10),
                  const Text(
                    'Cleaning',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),


                  const SizedBox(height: 20,),
                  const Text(
                    'Address',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    'Millenium Plaza, Ahmadu Bello way, Abuja',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  const SizedBox(height: 20,),
                  const Text(
                    'Errand Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    'Office deep cleaning',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  SizedBox(height: 20,),
                  const Text(
                    'Date',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    '10-05-2022',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  SizedBox(height: 20,),
                  const Text(
                    'Time',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  SizedBox(height: 10),
                  const Text(
                    '9:00 AM',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  SizedBox(height: 20,),
                  const Text(
                    'Payment Summary',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  SizedBox(height: 10),
                                    
                  Row(
                    children: [
                      const Text(
                        'Total',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                      Expanded(child: Container()),
                      const Text(
                        '\$60',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                    ],
                  ),
                  
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ButtonStyle(
                        foregroundColor:
                        MaterialStateProperty.all<Color>(
                            Colors.white),
                        backgroundColor:
                        MaterialStateProperty.all<Color>(
                            const Color(0xff9B51E0)),
                        shape: MaterialStateProperty.all<
                            RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ))),
                    onPressed: () {
                      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
                    },
                    child: Container(
                      height: 50,
                      child: const Center(
                          child:
                          Text("Pay with wallet",
                              style: TextStyle(fontSize: 16))
                      ),
                    ),
                  ),

                  const SizedBox(height: 20.0),
                  //the card container

                  //the three dot
                ],              ),
            ),
          )),

    );
  }

}
























