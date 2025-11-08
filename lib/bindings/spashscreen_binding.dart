import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/splashscreen_controller.dart';

class SplashScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashscreenController>(() => SplashscreenController());
    //lazyPut digunakan agar controller hanya dibuat saat dibutuhkan
  }
}
