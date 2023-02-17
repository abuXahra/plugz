

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plugz/ui/widgets/custom_button_widget.dart';

import '../core/services/api.dart';

class MyHomePageState extends StatefulWidget {
  const MyHomePageState({Key? key}) : super(key: key);

  @override
  State<MyHomePageState> createState() => _MyHomePageStateState();
}

class _MyHomePageStateState extends State<MyHomePageState> {


  final ImagePicker imagePicker = ImagePicker();
  String imagepath = "";
  String base64String="";

  bool isVisible = false;



  //  //function to pick image from camera convert to base64
  openCamera()async{
    try{
      var pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
      if(pickedFile != null){
        imagepath = pickedFile.path;
       print("==============IMAGE PATH: $imagepath==================");

       final File imageFile = File(imagepath);
       Uint8List imageBytes = await imageFile.readAsBytes();
       print(imageBytes);

       setState(() {
         base64String = base64.encode(imageBytes);
       });
       print("=========BASE64: $base64String===================");
      }else{
        print('No Image is Selected');
      }
    }catch(e){
      print('No Image is Selected');
    }
  }

  //function to pick image from Gallery convert to base64
  openGallery()async{
    try{
      var pickedFile = await imagePicker.pickImage(source: ImageSource.gallery);
      if(pickedFile != null){
        imagepath = pickedFile.path;
        print(imagepath);

        final File imageFile = File(imagepath);
        Uint8List imageBytes = await imageFile.readAsBytes();
        print(imageBytes);

        setState(() {
          base64String = base64.encode(imageBytes);
        });
        print(base64String);
      }else{
        print('No Image is Selected');
      }
    }catch(e){
      print('No Image is Selected');
    }
  }


  //for faceliveliness api endpoint
  Future<void> newPicture() async {
    Api.instance.postNewPicture(imagepath);
  }

  // Widget showImage(BuildContext context){
  //   return Container(
  //     height: 300,
  //     decoration: BoxDecoration(
  //       image: DecorationImage(image:  MemoryImage(base64Decode(base64String)))
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  itemImage(),
                  Container(width: double.infinity,),
                  SizedBox(height: 20,),

                  //display image if imagepath is not null
                  imagepath != "" ? Image.file(File(imagepath), height: 200,): const Text(""),
                  SizedBox(height: 20,),

                  //hide save to Api button if imagepath is null
                  Visibility(
                    visible: isVisible,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: CustomButtonWidget(
                          btnText: 'Save to Api Endpoint',
                          onTap: (){
                            newPicture();
                          },
                        btnColor: const Color(0xff9B51E0),
                      ),
                    ),
                  )
                  //before encoding


                  // const Text('Decoded Image'),
                  // imagepath != "" ? showImage(context): Text('No Image Selected')
                ],
              ),
            ),
          )),
    );
  }




  //Item Image picking function
  Widget itemImage() {
    return Stack(
      children: [
        InkWell(
           onTap: () {
             showModalBottomSheet(
               context: context,
               builder: (builder) => cameraBottomSheet(),
             );
           },
           child: CircleAvatar(
            radius: 100.0,
            backgroundImage:  AssetImage("images/placeholder.jpg"),
        ),
         ),
        Positioned(
          bottom: 2.0,
          right: 10.0,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (builder) => cameraBottomSheet(),
              );
            },
            child: const Icon(
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
          const Text(
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
                    openCamera();

                    imagepath != "" ? isVisible = false : isVisible = true;
                  },
                ),
              ),

              SizedBox(width: 20.0),
              CircleAvatar(
                radius: 30.0,
                backgroundColor: Color(0xffE1EAF1),
                child: IconButton(
                  icon: const Icon(Icons.image, color: Color(0xff9B51E0)),
                  tooltip: 'Choose from gallery',
                  onPressed: () {
                    openGallery();
                    imagepath != "" ? isVisible = false : isVisible = true;
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }




}
