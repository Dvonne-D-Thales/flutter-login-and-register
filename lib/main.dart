import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:latihan_11pplg1/pages/calculator_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sinau Flutter',
      theme: ThemeData(
      
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home:CalculatorPages()
    );
  }
}