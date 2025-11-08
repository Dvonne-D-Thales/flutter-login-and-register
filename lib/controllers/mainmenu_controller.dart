import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/calculator_pages.dart';
// import '../pages/football_page.dart';
import '../pages/profile_page.dart';
import '../pages/login_page.dart';

class MainMenuController extends GetxController {
  var selectedIndex = 0.obs;

  final pages = [
     CalculatorPages(),
    //  FootballPage(),
     ProfilePage(),
  ];

  void changeMenu(int index) {
    selectedIndex.value = index;
  }

  Widget get currentPage => pages[selectedIndex.value];

  void logout() {
    Get.offAll(() =>  LoginPage());
  }
}
