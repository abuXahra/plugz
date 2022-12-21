import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class GoogleMapHome extends StatefulWidget {
  const GoogleMapHome({Key? key}) : super(key: key);

  @override
  State<GoogleMapHome> createState() => _GoogleMapHomeState();
}

class _GoogleMapHomeState extends State<GoogleMapHome> {
  String locationaddress = "Pick Location";
  double latitude = 9.072264, longitude = 7.491302;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: InkWell(
        child: Text(locationaddress),
        onTap: () {
          _showModal(context);
        },
      ),
    )));
  }

  //modal bottom sheet
  void _showModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 500,
            child: Center(
              child: OpenStreetMapSearchAndPick(
                  center: LatLong(latitude, longitude),
                  buttonColor: Color(0xff9B51E0),
                  buttonText: 'Set Current Location',
                  onPicked: (pickedData) {
                    Navigator.pop(context);
                    setState(() {
                      locationaddress = pickedData.address;
                      latitude = pickedData.latLong.latitude;
                      longitude = pickedData.latLong.longitude;
                    });
                    // print(pickedData.latLong.latitude);
                    // print(pickedData.latLong.longitude);
                    // print(pickedData.address);
                  }),
            ),
          );
        });
  }
}
