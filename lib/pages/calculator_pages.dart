import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:latihan_11pplg1/widgets/reusable_textfield.dart';
import 'package:latihan_11pplg1/controllers/calculator_controller.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';

class CalculatorPages extends StatelessWidget {
  CalculatorPages({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final CalculatorController calculatorController = Get.put(
    CalculatorController(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                controller: calculatorController.number1Controller,
                label: 'Angka 1',
                isPassword: false,
              ),

              SizedBox(height: 10),
              CustomTextField(
                controller: calculatorController.number2Controller,
                label: 'Angka 2',
                isPassword: false,
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CostumButton(
                    text: "+",
                    textColor: Colors.black,
                    onPressed: () {
                      calculatorController.tambah();
                    },
                  ),
                  CostumButton(
                    text: "-",
                    textColor: Colors.black,
                    onPressed: () {
                      calculatorController.kurang();
                    },
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CostumButton(
                    text: "×",
                    textColor: Colors.black,
                    onPressed: () {
                      calculatorController.kali();
                    },
                  ),
                  CostumButton(
                    text: "/",
                    textColor: Colors.black,
                    onPressed: () {
                      calculatorController.bagi();
                    },
                  ),
                ],
              ),
              SizedBox(height: 30),
              Obx(
                () => Text(
                  'Hasil: ${calculatorController.result.value}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
