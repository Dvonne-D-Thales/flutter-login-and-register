import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/contact_controller.dart';

class ContactBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactController>(() => ContactController());
    //lazyPut digunakan agar controller hanya dibuat saat dibutuhkan
  }
}
