import 'package:flutter/material.dart';

// EJERCICIO 1 - Presión Arterial Media
// Fórmula: PAM = Diastólica + (Sistólica - Diastólica) / 3

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});
  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final _sistolica = TextEditingController();
  final _diastolica = TextEditingController();
  String _resultado = '';

  void _calcular() {
    final s = double.tryParse(_sistolica.text) ?? 0;
    final d = double.tryParse(_diastolica.text) ?? 0;

    // Validación: sistólica no puede ser menor que diastólica
    if (s < d) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: const Text('Error: valores inválidos.'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
          ],
        ),
      );
      return;
    }

    // Cálculo PAM
    final pam = d + (s - d) / 3;
    setState(() => _resultado = 'PAM = ${pam.toStringAsFixed(2)} mmHg');
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Campo presión sistólica
          TextField(
            controller: _sistolica,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Presión Sistólica (mmHg)'),
          ),
          // Campo presión diastólica
          TextField(
            controller: _diastolica,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Presión Diastólica (mmHg)'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
          const SizedBox(height: 16),
          Text(_resultado),
        ],
      ),
    );
  }
}
