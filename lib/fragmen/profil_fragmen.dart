import 'package:flutter/material.dart';

class ProfilFragmen extends StatelessWidget {
  const ProfilFragmen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.person, size: 80, color: Colors.deepPurple),
          SizedBox(height: 16),
          Text('Selamat Datang di Profil!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Ini adalah halaman data pengguna', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}