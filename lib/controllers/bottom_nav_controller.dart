import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../pages/calculator_pages.dart';
import '../pages/football_page.dart';
import '../pages/profile_page.dart';

class BottomNavController extends GetxController {
  var tabIndex = 0.obs;

  final pages = [
    CalculatorPages(),
    FootballPage(),
    ProfilePage(),
  ];

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  Widget get currentPage => pages[tabIndex.value];
}
