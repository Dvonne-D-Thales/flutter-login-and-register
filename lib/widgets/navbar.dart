import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/nav_controller.dart';

class Navbar extends StatelessWidget {
  final NavController navC = Get.find();

  Navbar({super.key});

  @override
  Widget build(BuildContext context) {
  return Obx(() => BottomNavigationBar(
      currentIndex: navC.selectedIndex.value,
      onTap: navC.changeTab,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
              label: "Calculator",
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
