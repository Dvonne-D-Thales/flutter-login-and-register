import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/pages/register_page.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';
import 'package:latihan_11pplg1/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final controller = Get.find<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login Page')),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Welcome to Login Page', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 5),
            const Text(
              "Please login using your username and password",
              style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 27, 141, 60)),
            ),
            const SizedBox(height: 20),

            CustomTextField(
              label: "Username",
              isPassword: false,
              controller: controller.usernameController,
            ),
            CustomTextField(
              label: "Password",
              isPassword: true,
              controller: controller.passwordController,
            ),

            const SizedBox(height: 20),

            Center(
              child: CostumButton(
                text: "Login",
                textColor: Colors.white,
                onPressed: () => controller.handleLogin(), backgroundColor: Colors.purple, borderRadius: 12,
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.to(() => const RegisterPage());
                },
                child: const Text("Register"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
