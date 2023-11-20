import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:sanaproject/core/base/state/base_state.dart';
import 'package:sanaproject/core/constants/image_constants.dart';
import 'package:sanaproject/core/init/theme/color/color_theme.dart';
import 'package:sanaproject/view/blog/controller/blog_controller.dart';
import 'package:sanaproject/view/home/view/widget/title_with_description_widget.dart';

import 'blog_detail_view.dart';

class BlogView extends GetView<BlogController> {
  const BlogView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().backgroundColor,
      body: GetBuilder<BlogController>(
        init: BlogController(),
        builder: (blogController) {
          return PDF(
            enableSwipe: true,
            swipeHorizontal: false,
            autoSpacing: false,
            pageFling: false,
            onError: (error) {
              print(error.toString());
            },
            onPageError: (page, error) {
              print('$page: ${error.toString()}');
            },
            onPageChanged: (page, total) {
              print('page change: $page/$total');
            },
          ).fromAsset(Get.locale == const Locale('ar', 'AR')
              ? "assets/images/null_2.pdf"
              : 'assets/images/null.pdf');
        },
      ),
    );
  }
}
