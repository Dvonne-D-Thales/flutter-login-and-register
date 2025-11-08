import 'package:flutter/material.dart';

class WideScreen extends StatelessWidget {
  const WideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wide Screen'),
      ),
      body: const Center(
        child: Text(
          'This is the Wide Screen layout',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}