import 'package:http/http.dart' as http;
import '../models/get_price_model.dart';
import '../models/price_model.dart';
import '../services/api.dart';
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  bool isLoading = false;

  List priceLists = [];

  Future<void> getAllPrices() async {
    final myPriceList = await Api.instance.getNewRidePrice();

    //saving the response to price list array
    priceLists = myPriceList!.map((object) => Price.fromJson(object)).toList();

    priceLists.forEach((element) {
      print(element);
    });

    isLoading = true;

    notifyListeners();
  }
}
