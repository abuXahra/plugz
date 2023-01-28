import 'package:flutter/material.dart';
import 'package:plugz/ui/views/pofile/change_login_pin.dart';
import 'package:plugz/ui/views/pofile/change_phone_email.dart';
import 'package:plugz/ui/views/pofile/personal_info.dart';
import 'package:plugz/ui/views/dispatch/dispatch_booking.dart';
import 'package:plugz/ui/views/errand/errand_booking.dart';
import 'package:plugz/ui/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';
import 'core/view_model/dispatch_view_model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "plugz",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Homepage')),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButtonWidget(
                btnText: "Dispatch Booking",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DispatchBooking()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(
                btnText: "Errand Booking",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ErrandBooking()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(
                btnText: "Personal Info",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PersonalInfo()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(
                btnText: "Change Phone/Email",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangeEmailandPhone()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(
                btnText: "Change Login Pin",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ChangeLoginPin()));
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButtonWidget(
                btnText: "Dispactch",
                btnColor: const Color(0xff9B51E0),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DispatchBooking()));
                },
              ),
            ],
          ),
        ));
  }
}


