import 'package:flutter/material.dart';

class CostumButton extends StatelessWidget {
  
  final String text;
  final Color textColor;
  final VoidCallback? onPressed;

  const CostumButton({super.key, required this.text,
   required this.textColor, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, 
    child: Text(text, style: TextStyle(fontSize: 16),)
    );
  }
}