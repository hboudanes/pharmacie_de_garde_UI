import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PharmacyController extends GetxController {
  List pharmacies = [];
  List pharmacieNight = [];
  List pharmacieDay = [];
  bool mode = true;
  //just for test UI but in project use firecloud and database Realtime
  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('asset/pharmacies.json');
    final data = await json.decode(response) as Map;
    List pharmacy = data.values.elementAt(0);

    pharmacy.forEach((element) {
      if (element['inNight'] == "1") {
        pharmacies.add(element);
      }
      if (element['inDay'] == "1") {
        pharmacieDay.add(element);
      }
    });
    update();
  }

  changeMode(int i) {
    print(i);
    if (i == 0) {
      mode= true;
      pharmacies = pharmacieNight;
      update();
    } else {
      mode= false;
      pharmacies = pharmacieDay;
      update();
    }
    
  }

  @override
  void onInit() async {
    changeMode(0);
    await readJson();
    super.onInit();
  }
}
