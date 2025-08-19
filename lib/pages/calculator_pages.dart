import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorPages extends StatelessWidget {
  final CalculatorController controller = Get.put(CalculatorController());

  CalculatorPages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Kalkulator Joseph")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
              "Hasil: ${controller.hasil.value}",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            )),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => controller.hitung(context, '+'),
                  child: const Text("+"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => controller.hitung(context, '-'),
                  child: const Text("-"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => controller.hitung(context, 'x'),
                  child: const Text("×"),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => controller.hitung(context, '/'),
                  child: const Text("/"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.angka1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Angka 1",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: controller.angka2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Angka 2",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => controller.hitung(context, 'reset'),
              child: const Text("reset"),
            ),
          ],
        ),
      ),
    );
  }
}

class CalculatorController extends GetxController {
  final angka1Controller = TextEditingController();
  final angka2Controller = TextEditingController();

  var hasil = 0.0.obs;

  void hitung(BuildContext context, String operasi) {
    double angka1 = double.tryParse(angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(angka2Controller.text) ?? 0;

    if (operasi == '+') {
      hasil.value = angka1 + angka2;
    } else if (operasi == '-') {
      hasil.value = angka1 - angka2;
    } else if (operasi == 'x') {
      hasil.value = angka1 * angka2;
    } else if (operasi == '/') {
      if (angka2 != 0) {
        hasil.value = angka1 / angka2;
      } else {
        Get.dialog(
          AlertDialog(
            title: const Text("Request anda gak ngotak"),
            content: const Text(
                "TOLONG JANGAN PAKE 0 UNTUK PEMBAGIAN, ANDA MEREPOTKAN SAYA !!!"),
            actions: [
              TextButton(
                onPressed: () => Get.back(),
                child: const Text("OK"),
              ),
            ],
          ),
        );
      }
    } else if (operasi == 'reset') {
      hasil.value = 0;
      angka1Controller.clear();
      angka2Controller.clear();
    }
  }
}
