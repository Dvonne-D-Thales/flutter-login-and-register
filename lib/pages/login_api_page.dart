import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';
import '../controllers/login_api_controller.dart';

class LoginApiPage extends GetView<LoginApiController> {
  const LoginApiPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[100], // soft background
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Welcome Back',
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Login to your account',
                  style: theme.textTheme.titleMedium?.copyWith(
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 32),

                // Username
                CustomTextField(
                  label: 'Username',
                  isPassword: false,
                  controller: controller.usernameC,
                ),
                const SizedBox(height: 16),

                // Password
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  controller: controller.passwordC,
                ),
                const SizedBox(height: 32),

                // Button
                Obx(
                  () => controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : SizedBox(
                          width: double.infinity,
                          height: 50,

                          child: CostumButton(
                            text: 'Login',
                            textColor: Colors.white,
                            onPressed: controller.loginApi,
                            borderRadius: 12,
                            backgroundColor: Colors.blueAccent,
                          ),
                        ),
                ),
                const SizedBox(height: 16),

                TextButton(
                  onPressed: controller.signInWithGoogle,
                  child: Text(
                    'Sign In With Google',
                    style: TextStyle(color: Colors.grey[700]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
