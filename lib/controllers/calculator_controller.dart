import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CalculatorController extends GetxController {
  final TextEditingController number1Controller = TextEditingController();
  final TextEditingController number2Controller = TextEditingController();
  var result = "".obs;

  void tambah() {
   int number1 = int.parse(number1Controller.text.toString());
    int number2 = int.parse(number2Controller.text.toString());
   
   int hasilJumlah = number1 + number2;
    result.value = "Hasil Penjumlahan: $hasilJumlah";
  }
  void kurang () {
    int number1 = int.parse(number1Controller.text.toString());
    int number2 = int.parse(number2Controller.text.toString());
    
    int hasilPengurangan = number1 - number2;
    result.value = "Hasil Pengurangan: $hasilPengurangan";
  }

  void kali() {
    int number1 = int.parse(number1Controller.text.toString());
    int number2 = int.parse(number2Controller.text.toString());
    
    int hasilPerkalian = number1 * number2;
    result.value = "Hasil Perkalian: $hasilPerkalian";
  }

  void bagi() {
    int number1 = int.parse(number1Controller.text.toString());
    int number2 = int.parse(number2Controller.text.toString());
    
    if (number2 != 0) {
      double hasilPembagian = number1 / number2;
      result.value = "Hasil Pembagian: $hasilPembagian";
    } else {
      result.value = "Tidak bisa dibagi dengan nol";
    }
  }
}