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
        title: const Text("My Football Players"),
        // backgroundColor dihilangkan, default appbar
        elevation: 0, // hilangkan bayangan
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Obx(
          () => ListView.separated(
            itemCount: footballController.player.length,
            separatorBuilder: (_, _) => const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final player = footballController.player[index];

              return ListTile(
                // hilangkan Card dan stylingnya
                leading: player.image.isNotEmpty
                    ? Image.asset(
                        player.image,
                        width: 40,
                        height: 40,
                        fit: BoxFit.cover,
                      )
                    : const Icon(Icons.person, size: 40, color: Colors.grey),
                title: Text(player.name),
                subtitle: Text('Posisi: ${player.posisi}\nNomor: ${player.nomorPunggung}'),
                isThreeLine: true,
                trailing: const Icon(Icons.edit),
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
              );
            },
          ),
        ),
      ),
      // backgroundColor default putih
    );
  }
}
