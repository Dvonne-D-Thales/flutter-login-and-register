import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';
import '../controllers/nav_controller.dart';
import '../widgets/nav_drawer.dart';
import '../widgets/navbar.dart';

class MainmenuPage extends StatelessWidget {
  MainmenuPage({super.key});

  final BottomNavController bottomNavC = Get.put(BottomNavController());
  final NavController navC = Get.put(NavController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Menu')),
      drawer: NavDrawer(),
      body: Obx(() => navC.currentFragment),
      bottomNavigationBar: Navbar(),
    );
  }
}
