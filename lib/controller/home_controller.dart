import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List cities = [];
  List filterCities = [];
  //just for test UI but in project use firecloud and database Realtime
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('asset/cities.json');
    final data = await json.decode(response) as Map;
    List city = data.values.elementAt(0);

    city.forEach((element) => cities.add(element));
  }

  @override
  void onInit() async {
    await readJson();
    runFilter("");
    super.onInit();
  }

  // This function is called whenever the text field changes
  void runFilter(String enteredKeyword) {
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      filterCities = cities;
    } else {
      filterCities = cities
          .where((user) =>
              user["name"].toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }
    update();
  }
}
