import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';
import 'home_page.dart';
import 'football_page.dart';
import 'profile_page.dart';

class MainMenuPage extends StatelessWidget {
  final BottomNavController navController = Get.put(BottomNavController());

  MainMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      body: IndexedStack(
        index: navController.tabIndex.value,
        children: [
          HomePage(),
          FootballPage(),
          ProfilePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navController.tabIndex.value,
        onTap: navController.changeTabIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Kalkulator'),
          BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Football'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    ));
  }
}
