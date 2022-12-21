
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatelessWidget {



  const CustomButtonWidget({super.key, required this.btnText, required this.onTap, required this.btnColor});

  final String btnText;
  final VoidCallback onTap;
  final Color btnColor;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      style: ButtonStyle(
          foregroundColor:
          MaterialStateProperty.all<Color>(
              Colors.white),
          backgroundColor:
          MaterialStateProperty.all<Color>(btnColor),
          shape: MaterialStateProperty.all<
              RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                BorderRadius.circular(5.0),
              ))),
      onPressed: () => { onTap()},
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 25.0),
        child:  Center(
            child: Text(btnText,
                style: TextStyle(fontSize: 16))),
      ),
    );
  }
}
