import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';
import '../controllers/login_api_controller.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginApiController());

    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
            ),
            const SizedBox(height: 16),
            const Text(
              "John Doe",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text(
              "johndoe@example.com",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: 160,
              height: 45,
              child: CostumButton(
                text: "Logout",
                textColor: Colors.white,
                onPressed: controller.logout, // panggil logout dari controller
                backgroundColor: Colors.redAccent, 
                borderRadius: 12, 
              ),
            ),
          ],
        ),
      ),
    );
  }
}
