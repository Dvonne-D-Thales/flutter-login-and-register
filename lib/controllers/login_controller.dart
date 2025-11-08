import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latihan_11pplg1/routes/routes.dart';

class LoginController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> handleLogin() async {
    if (usernameController.text == "admin" &&
        passwordController.text == "admin") {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("username", usernameController.text.toString());
      Get.offAllNamed(AppRoutes.profile); // pindah ke halaman MainMenu
    } else {
      Get.snackbar(
        "Error",
        "Username atau Password salah",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
