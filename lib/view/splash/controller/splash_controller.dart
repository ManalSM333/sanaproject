import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Get.updateLocale(const Locale('en_US'));

    super.onInit();
  }
}
