import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../fragmen/home_fragment.dart';
import '../fragmen/history_fragmen.dart';
import '../fragmen/profil_fragmen.dart';
import '../pages/login_page.dart';

class NavController extends GetxController {
  var selectedIndex = 0.obs;

  final fragments = [
    const HomeFragment(),
    const HistoryFragmen(),
    const ProfilFragmen(),
  ];

  void changeTab(int index) {
    selectedIndex.value = index;
  }

  Widget get currentFragment => fragments[selectedIndex.value];

  void logout() {
    Get.offAll(() =>  LoginPage());
  }
}
