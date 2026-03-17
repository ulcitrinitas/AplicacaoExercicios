import 'package:flutter/material.dart';

class MaiorNumScreen extends StatelessWidget {
  const MaiorNumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Maior número"),
        backgroundColor: const Color(0xFF543FCA),
        foregroundColor: const Color(0xFFE6E1EE),
      ),
    );
  }
}
