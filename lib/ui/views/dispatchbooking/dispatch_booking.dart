import 'package:flutter/material.dart';
import 'package:plugz/core/services/api.dart';
import 'package:plugz/ui/widgets/custom_textfield_widget.dart';
import '../../widgets/custom_button_widget.dart';
import 'dispatch_confirm_booking.dart';
import 'package:image_picker/image_picker.dart';

class DispatchBooking extends StatefulWidget {
  const DispatchBooking({Key? key}) : super(key: key);

  @override
  State<DispatchBooking> createState() => _DispatchBooking();
}

class _DispatchBooking extends State<DispatchBooking> {
  _DispatchBooking() {
    paymentMethodSelected = paymentMethod[0];
    pickUpTypeSelected = pickUpType[0];
  }

  List paymentMethod = ["Wallet", "Card", "Cash"];
  String paymentMethodSelected = "";

  List pickUpType = ["Instant", "Schedule", "Instant Car", "Schedule 6 hours"];
  String pickUpTypeSelected = "";

  final TextEditingController _pickupAddress = TextEditingController();
  final TextEditingController _deliveryAddress = TextEditingController();
  final TextEditingController _receiverTelephone = TextEditingController();
  final TextEditingController _packageDescription = TextEditingController();
  double pickupLongitude = 7.4084544;
  double pickupLatitude = 9.0886462;
  double dropoffLongitude = 7.40844166666667;
  double dropoffLatitude = 9.08902166666667;
  int countryId = 234;
  bool isVisible = false;

  DateTime pickupDateTime = DateTime.now();
  DateTime dropOffDateTime = DateTime.now();
  //DateTime(2000, 01, 01, 1, 01); // year month day hour minute

  String? imageUrl;
  int? price;

  Future<void> newPrice() async {
    Api.instance.getPrice(pickupLongitude, pickupLatitude, dropoffLongitude,
        dropoffLatitude, countryId);
  }

  final _formKey = GlobalKey<FormState>();

  //variables for mage picker
  XFile? _imageFile;
  final ImagePicker _picker = ImagePicker();

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   context.read<ProductProvider>().getAllPrices();
  // }

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
        body:
            // priceObj.isLoading == false
            //     ? const Center(
            //         child: CircularProgressIndicator(
            //           color: Color(0xff9B51E0),
            //         ),
            //       )
            //     :
            SingleChildScrollView(
                child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(10),
              color: Colors.blue,
              child: Row(
                children: [
                  Image.asset(
                    'images/dispatchlogo.png',
                    height: 60,
                    width: 60,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'Dispatch Booking',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Book same day deliveries to locations of your choices',
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
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.0),
                    //the card container
                    Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Package Description
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    enabled: true,
                                    controller: _packageDescription,
                                    label: 'Package Description',
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                itemImage(),
                              ],
                            ),
                            //=======================Pickup Type==================
                            const Text(
                              'Pickup Type',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey),
                            ),
                            DropdownButton(
                              icon: const Icon(Icons.arrow_drop_down),
                              hint: const Text('Pickup Type'),
                              isExpanded: true,
                              iconSize: 36,
                              value: pickUpTypeSelected,
                              onChanged: (newValue) {
                                setState(() {
                                  pickUpTypeSelected = newValue as String;
                                });

                                pickUpTypeSelected == pickUpType[0] ||
                                        pickUpTypeSelected == pickUpType[2]
                                    ? isVisible = false
                                    : isVisible = true;
                                // if (pickUpTypeSelected == pickUpType[0]) {
                                //   isVisible = false;
                                // } else {
                                //   isVisible = true;
                                // }
                              },
                              items: pickUpType.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                            ),

