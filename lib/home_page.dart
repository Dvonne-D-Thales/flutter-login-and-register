import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  double _hasil = 0;
 
  void _hitung(String operasi) {
    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;

    setState(() {
      if (operasi == '+') {
        _hasil = angka1 + angka2;
      } else if (operasi == '-') {
        _hasil = angka1 - angka2;
      } else if (operasi == 'x') {
        _hasil = angka1 * angka2;
      } else if (operasi == '/') {
        if (angka2 != 0) {
          _hasil = angka1 / angka2;
        } else if (angka1 == 0 || angka2 == 0) {
               showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Request anda gak ngotak"),
            content: Text("TOLONG JANGAN PAKE 0 UNTUK PEMBAGIAN, ANDA MEREPOTKAN SAYA !!!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
        }
      } else if (operasi == 'reset') {
        _hasil = 0;
        _angka1Controller.clear();
        _angka2Controller.clear();
      }
    });
  }

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
          ],
        ),
      ),
    );
  }
}
