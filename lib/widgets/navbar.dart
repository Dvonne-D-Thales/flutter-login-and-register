import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/bottom_nav_controller.dart';

class Navbar extends StatelessWidget {
  final BottomNavController navC = Get.find();

  Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => BottomNavigationBar(
          currentIndex: navC.tabIndex.value,
          onTap: navC.changeTabIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Kalkulator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.sports_soccer),
              label: "Football",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            ),
          ],
        ));
  }
}
