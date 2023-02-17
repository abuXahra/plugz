import 'package:flutter/material.dart';
import 'package:plugz/ui/widgets/custom_button_widget.dart';

class DispatchWidget extends StatelessWidget {
  const DispatchWidget(
      {Key? key,
      this.pickupAddress,
      this.deliveryAddress,
      this.receiverTelephone,
      this.packageDescription,
      this.imageUrl,
      this.price,
      this.paymentMethodSelected,
      required this.btnText,
      required this.btnText2,
      required this.onTap,
      required this.onTap2,
      required this.title,
      this.pickupDateTime,
      this.dropOffDateTime})
      : super(key: key);

  final String? pickupAddress;
  final String? deliveryAddress;
  final String? receiverTelephone;
  final String? packageDescription;
  final dynamic pickupDateTime;
  final dynamic dropOffDateTime;
  final String? imageUrl;
  final double? price;
  final String? paymentMethodSelected;
  final String btnText;
  final String btnText2;
  final String? title;
  final VoidCallback onTap;
  final VoidCallback onTap2;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Center(
          child: Text(
            '$title',
            textAlign: TextAlign.left,
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          thickness:
              2, // thickness of the line.// empty space to the trailing edge of the divider.
          color: Color(0xff9B51E0),
        ),

        const Text(
          'Pickup Address',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          '$pickupAddress',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),

        const SizedBox(
          height: 20,
        ),
        const Text(
          'Delivery Address',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          '$deliveryAddress',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),

        const SizedBox(
          height: 20,
        ),
        const Text(
          'Package Description',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          '$packageDescription',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),

        const SizedBox(
          height: 20,
        ),
        const Text(
          'Pickup Time',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Text(
          '$pickupDateTime',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),

        const SizedBox(
          height: 20,
        ),
        const Text(
          'Delivery Time',
          textAlign: TextAlign.left,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(height: 10),
        Text(
          '$dropOffDateTime',
          textAlign: TextAlign.left,
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        const SizedBox(
          height: 20,
        ),

        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Paymeny Method',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                SizedBox(height: 10),
                Text(
                  '$paymentMethodSelected',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            ),
            Expanded(child: Container()),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Amount',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.grey),
                ),
                const SizedBox(height: 10),
                Text(
                  'N $price',
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black),
                ),
              ],
            ),
          ],
        ),

        const Divider(
          thickness:
              2, // thickness of the line.// empty space to the trailing edge of the divider.
          color: Color(0xff9B51E0),
        ),

        // const Text(
        //   'Paymeny Method',
        //   textAlign: TextAlign.left,
        //   style:
        //   TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        // ),
        // SizedBox(height: 10),
        // Text(
        //   '$paymentMethodSelected',
        //   textAlign: TextAlign.left,
        //   style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18,
        //       color: Colors.black),
        // ),
        //
        // const Text(
        //   'Amount',
        //   textAlign: TextAlign.left,
        //   style:
        //   TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        // ),
        // const SizedBox(height: 10),
        // Text(
        //   'N $price',
        //   textAlign: TextAlign.left,
        //   style: const TextStyle(
        //       fontWeight: FontWeight.bold,
        //       fontSize: 18,
        //       color: Colors.black),
        // ),
        const SizedBox(height: 20.0),
        Row(children: [
          CustomButtonWidget(
            btnText: btnText,
            onTap: onTap,
            btnColor: Color(0xff9B51E0),
          ),
          Expanded(child: Container()),
          CustomButtonWidget(
            btnText: btnText2,
            onTap: onTap2,
            btnColor: Color(0xff9B51E0),
          ),
        ]),
        const SizedBox(height: 20.0),
        //the card container

        //the three dot
      ],
    );
  }
}
