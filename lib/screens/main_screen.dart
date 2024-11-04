// screens/main_screen.dart
import 'package:flutter/material.dart';
import '../utils/calculator_logic.dart';
import '../widgets/calculator_button.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final CalculatorLogic calculator = CalculatorLogic();

  void _onButtonPressed(String label) {
    setState(() {
      if (label == 'C') {
        calculator.clear();
      } else if (label == 'DEL') {
        calculator.delete();
      } else if (label == '=') {
        calculator.calculate();
      } else {
        calculator.append(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
      ),
      body: Column(
        children: [
          // Display area
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              child: Text(
                calculator.expression,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),
          // Result display
          Container(
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: Text(
              '${calculator.result}',
              style: const TextStyle(fontSize: 18, color: Colors.green),
            ),
          ),
          // Buttons grid
          Expanded(
            flex: 3, // Adjusted to take more space for buttons
            child: GridView.count(
              crossAxisCount: 4,
              padding: const EdgeInsets.all(2),
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              children: [
                CalculatorButton(label: '7', onPressed: () => _onButtonPressed('7')),
                CalculatorButton(label: '8', onPressed: () => _onButtonPressed('8')),
                CalculatorButton(label: '9', onPressed: () => _onButtonPressed('9')),
                CalculatorButton(label: '/', onPressed: () => _onButtonPressed('/')),
                CalculatorButton(label: '4', onPressed: () => _onButtonPressed('4')),
                CalculatorButton(label: '5', onPressed: () => _onButtonPressed('5')),
                CalculatorButton(label: '6', onPressed: () => _onButtonPressed('6')),
                CalculatorButton(label: '*', onPressed: () => _onButtonPressed('*')),
                CalculatorButton(label: '1', onPressed: () => _onButtonPressed('1')),
                CalculatorButton(label: '2', onPressed: () => _onButtonPressed('2')),
                CalculatorButton(label: '3', onPressed: () => _onButtonPressed('3')),
                CalculatorButton(label: '-', onPressed: () => _onButtonPressed('-')),
                CalculatorButton(label: 'C', onPressed: () => _onButtonPressed('C')),
                CalculatorButton(label: '0', onPressed: () => _onButtonPressed('0')),
                CalculatorButton(label: '%', onPressed: () => _onButtonPressed('%')),
                CalculatorButton(label: '+', onPressed: () => _onButtonPressed('+')),
                CalculatorButton(label: 'DEL', onPressed: () => _onButtonPressed('DEL'), flex: 2),
                CalculatorButton(label: '=', onPressed: () => _onButtonPressed('='), flex: 2),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
