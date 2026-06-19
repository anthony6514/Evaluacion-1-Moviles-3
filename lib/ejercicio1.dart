import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});
  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  final _sistolica = TextEditingController();
  final _diastolica = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcular() {
    final s = double.tryParse(_sistolica.text) ?? 0;
    final d = double.tryParse(_diastolica.text) ?? 0;

    if (s < d) {
      setState(() {
        _error = 'Error: valores inválidos.';
        _resultado = '';
      });
      return;
    }

    final pam = d + (s - d) / 3;
    setState(() {
      _error = '';
      _resultado = 'PAM = ${pam.toStringAsFixed(2)} mmHg';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _sistolica,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Presión Sistólica (mmHg)'),
          ),
          TextField(
            controller: _diastolica,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'Presión Diastólica (mmHg)'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
          const SizedBox(height: 16),
          if (_error.isNotEmpty) Text(_error, style: const TextStyle(color: Colors.red)),
          if (_resultado.isNotEmpty) Text(_resultado),
        ],
      ),
    );
  }
}
