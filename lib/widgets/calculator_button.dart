// widgets/calculator_button.dart
import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final int flex;

  const CalculatorButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(1.0), // Reduced padding
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            foregroundColor: label == '=' ? Colors.white : Colors.green,
            backgroundColor: label == '=' ? Colors.green : Colors.white,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 6), // Smaller button padding
          ),
          onPressed: onPressed,
          child: Text(
            label,
            style: const TextStyle(fontSize: 14), // Smaller font size
          ),
        ),
      ),
    );
  }
}
