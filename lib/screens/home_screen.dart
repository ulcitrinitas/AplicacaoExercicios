import 'package:flutter/material.dart';

import 'conversor_screen.dart';
import 'maior_num_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de Exercícios"),
        backgroundColor: const Color(0xFF543FCA),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Escolha um exercício",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(onPressed: (){}, label: Text("Label")),
            ],
        ),
      ),
    );
  }
}
