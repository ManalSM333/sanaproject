import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    Get.updateLocale(const Locale('en_US'));
    routePage();
    super.onInit();
  }

  routePage() {
    Future.delayed(const Duration(seconds: 3), () {});
  }
}
