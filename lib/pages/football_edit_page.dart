import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/football_edit_controller.dart';
import '../widgets/reusable_textfield.dart';
import '../widgets/reusable_button.dart';

class FootballEditPage extends StatelessWidget {
  FootballEditPage({super.key});

  final editController = Get.put(FootballEditController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pemain'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CustomTextField(
              controller: editController.nameController,
              label: 'Nama',
              isPassword: false,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: editController.posisiController,
              label: 'Posisi',
              isPassword: false,
            ),
            const SizedBox(height: 12),
            CustomTextField(
              controller: editController.nomorController,
              label: 'Nomor Punggung',
              isPassword: false,
              // keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: CostumButton(
                text: 'Simpan',
                textColor: Colors.white,
                onPressed: () {
                  editController.updatePlayer();
                  Get.back();
                }, backgroundColor: Colors.blueAccent, borderRadius: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
