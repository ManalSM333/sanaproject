import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanaproject/core/constants/enums/setting_type_enum.dart';
import 'package:sanaproject/core/constants/image_constants.dart';
import 'package:sanaproject/view/onboarding/model/onboarding_model.dart';

import '../view/settings_view.dart';

class OnboardingController extends GetxController {
  int selectedIndex = 0;

  List<String> languages = ['english', 'arabic'];

  Future<void> setLanguage(int index) async {
    switch (index) {
      case 0:
        Get.updateLocale(const Locale('en_US'));
        selectedIndex = 0;
        break;
      case 1:
        Get.updateLocale(const Locale('ar_AR'));
        selectedIndex = 1;
        break;
      default:
    }
    update();
  }

  List<OnboardingModel> itemList = [
    OnboardingModel(
      title: 'welcome',
      imagePath: ImageConstants.instance.svgPath.eye,
      description: 'welcomeDescription',
    ),
  ];

  CarouselController buttonCarouselController = CarouselController();

  void nextOnboardingScreen(int index) {
    if (index < itemList.length - 1) {
      buttonCarouselController.nextPage();
      update();
    } else {
      Get.to(const SettingsView(settingsType: SettingsType.splashSettings));
    }
  }
}
