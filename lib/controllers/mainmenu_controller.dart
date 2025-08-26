import 'package:get/get.dart';

class MainMenuController extends GetxController {
  var selectedIndex = 0.obs;

  void changeMenu(int index) {
    selectedIndex.value = index;
  }
}