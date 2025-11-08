import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/calculator_controller.dart';

class CalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CalculatorController>(() => CalculatorController());
    //lazyPut digunakan agar controller hanya dibuat saat dibutuhkan
  }
}
