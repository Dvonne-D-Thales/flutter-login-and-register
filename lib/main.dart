import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controllers/bottom_nav_controller.dart';
import 'pages/home_page.dart';

void main() {
  // Registrasi controller
  Get.put(BottomNavController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
