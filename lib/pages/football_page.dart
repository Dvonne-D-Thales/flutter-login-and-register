import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/football_controller.dart';
import 'package:latihan_11pplg1/MobileScreen/football_mobile.dart';
import 'package:latihan_11pplg1/wideScreen/football_wide.dart';

class FootballPage extends StatelessWidget {
  FootballPage({super.key});

  // Pastikan FootballController sudah didaftarkan lewat Binding
  final controller = Get.find<FootballController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? FootballMobile()
                : FootballWide(),
          );
        },
      ),
    );
  }
}
