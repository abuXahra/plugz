import 'package:flutter/material.dart';
import 'package:plugz/ui/views/dispatchbooking/dispatch_booking.dart';
import 'package:plugz/pages/expences_ontime.dart';
import 'package:plugz/utils/validatorScreen.dart';



class ExpRecurring extends StatefulWidget {
  const ExpRecurring({Key? key}) : super(key: key);

  @override
  State<ExpRecurring> createState() => _ExpOntimeState();
}

class _ExpOntimeState extends State<ExpRecurring> {


_ExpOntimeState(){
  frequencyChoose = frequency[0];
  scheduledExpensesChoose = scheduledExpenses[0];
}
List frequency = ["Daily", "Weekly", "Monthly", "Yearly"];
String frequencyChoose = "";

List scheduledExpenses= ["Select Expenses", "one", "two", "three"];
String scheduledExpensesChoose = "";

TextEditingController expenseNameController = TextEditingController();

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
                  const SizedBox(height: 20,),
                  const Text(
                    'Expenses',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black), ),

                  const SizedBox(height: 40,),
                  Row(
                    children: [
                      Column(
                        children: [
                          InkWell(
                            child:  Text('One Time', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), ),
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ExpOntime()));
                            },
                          )
                        ],
                      ),
                      const Expanded(child: SizedBox(width: 20.0,)),
                      Column(
                        children: [
                          const Text('Recurring', style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal), ),
                          const SizedBox(height: 5),
                          Container(
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color(0xff9B51E0),
                            ),
                            height: 10,
                            child: Container(),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 40,),
                  //the card container
                  Form(
                  key: _formKey,
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      TextFormField(
                        controller: expenseNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "* Required";
                          } else if (value.length<3) {
                            return "Name must be at least 3 character long";
                          } else {
                            return null;
                          }
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
                            labelText: 'Expense Name'),
                      ),

                      SizedBox(height: 40,),

                    //=======================frequency==================
                    const Text(
                    'Frequency',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                      DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                    hint: const Text('Select Payment Method'),
                    isExpanded: true,
                    iconSize: 36,
                    value: frequencyChoose,

                    onChanged: (newValue) {
                        setState(() {
                          frequencyChoose = newValue as String;
                        });
                    },
                    items: frequency.map((valueItem) {
                      return DropdownMenuItem(
                        value: valueItem,
                        child: Text(valueItem),
                      );
                    }).toList(),
                  ),
                      SizedBox(height: 20.0),

                      //=======================Add to schedule expenses==================
                      const Text(
                        'Add to Scheduled Expenses',
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey), ),
                      DropdownButton(icon: const Icon(Icons.arrow_drop_down),
                        hint: const Text('Select Expenses'),
                        isExpanded: true,
                        iconSize: 36,
                        value: scheduledExpensesChoose,

                        onChanged: (newValue) {
                          setState(() {
                            scheduledExpensesChoose = newValue as String;
                          });
                        },
                        items: scheduledExpenses.map((valueItem) {
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
                              if (frequencyChoose == 'Daily' && scheduledExpensesChoose == "one") {
                                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => DispatchBooking()));
                                      } }},
                          child: Container(
                            height: 50,
                            child: const Center(
                              child:
                                  Text("Add",
                                      style: TextStyle(fontSize: 16))
                              ),
                          ),
                          )
                    ],
                  )),
                  //the three dot
                ],              ),
            ),
          )),

    );
  }

  }


  
  