import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/screen_controller.dart';

class ScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScreenController>(() => ScreenController());
  }

}