import 'package:flutter/material.dart';
import 'package:plugz/pages/expences_ontime.dart';
import 'package:plugz/ui/views/errand/errand_confirm_booking.dart';
import 'package:plugz/ui/widgets/custom_button_widget.dart';
import 'package:plugz/ui/widgets/custom_textfield_widget.dart';

class ErrandBooking extends StatefulWidget {
  const ErrandBooking({Key? key}) : super(key: key);

  @override
  State<ErrandBooking> createState() => _ErrandBooking();
}

class _ErrandBooking extends State<ErrandBooking> {
  _ErrandBooking() {
    errandTypeSelected = errandType[0];
    paymentMethodSelected = paymentMethod[0];
  }
  List errandType = ["Select an Errand", "Errand1", "Errand2"];
  String errandTypeSelected = "";

  List paymentMethod = ["Wallet", "Card", "Cash"];
  String paymentMethodSelected = "";

  TextEditingController address = TextEditingController();
  TextEditingController errandDetail = TextEditingController();
  DateTime pickupDateTime = DateTime.now();
  int? price;

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
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'What task do you need help with?',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 20),

              //=======================Errand Type==================
              const Text(
                'Errand Type',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              DropdownButton(
                icon: const Icon(Icons.arrow_drop_down),
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
                      CustomTextField(
                          controller: address,
                          label: 'Address',
                          keyboardType: TextInputType.text,
                          enabled: true),

                      SizedBox(height: 5),

                      CustomTextField(
                          controller: errandDetail,
                          label: "Errand Details",
                          keyboardType: TextInputType.text,
                          enabled: true),

                      SizedBox(height: 5),
                      //Pickup date and time
                      Column(
                        children: [
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                children: [
                                  //Pick date
                                  InkWell(
                                    onTap: () async {
                                      final date = await pickDate();
                                      if (date == null) return;
                                      final newDateTime = DateTime(
                                          date.year,
                                          date.month,
                                          date.day,
                                          pickupDateTime.hour,
                                          pickupDateTime.minute);

                                      setState(() {
                                        pickupDateTime = newDateTime;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Date'),
                                        Text(
                                          '${pickupDateTime.year}/${pickupDateTime.month}/${pickupDateTime.day}',
                                          style: const TextStyle(
                                              fontSize: 15.5,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),

                                  SizedBox(width: 80.0),
                                  //Pick Time
                                  InkWell(
                                    onTap: () async {
                                      final time = await pickTime();
                                      if (time == null) return;
                                      final newDateTime = DateTime(
                                          pickupDateTime.year,
                                          pickupDateTime.month,
                                          pickupDateTime.day,
                                          time.hour,
                                          time.minute);
                                      setState(() {
                                        pickupDateTime = newDateTime;
                                      });
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text('Time'),
                                        Text(
                                          '${pickupDateTime.hour.toString().padLeft(2, '0')}:${pickupDateTime.minute.toString().padLeft(2, '0')}',
                                          style: const TextStyle(
                                              fontSize: 15.5,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Divider(
                            thickness:
                                1, // thickness of the line.// empty space to the trailing edge of the divider.
                            color: Colors.grey,
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 10.0,
                      ),

                      //=======================Payment Method==================
                      const Text(
                        'Payment Method',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.grey),
                      ),
                      DropdownButton(
                        icon: const Icon(Icons.arrow_drop_down),
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

                      CustomButtonWidget(
                        btnText: "Priview",
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmErrandBooking(
                                          errandTypeSelected:
                                              errandTypeSelected,
                                          paymentMethodSelected:
                                              paymentMethodSelected,
                                          address: address.text,
                                          errandDetail: errandDetail.text,
                                          price: price,
                                          pickupDateTime: pickupDateTime,
                                        )));
                          }
                        },
                        btnColor: const Color(0xff9B51E0),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  )),
              //the three dot
            ],
          ),
        ),
      )),
    );
  }

//Pick date method
  Future<DateTime?> pickDate() => showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2030),
      );

//Pick Time method
  Future<TimeOfDay?> pickTime() => showTimePicker(
      context: context,
      initialTime:
          TimeOfDay(hour: pickupDateTime.hour, minute: pickupDateTime.minute));
}
