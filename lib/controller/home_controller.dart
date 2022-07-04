import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List cities = [];
  //just for test UI but in project use firecloud and database Realtime
  Future<void> readJson() async {
    final String response = await rootBundle.loadString('asset/cities.json');
    final data = await json.decode(response) as Map;
    List city = data.values.elementAt(0);

    city.forEach((element) => cities.add(element));
    update();
  }

  @override
  void onInit() async {
    await readJson();
    super.onInit();
  }
}
