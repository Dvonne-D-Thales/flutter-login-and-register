import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:latihan_11pplg1/controllers/splashscreen_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
   Get.lazyPut<SplashscreenController>(() => SplashscreenController());
  }
}