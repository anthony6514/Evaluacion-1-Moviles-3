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

  void _calcular() {
    final p = double.tryParse(_profundidad.text) ?? 0;

    if (p < 0) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          content: const Text('La profundidad no puede ser negativa'),
          actions: [
            TextButton(onPressed: () => Navigator.pop(context), child: const Text('OK'))
          ],
        ),
      );
      return;
    }

    final d = double.tryParse(_densidad.text) ?? 1000;
    final g = double.tryParse(_gravedad.text) ?? 9.8;

    final presion = d * g * p;
    setState(() => _resultado = 'P = ${presion.toStringAsFixed(2)} Pa');
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
              Text(_resultado),
            ],
          ),
        ),
      ],
    );
  }
}
