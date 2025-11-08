import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/MobileScreen/mobile_screen.dart';
import 'package:latihan_11pplg1/controllers/screen_controller.dart';
import 'package:latihan_11pplg1/wideScreen/wide_screen.dart';

class ExamplePage extends StatelessWidget {
  ExamplePage({super.key});

  final controller = Get.find<ScreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          controller.updateLayout(constraints);
          return Obx(
            () => controller.isMobile.value
                ? const Mobilescreen()
                : const WideScreen(),
          );
        },
      ),
    );
  }
}
