import 'package:get/get.dart';
import 'package:latihan_11pplg1/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashscreenController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkLoginStatus();
  }

  checkLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();

    final savedUsername = prefs.getString('username');
    if (savedUsername != null) {
      //jika ada username, langsung ke main menu
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAllNamed(AppRoutes.mainmenu);
      });
    } else {
      Get.offAllNamed(AppRoutes.calculator);
    }
  }
}
