import 'package:flutter/material.dart';
import 'package:plugz/pages/expences_ontime.dart';

import 'expenses_confirm.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _Expenses();
}

class _Expenses extends State<Expenses> {


  _Expenses(){
    billTypeSelected = billType[0];
    billerSelected = biller[0];
    paymentMethodSelected = paymentMethod[0];
  }


  List billType = ["Select a bill", "bill1", "bill2"];
  String billTypeSelected = "";

  List biller = ["Biller", "Biller1", "biller2"];
  String billerSelected = "";

  List paymentMethod = ["Wallet", "Card", "Cash"];
  String paymentMethodSelected = "";

  TextEditingController amount = TextEditingController();
  TextEditingController recurringPayment = TextEditingController();


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
                    color: Color(0xFFFB8FF0),
                    child: Row(
                      children: [
                        Image.asset(
                          'images/expenses.png',
                          height: 100,
                          width: 100,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Expenses',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white), ),

                              SizedBox(height: 10),
                              Text(
                                'Easily pay your bills from a central location',
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal, color: Colors.white), ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),

                  SizedBox(height: 40),

                  //the card container
                  Form(
                      key: _formKey,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          //=======================Payment Method==================
                          const Text(
                            'Bill Type',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                          DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                            hint: const Text('Select a bill'),
                            isExpanded: true,
                            iconSize: 36,
                            value: billTypeSelected,

                            onChanged: (newValue) {
                              setState(() {
                                billTypeSelected = newValue as String;
                              });
                            },
                            items: billType.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),

                        const SizedBox(height: 20),
                          //=======================Payment Method==================
                          const Text(
                            'Biller',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                          DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                            hint: const Text('Select a biller'),
                            isExpanded: true,
                            iconSize: 36,
                            value: billerSelected,

                            onChanged: (newValue) {
                              setState(() {
                                billerSelected= newValue as String;
                              });
                            },
                            items: biller.map((valueItem) {
                              return DropdownMenuItem(
                                value: valueItem,
                                child: Text(valueItem),
                              );
                            }).toList(),
                          ),

                          SizedBox(height: 20),
                          TextFormField(
                            controller: amount,
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
                                labelText: 'Amount'),
                          ),

                          SizedBox(height: 20),

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

                          const SizedBox(height: 20,),

                          TextFormField(
                            controller: recurringPayment,
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
                                labelText: 'Recurring Payment'),
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
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ConfirmExpenses()));
                                 }},
                            child: Container(
                              height: 50,
                              child: const Center(
                                  child:
                                  Text("Preview",
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



