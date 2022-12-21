import 'package:flutter/material.dart';
import 'package:plugz/main.dart';



class ConfirmExpenses extends StatefulWidget {
  const ConfirmExpenses({Key? key}) : super(key: key);

  @override
  State<ConfirmExpenses> createState() => _ConfirmExpenses();
}

class _ConfirmExpenses extends State<ConfirmExpenses> {


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
                    'Bill Type',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  SizedBox(height: 10),
                  const Text(
                    'Subscription',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),


                  const SizedBox(height: 20,),
                  const Text(
                    'Biller',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    'DSTV',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  const SizedBox(height: 20,),
                  const Text(
                    'Amount',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    '\$5',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black), ),

                  SizedBox(height: 20,),
                  const Text(
                    'Recurring payment',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  const SizedBox(height: 10),
                  const Text(
                    'Yes',
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
                        '\$5',
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
























