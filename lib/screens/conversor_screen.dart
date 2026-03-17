import 'package:flutter/material.dart';

class ConversorScreen extends StatelessWidget {
  const ConversorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conversor"),
        backgroundColor: const Color(0xFF543FCA),
        foregroundColor: const Color(0xFFE6E1EE),
      ),
    );
  }
}
