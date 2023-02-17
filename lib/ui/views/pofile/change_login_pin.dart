import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugz/main.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';

class ChangeLoginPin extends StatefulWidget {
  const ChangeLoginPin({Key? key}) : super(key: key);

  @override
  State<ChangeLoginPin> createState() => _ChangeLoginPinState();
}

class _ChangeLoginPinState extends State<ChangeLoginPin> {
  TextEditingController idController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // final priceObj = context.watch<ProductProvider>();
    // pickUpType = priceObj.priceLists;

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
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0),
          child: Form(
            key: _formKey,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // Package Description

              const Text(
                'Change Login Pin',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                enabled: true,
                controller: idController,
                label: 'User ID',
                keyboardType: TextInputType.number,
              ),
              const SizedBox(width: 10),
              //Pickup address
              CustomTextField(
                enabled: true,
                controller: passwordController,
                label: 'New Pin',
                keyboardType: TextInputType.text,
              ),
              const SizedBox(
                height: 20.0,
              ),
              CustomTextField(
                enabled: true,
                controller: cPasswordController,
                label: 'Confirm Pin',
                keyboardType: TextInputType.text,
              ),
                  const SizedBox(
                    height: 20.0,
                  ),
              CustomButtonWidget(
                btnText: 'Change',
                onTap: () {
                  if (_formKey.currentState!.validate()) {}
                },
                btnColor: Color(0xff9B51E0),
              ),

                  SizedBox(
                    height: 20,
                  ),
                  CustomButtonWidget(
                    btnText: 'Home',
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Homepage()));
                    },
                    btnColor: Color(0xff9B51E0),
                  )
            ]),
          ),
        ),
      ),
    );
  }
}
