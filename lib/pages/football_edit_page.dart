import 'package:flutter/material.dart';
import 'football_page.dart';
import '../models/player_model.dart';

class FootballEditPage extends StatelessWidget {
  final Player player;
  final void Function(Player) onSave;

  const FootballEditPage({
    super.key,
    required this.player,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: player.name);
    final posisiController = TextEditingController(text: player.posisi);
    final nomorController =
        TextEditingController(text: player.nomorPunggung.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pemain'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Nama'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: posisiController,
              decoration: const InputDecoration(labelText: 'Posisi'),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: nomorController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Nomor Punggung'),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  final editedPlayer = Player(
                    image: player.image,
                    name: nameController.text,
                    posisi: posisiController.text,
                    nomorPunggung:
                        int.tryParse(nomorController.text) ?? player.nomorPunggung,
                  );

                  onSave(editedPlayer);

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => FootballPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                ),
                child: const Text('Simpan',
                    style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
