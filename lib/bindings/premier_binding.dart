import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/premier_table_controller.dart';

class PremierBinding extends Bindings{
   @override
  void dependencies() {
   Get.lazyPut<PremierTableController>(() => PremierTableController());
  }
}