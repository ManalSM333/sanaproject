import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanaproject/core/base/base_button.dart';
import 'package:sanaproject/core/base/base_state.dart';
import 'package:sanaproject/core/init/color_theme.dart';
import 'package:sanaproject/view/process/view/process_view.dart';
import 'home_controller.dart';
import 'title_with_description_widget.dart';

class ConfirmPhotoView extends GetView<HomeController> {
  final XFile? xFileImage;
  const ConfirmPhotoView({super.key, this.xFileImage});

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
            const TitleWithDescription(
                title: "confirmPhoto", isBackButtonActive: true),
            Padding(
              padding: EdgeInsets.only(
                top: Utility(context).dynamicWidthPixel(90),
              ),
              child: Container(
                width: Utility(context).dynamicWidth(1),
                height: Utility(context).dynamicWidthPixel(230),
                decoration: BoxDecoration(
                  color: AppColors().backgroundColor,
                  borderRadius: BorderRadius.circular(
                    Utility(context).dynamicHeightPixel(15),
                  ),
                  image: DecorationImage(
                    image: FileImage(io.File(xFileImage!.path)),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: Utility(context).dynamicWidthPixel(90),
                bottom: Utility(context).dynamicWidthPixel(20),
              ),
              child: BaseButton(
                buttonText: 'confirm'.tr,
                onPressed: () {
                  Get.to(const ProcessView());
                },
              ),
            ),
            BaseButton(
              buttonText: 'reselect'.tr,
              borderColor: AppColors().green,
              backgroundColor: Colors.transparent,
              buttonTextColor: AppColors().green,
              onPressed: () {
                xFileImage == null;
                Get.back();
              },
            ),
          ],
        ),
      ),
    );
  }
}
