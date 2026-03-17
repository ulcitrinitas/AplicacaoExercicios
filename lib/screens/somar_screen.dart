import 'package:flutter/material.dart';

class SomarScreen extends StatefulWidget {
  const SomarScreen({super.key});

  @override
  State<SomarScreen> createState() => _SomarScreenState();
}

class _SomarScreenState extends State<SomarScreen> {
  final TextEditingController _ctrl1 = TextEditingController();
  final TextEditingController _ctrl2 = TextEditingController();
  final TextEditingController _ctrl3 = TextEditingController();

  String? _resultado;

  // Função que calcula o maior número
  void _calcular() {
    // Tentamos converter os textos em números (double)
    final double? n1 = double.tryParse(_ctrl1.text);
    final double? n2 = double.tryParse(_ctrl2.text);
    final double? n3 = double.tryParse(_ctrl3.text);

    // Se algum campo estiver vazio ou inválido, mostramos um aviso

    double num1 = n1 ?? 0;
    double num2 = n2 ?? 0;
    double num3 = n3 ?? 0;

    double? soma = num1 + num2 + num3;

    // setState atualiza a tela com o novo resultado
    setState(() {
      _resultado = 'A soma é $soma';
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
