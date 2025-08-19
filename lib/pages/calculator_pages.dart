import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/controllers/calculator_controller.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';

class CalculatorPages extends StatelessWidget {
  CalculatorPages({super.key});

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kalkulator Joseph"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              controller: calculatorController.number1Controller,
              label: 'Angka 1',
              isPassword: false,
            ),
            const SizedBox(height: 10),
            CustomTextField(
              controller: calculatorController.number2Controller,
              label: 'Angka 2',
              isPassword: false,
            ),
            const SizedBox(height: 20),

            // Tombol baris pertama
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CostumButton(
                  text: "+",
                  textColor: Colors.black,
                  onPressed: () => calculatorController.tambah(),
                ),
                CostumButton(
                  text: "-",
                  textColor: Colors.black,
                  onPressed: () => calculatorController.kurang(),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Tombol baris kedua
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CostumButton(
                  text: "×",
                  textColor: Colors.black,
                  onPressed: () => calculatorController.kali(),
                ),
                CostumButton(
                  text: "/",
                  textColor: Colors.black,
                  onPressed: () => calculatorController.bagi(),
                ),
              ],
            ),

            const SizedBox(height: 30),
            Obx(
              () => Text(
                'Hasil: ${calculatorController.result.value}',
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
