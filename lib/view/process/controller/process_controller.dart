import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sanaproject/view/home/controller/home_controller.dart';
import '../../result/view/process_result_view.dart';
import 'package:tflite/tflite.dart';

class ProcessController extends GetxController {
  XFile? xFileImage;
  HomeController homeController = Get.find();

  @override
  Future<void> onInit() async {
    Get.put(HomeController());
    xFileImage = homeController.xFileImage;
    await loadModel();
    await classifyImage();
    navigateToPage();
    super.onInit();
  }

  navigateToPage() {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(const ProcessResultView());
    });
  }

  String? result;

  Future loadModel() async {
    result = await Tflite.loadModel(
      model: "assets/tflite/model_unquant.tflite",
      labels: "assets/tflite/labels.txt",
      numThreads: 1,
      isAsset: true,
      useGpuDelegate: false,
    );
    update();
  }

  late List<dynamic> output;
  Future classifyImage() async {
    Tflite.runModelOnImage(
      path: xFileImage!.path,
      numResults: 2,
      threshold: 0.1,
      imageMean: 125.5,
      imageStd: 125.5,
    ).then((tfLiteOutput) {
      output = tfLiteOutput!;
    });
    update();
  }
}
