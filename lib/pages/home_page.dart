import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/pages/calculator_pages.dart';
import 'package:latihan_11pplg1/pages/football_page.dart';
import 'package:latihan_11pplg1/pages/profile_page.dart';
import '../controllers/bottom_nav_controller.dart';
import '../widgets/navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Joseph")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hasil: $_hasil",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  child: const Text("+"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  child: const Text("-"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _hitung('x'),
                  child: const Text("×"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => _hitung('/'),
                  child: const Text("/"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: "Angka 1",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                labelText: "Angka 2",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _hitung('reset'),
              child: const Text("reset"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FootballPage(),
                  ), // tanpa const
                );
              },
              child: const Text("Go to Football Page"),
            ),
          ],
        ),
      ),
    );
  }
}
