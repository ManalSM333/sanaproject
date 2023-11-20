import 'dart:io' as io;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanaproject/core/base/components/bottom_navigation_bar_widget.dart';
import 'package:sanaproject/core/base/components/button/base_button.dart';
import 'package:sanaproject/core/base/state/base_state.dart';
import 'package:sanaproject/core/init/theme/color/color_theme.dart';
import 'package:sanaproject/view/home/view/widget/title_with_description_widget.dart';
import 'package:sanaproject/view/process/controller/process_controller.dart';

import '../../../core/base/components/popup/general_popup.dart';

class ProcessResultView extends GetView<ProcessController> {
  const ProcessResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          right: Utility(context).dynamicWidthPixel(26),
          left: Utility(context).dynamicWidthPixel(26),
        ),
        child: GetBuilder<ProcessController>(
          builder: (processController) {
            Future.delayed(const Duration(milliseconds: 100)).then((value) {
              BaseDialog.show(
                context: context,
                text: "warningText".tr,
                buttonText: "understand".tr,
                onTap: () {
                  Navigator.pop(context);
                },
              );
            });

            return Obx(() => Column(
                  crossAxisAlignment:
                      Get.locale.obs.value == const Locale('ar_AR')
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                  children: [
                    const TitleWithDescription(
                      title: "scanResult",
                      description: "scanResultDescription",
                      isBackButtonActive: true,
                    ),

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
                            image: FileImage(
                                io.File(processController.xFileImage!.path)),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // if index == 1 Retinopathy
                    // if index == 0 Healthy
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Utility(context).dynamicWidthPixel(60),
                        ),
                        child: Builder(builder: (context) {
                          return Text(
                            processController.output[0]['index'] == 1
                                ? "retinopathy".tr
                                : "healthy".tr,
                            style: Utility(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color:
                                      processController.output[0]['index'] == 1
                                          ? AppColors().red
                                          : AppColors().green,
                                ),
                          );
                        }),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: Utility(context).dynamicWidthPixel(16),
                        ),
                        child: Text(
                          "confidence".tr +
                              double.parse(
                                      "${processController.output[0]['confidence']}")
                                  .toStringAsFixed(3),
                          style: Utility(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                color: AppColors().grey1,
                                fontSize: Utility(context).dynamicTextSize(20),
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: Utility(context).dynamicWidthPixel(90),
                        bottom: Utility(context).dynamicWidthPixel(30),
                      ),
                      child: BaseButton(
                        buttonText: 'complete'.tr,
                        onPressed: () {
                          Get.off(
                              const BottomNavigationBarView(selectedIndex: 0));
                        },
                      ),
                    ),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
