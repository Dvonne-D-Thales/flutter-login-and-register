import 'package:flutter/material.dart';

class HistoryFragmen extends StatelessWidget {
  const HistoryFragmen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.history, size: 80, color: Colors.deepPurple),
          SizedBox(height: 16),
          Text('Selamat Datang di History!', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('Ini adalah halaman data penjelajahan.', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}