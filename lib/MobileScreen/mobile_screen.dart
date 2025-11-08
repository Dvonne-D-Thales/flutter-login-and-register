import 'package:flutter/material.dart';

class Mobilescreen extends StatelessWidget {
  const Mobilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mobile Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Mobile Screen layout',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}