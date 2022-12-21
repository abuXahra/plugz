import 'package:flutter/material.dart';
import 'package:plugz/ui/views/dispatchbooking/dispatch_booking.dart';
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
      home: DispatchBooking(),
    );
  }
}
