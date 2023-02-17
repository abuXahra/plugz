import 'package:flutter/material.dart';

import '../../../main.dart';
import '../../widgets/custom_button_widget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff9B51E0),
        title: const Text('Personal Infomation'),
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
                'User ID',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              // ignore: prefer_const_constructors


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'uytyut676gffasd38809nhbhgfcf',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Container(
                    child: Row(children: [
                      Image.asset(
                        'images/badge.png',
                        height: 20,
                        width: 30,
                      ),
                      const Text('Verified')
                    ]),
                  )
                ],
              ),


              const Divider(
                thickness:
                    1, // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),
              SizedBox(height: 10),
              // name
              const Text(
                'Name',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 10),
              // ignore: prefer_const_constructors
              Text(
                'Akin Dev',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const Divider(
                thickness:
                    1, // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),
              SizedBox(
                height: 10,
              ),
              // phone
              const Text(
                'Phone No.',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              // ignore: prefer_const_constructors

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '09000000000',
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Container(
                    child: Row(children: [
                      Image.asset(
                        'images/badge.png',
                        height: 20,
                        width: 30,
                      ),
                      const Text('Verified')
                    ]),
                  )
                ],
              ),

              const Divider(
                thickness:
                    1, // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),
              // email
              const Text(
                'Email',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              // ignore: prefer_const_constructors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'contact@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black),
                  ),
                  Container(
                    child: Row(children: [
                      Image.asset(
                        'images/badge.png',
                        height: 20,
                        width: 30,
                      ),
                      const Text('Verified')
                    ]),
                  )
                ],
              ),

              const Divider(
                thickness:
                    1, // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),

              const SizedBox(height: 10),
              // Organization name
              const Text(
                'Organization Name',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              // ignore: prefer_const_constructors
              Text(
                'Cloudware Ltd',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),
              const Divider(
                thickness:
                    1, // thickness of the line.// empty space to the trailing edge of the divider.
                color: Color.fromARGB(142, 155, 81, 224),
              ),
              SizedBox(
                height: 10,
              ),
              // Organization name
              const Text(
                'Servbice ID',
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              const SizedBox(height: 5),
              // ignore: prefer_const_constructors
              Text(
                'onjmnghu787ijbhgffzq23es4df',
                textAlign: TextAlign.left,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black),
              ),

              SizedBox(height: 20,),
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

            ],
          ),
        ),
      ),
    );
  }
}
