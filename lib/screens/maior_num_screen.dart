// maior_numero_screen.dart — Exercício A
// Recebe 3 números e mostra o maior deles.

import 'package:flutter/material.dart';

// StatefulWidget porque precisamos guardar o estado (resultado)
class MaiorNumeroScreen extends StatefulWidget {
  const MaiorNumeroScreen({super.key});

  @override
  State<MaiorNumeroScreen> createState() => _MaiorNumeroScreenState();
}

class _MaiorNumeroScreenState extends State<MaiorNumeroScreen> {
  // Controladores de texto capturam o que o usuário digita
  final TextEditingController _ctrl1 = TextEditingController();
  final TextEditingController _ctrl2 = TextEditingController();
  final TextEditingController _ctrl3 = TextEditingController();

  // Variável que guarda o resultado. null = ainda não calculou
  String? _resultado;

  // Função que calcula o maior número
  void _calcular() {
    // Tentamos converter os textos em números (double)
    final double? n1 = double.tryParse(_ctrl1.text);
    final double? n2 = double.tryParse(_ctrl2.text);
    final double? n3 = double.tryParse(_ctrl3.text);

    // Se algum campo estiver vazio ou inválido, mostramos um aviso
    if (n1 == null || n2 == null || n3 == null) {
      setState(() {
        _resultado = 'Preencha os 3 campos com números válidos.';
      });
      return; // interrompe a função aqui
    }

    // Encontramos o maior usando comparações simples
    double maior = n1; // começa assumindo que n1 é o maior
    if (n2 > maior) maior = n2; // se n2 for maior, atualiza
    if (n3 > maior) maior = n3; // se n3 for maior, atualiza

    // setState atualiza a tela com o novo resultado
    setState(() {
      _resultado = 'O maior número é: $maior';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício A — Maior Número'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        // SingleChildScrollView evita overflow em telas pequenas
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Digite 3 números:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),

            // Campo de texto para o número 1
            TextField(
              controller: _ctrl1,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Número 1',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Campo de texto para o número 2
            TextField(
              controller: _ctrl2,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Número 2',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Campo de texto para o número 3
            TextField(
              controller: _ctrl3,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Número 3',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            // Botão que chama a função _calcular ao ser pressionado
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text('Calcular', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 24),

            // Mostra o resultado somente se _resultado não for null
            if (_resultado != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.indigo.shade200),
                ),
                child: Text(
                  _resultado!,
                  style: const TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
