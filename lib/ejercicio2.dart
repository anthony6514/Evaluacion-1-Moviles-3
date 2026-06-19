import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});
  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  final _profundidad = TextEditingController();
  final _densidad = TextEditingController();
  final _gravedad = TextEditingController();
  String _resultado = '';
  String _error = '';

  void _calcular() {
    final p = double.tryParse(_profundidad.text) ?? 0;

    if (p < 0) {
      setState(() {
        _error = 'La profundidad no puede ser negativa';
        _resultado = '';
      });
      return;
    }

    final d = double.tryParse(_densidad.text) ?? 1000;
    final g = double.tryParse(_gravedad.text) ?? 9.8;

    final presion = d * g * p;
    setState(() {
      _error = '';
      _resultado = 'P = ${presion.toStringAsFixed(2)} Pa';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset('assets/fondo.jpg', fit: BoxFit.cover),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _profundidad,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Profundidad (m)'),
              ),
              TextField(
                controller: _densidad,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Densidad kg/m³ (vacío=1000)'),
              ),
              TextField(
                controller: _gravedad,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Gravedad m/s² (vacío=9.8)'),
              ),
              const SizedBox(height: 16),
              ElevatedButton(onPressed: _calcular, child: const Text('Calcular')),
              const SizedBox(height: 16),
              if (_error.isNotEmpty) Text(_error, style: const TextStyle(color: Colors.red)),
              if (_resultado.isNotEmpty) Text(_resultado),
            ],
          ),
        ),
      ],
    );
  }
}
