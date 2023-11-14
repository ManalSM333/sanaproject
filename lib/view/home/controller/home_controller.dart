import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../view/confirm_photo_view.dart';

class HomeController extends GetxController {
  ImagePicker imagePick = ImagePicker();
  XFile? xFileImage;

  Future<void> captureImage(BuildContext context, ImageSource source) async {
    xFileImage = null;
    XFile? picked = await imagePick.pickImage(
      source: source == ImageSource.gallery ? ImageSource.gallery : ImageSource.camera,
      imageQuality: 50,
      maxWidth: 700,
    );
    if (picked != null) {
      xFileImage = XFile(picked.path);
      if (xFileImage != null) {
        debugPrint(xFileImage!.name);
        Get.to(ConfirmPhotoView(xFileImage: xFileImage));
      }
    }
    update();
  }
}
