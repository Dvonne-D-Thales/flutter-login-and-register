import 'package:flutter/material.dart';

class CustomDateField extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime) onDateSelected;

  const CustomDateField({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
  });

  Future<void> _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      onDateSelected(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: () => _pickDate(context),
        child: InputDecorator(
          decoration: InputDecoration(
            labelText: label,
            border: OutlineInputBorder(),
          ),
          child: Text(
            selectedDate != null
              ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
              : "Pilih tanggal",
            style: TextStyle(fontSize: 16),
          ),
        ),
      ),
    );
  }
}