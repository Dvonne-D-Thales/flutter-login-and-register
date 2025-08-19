import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/bottom_nav_controller.dart';
import 'package:latihan_11pplg1/routes/pages.dart';
import 'package:latihan_11pplg1/routes/routes.dart';

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
      title: 'Sinau Flutter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoutes.calculator,
      getPages: AppPages.pages,
    );
  }
}
