import 'package:flutter/material.dart';
import 'package:latihan_11pplg1/widgets/reusable_button.dart';

class ReusableDialog extends StatelessWidget {
  final String title;
  final Widget content;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;
  final String confirmText;
  final String cancelText;

  const ReusableDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onConfirm,
    this.onCancel,
    this.confirmText = 'Ya',
    this.cancelText = 'Batal',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: content,
      actions: [
        CostumButton(
          text: cancelText,
          onPressed: () {
            Navigator.of(context).pop();
            if (onCancel != null) onCancel!();
          },
          color: Colors.grey[200],
          textColor: Colors.black, 
          backgroundColor: Colors.redAccent, 
          borderRadius: 12,
        ),
        CostumButton(
          text: confirmText,
          onPressed: () {
            Navigator.of(context).pop();
            onConfirm();
          },
          color: Colors.red,
          textColor: Colors.white, 
          backgroundColor: Colors.green, 
          borderRadius: 12,
        ),
      ],
    );
  }
}