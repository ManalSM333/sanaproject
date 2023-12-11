import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:sanaproject/core/base/base_state.dart';
import 'package:sanaproject/core/constants/data_constants.dart';
import 'package:sanaproject/core/init/color_theme.dart';
import 'package:sanaproject/view/home/view/widget/title_with_description_widget.dart';
import 'package:sanaproject/view/process/controller/process_controller.dart';

class ProcessView extends GetView<ProcessController> {
  const ProcessView({super.key});

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
            init: ProcessController(),
            builder: (processController) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TitleWithDescription(
                    title: "scanning",
                    isBackButtonActive: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Utility(context).dynamicWidthPixel(90),
                    ),
                    child: LottieBuilder.asset(
                      fit: BoxFit.contain,
                      width: Utility(context).dynamicWidth(1),
                      DataConstants.instance.jSONPath.searchLottie,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
