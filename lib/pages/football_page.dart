import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'football_edit_page.dart';
import '../controllers/football_controller.dart' as controller;
import '../models/player_model.dart';

class FootballPage extends StatelessWidget {
  final controller.FootballController footballController = Get.put(
    controller.FootballController(),
  );

  FootballPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Football Players",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple, // tetap agar konsisten
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(
          () => ListView.separated(
            itemCount: footballController.player.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final player = footballController.player[index];

              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 2,
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: player.image.isNotEmpty
                        ? Image.asset(
                            player.image,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          )
                        : Container(
                            width: 50,
                            height: 50,
                            color: Colors.grey.shade200,
                            child: const Icon(
                              Icons.person,
                              size: 30,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                  title: Text(
                    player.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Posisi: ${player.posisi}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        Text(
                          'Nomor Punggung: ${player.nomorPunggung}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade800,
                          ),
                        ),
                      ],
                    ),
                  ),
                  trailing: const Icon(Icons.edit, color: Colors.deepPurple),
                  onTap: () async {
                    final result = await Get.to<Player?>(
                      () => FootballEditPage(
                        player: player,
                        onSave: (editedPlayer) {
                          Get.back(result: editedPlayer);
                        },
                      ),
                    );
                    if (result != null) {
                      footballController.player[index] = result;
                    }
                  },
                ),
              );
            },
          ),
        ),
      ),
      backgroundColor: Colors.grey.shade100,
    );
  }
}
