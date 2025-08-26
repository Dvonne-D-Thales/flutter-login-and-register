import 'package:flutter/material.dart';

class HomeFragment extends StatelessWidget {
  const HomeFragment({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 80, color: Colors.deepPurple),
          SizedBox(height: 16),
          Text('Selamat Datang di Home!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Ini adalah halaman utama aplikasi.', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}