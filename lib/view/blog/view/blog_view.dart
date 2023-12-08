import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';

import 'package:sanaproject/core/init/theme/color/color_theme.dart';
import 'package:sanaproject/view/blog/controller/blog_controller.dart';

class BlogView extends GetView<BlogController> {
  BlogView({super.key});
  final Widget engPDF = PDF(
    enableSwipe: true,
    swipeHorizontal: false,
    autoSpacing: false,
    pageFling: false,
    onError: (error) {},
    onPageError: (page, error) {},
    onPageChanged: (page, total) {},
  ).fromAsset('assets/images/null.pdf');

  final Widget araPDF = PDF(
    enableSwipe: true,
    swipeHorizontal: false,
    autoSpacing: false,
    pageFling: false,
    onError: (error) {},
    onPageError: (page, error) {},
    onPageChanged: (page, total) {},
  ).fromAsset("assets/images/null_2.pdf");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: GetBuilder<BlogController>(
        init: BlogController(),
        builder: (blogController) {
          return Stack(
            children: [
              IgnorePointer(
                ignoring: Get.locale.toString() == "ar_AR" ? false : true,
                child: Opacity(
                    opacity: Get.locale.toString() == "ar_AR" ? 1 : 0,
                    child: araPDF),
              ),
              IgnorePointer(
                ignoring: Get.locale.toString() == "ar_AR" ? true : false,
                child: Opacity(
                    opacity: Get.locale.toString() == "ar_AR" ? 0 : 1,
                    child: engPDF),
              )
            ],
          );
        },
      ),
    );
  }
}
