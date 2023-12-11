import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanaproject/core/base/base_state.dart';
import 'package:sanaproject/core/constants/image_constants.dart';
import 'package:sanaproject/core/init/color_theme.dart';
import 'package:sanaproject/view/image_source_boxes.dart';
import 'package:sanaproject/view/title_with_description_widget.dart';

import 'home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleWithDescription(title: "selectPhoto"),
            ImageSourceWidget(
              title: "fromCamera",
              iconColor: AppColors().green,
              iconPath: ImageConstants.instance.svgPath.camera,
              onTap: () async {
                HomeController homeController = Get.find();
                await homeController.captureImage(context, ImageSource.camera);
              },
            ),
            ImageSourceWidget(
              title: "fromGallery",
              iconColor: AppColors().green,
              iconPath: ImageConstants.instance.svgPath.gallery,
              onTap: () async {
                Get.put(HomeController());
                HomeController homeController = Get.find();
                await homeController.captureImage(context, ImageSource.gallery);
              },
            ),
          ],
        ),
      ),
    );
  }
}
