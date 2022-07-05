import 'package:get/get.dart';

import 'dart:async';

class SpalshController extends GetxController {
  
  static Duration duration = const Duration(milliseconds: 500);

  @override
  Future<void> onReady() async {
    await  sleep();
    Get.offAllNamed('/');
    super.onReady();
  }


  Future sleep() {
    return Future.delayed(duration, () => "1");
  }
}