import 'package:flutter/material.dart';
import 'football_page.dart'; // Import halaman FootballPage untuk navigasi setelah simpan
import '../models/player_model.dart';

class FootballEditPage extends StatelessWidget {
  // Data Player yang akan diedit dan callback saat simpan
  final Player player;
  final void Function(Player) onSave;

  const FootballEditPage({
    super.key,
    required this.player,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    // Controller untuk mengisi dan membaca input field dengan nilai awal player
    final nameController = TextEditingController(text: player.name);
    final posisiController = TextEditingController(text: player.posisi);
    final nomorController =
        TextEditingController(text: player.nomorPunggung.toString());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Pemain'),
        backgroundColor: Colors.deepPurple, // Warna AppBar ungu gelap
        elevation: 1, // Sedikit bayangan agar lebih tajam
      ),
      backgroundColor: Colors.grey.shade100, // Warna latar belakang halaman
      body: SingleChildScrollView(
        // Agar konten bisa discroll jika layar kecil
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(), // Judul dan deskripsi halaman
            const SizedBox(height: 32),
            // Field input Nama
            _buildTextField(
              controller: nameController,
              label: 'Nama',
              icon: Icons.person,
            ),
            const SizedBox(height: 20),
            // Field input Posisi
            _buildTextField(
              controller: posisiController,
              label: 'Posisi',
              icon: Icons.sports_soccer,
            ),
            const SizedBox(height: 20),
            // Field input Nomor Punggung (angka)
            _buildTextField(
              controller: nomorController,
              label: 'Nomor Punggung',
              icon: Icons.format_list_numbered,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 40),
            // Tombol Simpan perubahan
            _buildSaveButton(
              onPressed: () {
                // Buat objek Player baru dengan data terbaru dari input
                final editedPlayer = Player(
                  image: player.image, // tetap pakai image lama
                  name: nameController.text,
                  posisi: posisiController.text,
                  nomorPunggung: int.tryParse(nomorController.text) ??
                      player.nomorPunggung, // fallback jika input bukan angka
                );

                onSave(editedPlayer); // panggil callback onSave untuk update data

                // Navigasi ganti halaman ke FootballPage, hilangkan halaman edit dari stack
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => FootballPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan judul dan deskripsi halaman
  Widget _buildTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Edit Data Pemain',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Perbarui informasi pemain di bawah ini',
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade700,
          ),
        ),
      ],
    );
  }

  // Widget untuk membuat TextField dengan ikon dan label
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: Colors.deepPurple.shade400), // ikon ungu soft
        filled: true,
        fillColor: Colors.white, // background putih untuk input
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.grey.shade300), // border abu muda
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Colors.deepPurple.shade400, width: 2), // border ungu saat fokus
        ),
      ),
    );
  }

  // Widget untuk tombol Simpan dengan style khusus
  Widget _buildSaveButton({required VoidCallback onPressed}) {
    return SizedBox(
      width: double.infinity, // tombol penuh lebar layar
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.deepPurple.shade400, // warna tombol ungu soft
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // rounded corners
          ),
          elevation: 3, // bayangan tombol
        ),
        onPressed: onPressed,
        child: const Text(
          'Simpan Perubahan',
          style: TextStyle(
            fontSize: 18,
            color: Color.fromARGB(255, 255, 255, 255), // warna teks putih
          ),
        ),
      ),
    );
  }
}
