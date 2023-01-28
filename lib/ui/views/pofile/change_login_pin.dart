import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../widgets/custom_button_widget.dart';
import '../../widgets/custom_textfield_widget.dart';


class ChangeLoginPin extends StatefulWidget {
  const ChangeLoginPin({Key? key}) : super(key: key);

  @override
  State<ChangeLoginPin> createState() => _ChangeLoginPinState();
}

class _ChangeLoginPinState extends State<ChangeLoginPin> {

  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  late final KeyboardKey keyboardKey;

  String defaultPhoneNumber = '09000000000';
  String defaultEmail = 'email@gmail.com';
  bool isVisible = false;
  bool isVisible2 = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff9B51E0),
        title: const Text('Phone No./Change Email'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const SizedBox(height: 20),
              // user Id
              const Text(
                'Phone',
                textAlign: TextAlign.left,
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),

              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:[
                  Text(
                    defaultPhoneNumber,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),

                  IconButton(
                      onPressed: () {
                        showEditDialogBox(
                          phoneController,
                          'Edit Phone No.',
                          TextInputType.number,
                          true,
                              (){

                            if(phoneController.text.isEmpty) {
                              return;
                            }
                            else if(phoneController.text.isNotEmpty){
                              setState(() {
                                defaultPhoneNumber = phoneController.text;
                                isVisible = true;
                                Navigator.pop(context);
                              });
                            }

                          },
                          'Edit Phone Number',
                        );
                      },
                      icon: Icon(Icons.edit),
                      color: const Color(0xff9B51E0)),
                ],
              ),

              const Divider(
                thickness:
                1,
                // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),



              const SizedBox(height: 20),
              // name
              const Text(
                'Email',
                textAlign: TextAlign.left,
                style:
                TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    defaultEmail,
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  IconButton(
                      onPressed: () {
                        showEditDialogBox(
                          emailController,
                          'email address',
                          TextInputType.emailAddress,
                          true,
                              (){
                            if(emailController.text.isEmpty) {
                              return;
                            }
                            else if(emailController.text.isNotEmpty){
                              setState(() {
                                defaultEmail = emailController.text;
                                isVisible = true;
                                Navigator.pop(context);
                              });
                            }

                          },
                          'Edit email address',
                        );
                      },
                      icon: Icon(Icons.edit),
                      color: const Color(0xff9B51E0)),
                ],
              ),
              const Divider(
                thickness:
                1,
                // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),
              Visibility(
                visible: isVisible,
                child:CustomButtonWidget(
                    btnText: 'Change',
                    onTap: (){
                      //future builder

                    },
                    btnColor: const Color(0xff9B51E0)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  showEditDialogBox(TextEditingController controller,
      String label,
      TextInputType keyboardType,
      bool enabled,
      VoidCallback voidCallback,
      String changeTitle,
      ) {
    return showDialog(
        context: context,
        builder: (ctx) =>
            AlertDialog(
              title: Text(changeTitle),

              content: Container(
                height: 50,
                width: 800,
                child: Column(
                  children: [
                    Expanded(child:
                    CustomTextField(
                        controller: controller,
                        label: label,
                        keyboardType: keyboardType,
                        enabled: enabled
                    ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  children: [
                    CustomButtonWidget(
                        btnText: 'ok',
                        onTap: voidCallback,
                        btnColor: const Color(0xff9B51E0)),
                    Expanded(child: const SizedBox(width: 20,)),
                    CustomButtonWidget(
                        btnText: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                        btnColor: const Color(0xff9B51E0))
                  ],
                )

              ],
            ));
  }

}


