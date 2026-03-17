// conversor_screen.dart — Exercício B
// Converte um valor em reais para Dólar, Euro ou Libra.

import 'package:flutter/material.dart';

class ConversorScreen extends StatefulWidget {
  const ConversorScreen({super.key});

  @override
  State<ConversorScreen> createState() => _ConversorScreenState();
}

class _ConversorScreenState extends State<ConversorScreen> {
  // Controlador do campo de valor em reais
  final TextEditingController _ctrlValor = TextEditingController();

  // Moeda selecionada no DropdownButton (começa como Dólar)
  String _moedaSelecionada = 'Dólar';

  // Resultado da conversão
  String? _resultado;

  // Mapa com as cotações de cada moeda
  // Map<chave, valor> — associa nome da moeda à cotação
  final Map<String, double> _cotacoes = {
    'Dólar': 5.40,
    'Euro': 6.50,
    'Libra': 7.00,
  };

  // Símbolo de cada moeda para exibir no resultado
  final Map<String, String> _simbolos = {
    'Dólar': 'US\$',
    'Euro': '€',
    'Libra': '£',
  };

  // Função que faz a conversão
  void _converter() {
    // Tenta converter o texto digitado em número
    final double? valor = double.tryParse(
      _ctrlValor.text.replaceAll(',', '.'), // aceita vírgula ou ponto
    );

    if (valor == null || valor <= 0) {
      setState(() {
        _resultado = 'Digite um valor em reais válido.';
      });
      return;
    }

    // Pega a cotação da moeda selecionada no mapa
    final double cotacao = _cotacoes[_moedaSelecionada]!;

    // Fórmula: valor convertido = valor em reais / cotação
    final double convertido = valor / cotacao;

    // Pega o símbolo da moeda para mostrar no resultado
    final String simbolo = _simbolos[_moedaSelecionada]!;

    setState(() {
      // toStringAsFixed(2) formata com 2 casas decimais
      _resultado =
          'R\$ ${valor.toStringAsFixed(2)} = '
          '$simbolo ${convertido.toStringAsFixed(2)}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício B — Conversor'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Digite o valor em reais:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            // Campo de texto para o valor em reais
            TextField(
              controller: _ctrlValor,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Valor (R\$)',
                prefixText: 'R\$ ',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Selecione a moeda:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),

            // DropdownButtonFormField = Select do Flutter
            DropdownButtonFormField<String>(
              value: _moedaSelecionada, // valor atual selecionado
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              // items são as opções do dropdown
              items: _cotacoes.keys.map((moeda) {
                return DropdownMenuItem<String>(
                  value: moeda,
                  // Mostra o nome + cotação de cada opção
                  child: Text('$moeda (cotação: R\$ ${_cotacoes[moeda]})')
                );
              }).toList(),
              // onChanged é chamado quando o usuário muda a seleção
              onChanged: (String? novaOpcao) {
                if (novaOpcao != null) {
                  setState(() {
                    _moedaSelecionada = novaOpcao;
                    _resultado = null; // limpa resultado anterior
                  });
                }
              },
            ),
            const SizedBox(height: 24),

            // Botão de converter
            ElevatedButton(
              onPressed: _converter,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 16),
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: const Text('Converter', style: TextStyle(fontSize: 16)),
            ),
            const SizedBox(height: 24),

            // Exibe o resultado somente se existir
            if (_resultado != null)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.teal.shade200),
                ),
                child: Text(
                  _resultado!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),

            // Tabela de cotações para referência
            const SizedBox(height: 32),
            const Text(
              'Cotações utilizadas:',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Table(
              border: TableBorder.all(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8),
              ),
              children: [
                TableRow(
                  decoration: BoxDecoration(color: Colors.grey.shade100),
                  children: const [
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Moeda', style: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8),
                      child: Text('Cotação', style: TextStyle(fontWeight: FontWeight.w500)),
                    ),
                  ],
                ),
                TableRow(children: [
                  const Padding(padding: EdgeInsets.all(8), child: Text('Dólar')),
                  const Padding(padding: EdgeInsets.all(8), child: Text('R\$ 5,40')),
                ]),
                TableRow(children: [
                  const Padding(padding: EdgeInsets.all(8), child: Text('Euro')),
                  const Padding(padding: EdgeInsets.all(8), child: Text('R\$ 6,50')),
                ]),
                TableRow(children: [
                  const Padding(padding: EdgeInsets.all(8), child: Text('Libra')),
                  const Padding(padding: EdgeInsets.all(8), child: Text('R\$ 7,00')),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
