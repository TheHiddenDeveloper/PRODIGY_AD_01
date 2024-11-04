// screens/splash_screen.dart
import 'package:flutter/material.dart';
import 'main_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const MainScreen()),
      );
    });

    return const Scaffold(
      body: Center(
        child: Text('Calculator App', style: TextStyle(fontSize: 24, color: Colors.green)),
      ),
    );
  }
}
