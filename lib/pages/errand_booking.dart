import 'package:flutter/material.dart';
import 'package:plugz/pages/errand_confirm_booking.dart';
import 'package:plugz/pages/expences_ontime.dart';

class ErrandBooking extends StatefulWidget {
  const ErrandBooking({Key? key}) : super(key: key);

  @override
  State<ErrandBooking> createState() => _ErrandBooking();
}

class _ErrandBooking extends State<ErrandBooking> {


  _ErrandBooking(){
    errandTypeSelected = errandType[0];
    paymentMethodSelected = paymentMethod[0];
  }
  List errandType = ["Select an Errand", "Errand1", "Errand2"];
  String errandTypeSelected = "";



  List paymentMethod = ["Wallet", "Card", "Cash"];
  String paymentMethodSelected = "";

  TextEditingController address = TextEditingController();
  TextEditingController errandDetail = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();

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

                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20),
                    color: Color(0xFFB781E9),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/errandbooking.png',
                          height: 100,
                          width: 100,
                        ),

                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Errand Booking',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), ),

                              SizedBox(height: 10),
                              Text(
                                'What task do you need help with?',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white), ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  //=======================Payment Method==================
                  const Text(
                    'Errand Type',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                  DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                    hint: const Text('Select Errand Type'),
                    isExpanded: true,
                    iconSize: 36,
                    value: errandTypeSelected,

                    onChanged: (newValue) {
                      setState(() {
                        errandTypeSelected = newValue as String;
                      });
                    },
                    items: errandType.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),

                  //the card container
                  Form(
                      key: _formKey,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          SizedBox(height: 20),
                          TextFormField(
                            controller: address,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else { return null; }
                            },
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              //hintText: 'Drop off Detail',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 10.0, bottom: 10.0),
                                labelText: 'Address'),
                          ),

                          SizedBox(height: 20),
                          TextFormField(
                            controller: errandDetail,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else { return null; }
                            },
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              //hintText: 'Drop off Detail',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 10.0, bottom: 10.0),
                                labelText: 'Errand Details'),
                          ),


                          SizedBox(height: 20),
                          TextFormField(
                            controller: date,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else { return null; }
                            },
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              //hintText: 'Drop off Detail',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 10.0, bottom: 10.0),
                                labelText: 'Date'),
                          ),

                          SizedBox(height: 20),
                          TextFormField(
                            controller: time,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "* Required";
                              } else { return null; }
                            },
                            keyboardType: TextInputType.text,
                            decoration: const InputDecoration(
                              //hintText: 'Drop off Detail',
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 1.0)),
                                isDense: true,
                                contentPadding: EdgeInsets.only(
                                    left: 11.0, top: 10.0, bottom: 10.0),
                                labelText: 'Time'),
                          ),



                          SizedBox(height: 40,),

                          //=======================Payment Method==================
                          const Text(
                            'Payment Method',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                          DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                            hint: const Text('Select Payment Method'),
                            isExpanded: true,
                            iconSize: 36,
                            value: paymentMethodSelected,

                            onChanged: (newValue) {
                              setState(() {
                                paymentMethodSelected = newValue as String;
                              });
                            },
                            items: paymentMethod.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
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
                              if (_formKey.currentState!.validate()) {

                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmErrandBooking()));
                              }},
                            child: Container(
                              height: 50,
                              child: const Center(
                                  child:
                                  Text("Priview",
                                      style: TextStyle(fontSize: 16))
                              ),
                            ),
                          ),

                          SizedBox(height: 20.0),
                        ],
                      )),
                  //the three dot
                ],              ),
            ),
          )),

    );
  }

}



