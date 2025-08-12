import 'package:flutter/material.dart';
import 'football_page.dart'; // Import halaman FootballPage untuk navigasi setelah simpan
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
        elevation: 0, // hilangkan bayangan
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Edit Data Pemain',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Perbarui informasi pemain di bawah ini',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
              ),
            ),
            const SizedBox(height: 24),
            _buildTextField(controller: nameController, label: 'Nama'),
            const SizedBox(height: 16),
            _buildTextField(controller: posisiController, label: 'Posisi'),
            const SizedBox(height: 16),
            _buildTextField(
              controller: nomorController,
              label: 'Nomor Punggung',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              height: 48,
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
                child: const Text('Simpan Perubahan'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        // hilangkan fillColor dan borderRadius
      ),
    );
  }
}