                            // Pickup Information
                            const Text(
                              'Pickup Info',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            //Pickup address
                            CustomTextField(
                              enabled: true,
                              controller: _pickupAddress,
                              label: 'Address',
                              keyboardType: TextInputType.text,
                            ),

                            //Pickup date and time
                            Visibility(
                              visible: isVisible,
                              child: Column(
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

                                          SizedBox(width: 20.0),
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
                            ),

                            SizedBox(
                              height: 10.0,
                            ),
                            // Drop Off Information
                            const Text(
                              'Drop Off Info',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            //Drop off address
                            CustomTextField(
                              enabled: true,
                              controller: _deliveryAddress,
                              label: 'Address',
                              keyboardType: TextInputType.text,
                            ),

                            //Drop off date and time
                            Visibility(
                              visible: isVisible,
                              child: Column(
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
                                                  dropOffDateTime.hour,
                                                  dropOffDateTime.minute);

                                              setState(() {
                                                dropOffDateTime = newDateTime;
                                              });
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('Date'),
                                                Text(
                                                  '${dropOffDateTime.year}/${dropOffDateTime.month}/${dropOffDateTime.day}',
                                                  style: const TextStyle(
                                                      fontSize: 15.5,
                                                      color: Colors.black54),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(width: 20.0),
                                          //Pick Time
                                          InkWell(
                                            onTap: () async {
                                              final time = await pickTime();
                                              if (time == null) return;
                                              final newDateTime = DateTime(
                                                  dropOffDateTime.year,
                                                  dropOffDateTime.month,
                                                  dropOffDateTime.day,
                                                  time.hour,
                                                  time.minute);
                                              setState(() {
                                                dropOffDateTime = newDateTime;
                                              });
                                            },
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text('Time'),
                                                Text(
                                                  '${dropOffDateTime.hour.toString().padLeft(2, '0')}:${dropOffDateTime.minute.toString().padLeft(2, '0')}',
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
                            ),

                            SizedBox(
                              height: 20.0,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    enabled: true,
                                    controller: _receiverTelephone,
                                    label: 'Receiver No.',
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                                const SizedBox(width: 20),
                                //=======================Payment Method==================
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Payment Method',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    DropdownButton(
                                      icon: const Icon(Icons.arrow_drop_down),
                                      hint: const Text('Select Payment Method'),
                                      isExpanded: false,
                                      iconSize: 36,
                                      value: paymentMethodSelected,
                                      onChanged: (newValue) {
                                        setState(() {
                                          paymentMethodSelected =
                                              newValue as String;
                                        });
                                      },
                                      items: paymentMethod.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(height: 20.0),
                            // priview button
                            CustomButtonWidget(
                              btnText: "Preview",
                              btnColor: Color(0xff9B51E0),
                              onTap: () {
                                if (_formKey.currentState!.validate()) {
                                  newPrice();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ConfirmDispatchBooking(
                                                pickupAddress:
                                                    _pickupAddress.text,
                                                deliveryAddress:
                                                    _deliveryAddress.text,
                                                receiverTelephone:
                                                    _receiverTelephone.text,
                                                packageDescription:
                                                    _packageDescription.text,
                                                pickupDateTime: pickupDateTime,
                                                dropOffDateTime:
                                                    dropOffDateTime,
                                                imageUrl: imageUrl,
                                                price: price,
                                                paymentMethodSelected:
                                                    paymentMethodSelected,
                                                pickUpType: pickUpTypeSelected,
                                              )));
                                }
                              },
                            ),
                          ],
                        )),
                  ],
                ),
              ),
            ),
          ],
        )));
  }

//Item Image picking function
  Widget itemImage() {
    return Stack(
      children: [
        CircleAvatar(
          radius: 30.0,
          backgroundImage: AssetImage("images/placeholder.jpg"),
        ),
        Positioned(
          bottom: 2.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (builder) => cameraBottomSheet());
            },
            child: Icon(
              Icons.camera_alt,
              color: Color(0xff9B51E0),
            ),
          ),
        ),
      ],
    );
  }

  // camera bottom sheet method
  Widget cameraBottomSheet() {
    return Container(
      height: 105,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            'Choose Item Photo ',
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //E1EAF1
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Color(0xffE1EAF1),
                child: IconButton(
                  icon: const Icon(Icons.camera, color: Color(0xff9B51E0)),
                  tooltip: 'take a shot',
                  onPressed: () {
                    _getFromCamera();
                  },
                ),
              ),

              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Color(0xffE1EAF1),
                child: IconButton(
                  icon: const Icon(Icons.image, color: Color(0xff9B51E0)),
                  tooltip: 'take a shot',
                  onPressed: () {
                    _getFromGallery();
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

//take photo method
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.pickImage(source: source);
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }

  void _getFromCamera() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    Navigator.pop(context);
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void _getFromGallery() async {
    XFile? pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    Navigator.pop(context);
    setState(() {
      _imageFile = pickedFile;
    });
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
