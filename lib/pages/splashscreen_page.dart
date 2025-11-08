import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/splashscreen_controller.dart';

class SplashscreenPage extends StatelessWidget {
   SplashscreenPage({super.key});

   final conteoller = Get.find<SplashscreenController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(bottom: 100),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Text('Splashscreen Page', style: TextStyle(fontSize: 24)),
        ),
      ),
    );
  }
}
