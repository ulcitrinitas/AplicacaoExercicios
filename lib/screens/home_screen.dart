import 'package:flutter/material.dart';
import 'package:projeto_1703/screens/somar_screen.dart';

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
        foregroundColor: const Color(0xFFE6E1EE),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              "Escolha um exercício",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MaiorNumeroScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.looks_one_outlined),
              label: Text("Maior Número"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Color(0xFFEEB91B),
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ConversorScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.currency_exchange),
              label: Text("Conversor"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Color(0xFF1BEEB9),
                foregroundColor: Colors.black,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SomarScreen(),
                  ),
                );
              },
              icon: const Icon(Icons.numbers),
              label: Text("Somar"),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 20),
                backgroundColor: Color(0xFF1BEEB9),
                foregroundColor: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
