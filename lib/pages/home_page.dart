import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/pages/calculator_pages.dart';
import 'package:latihan_11pplg1/pages/football_page.dart';
import 'package:latihan_11pplg1/pages/profile_page.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController navC = Get.find();

    return Obx(() => Scaffold(
          body: IndexedStack(
            index: navC.tabIndex.value,
            children: [
              CalculatorPages(),
              FootballPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: Navbar(), // cukup panggil tanpa parameter
        ));
  }
}
