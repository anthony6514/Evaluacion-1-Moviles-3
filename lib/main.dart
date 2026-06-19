import 'package:flutter/material.dart';
import 'ejercicio1.dart';
import 'ejercicio2.dart';
import 'ejercicio3.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  final _pantallas = const [Ejercicio1(), Ejercicio2(), Ejercicio3()];

  void _mostrarInfo() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ejercicios de Programación'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Programador: Anthony Ruiz'),
            Text('Carrera: Desarrollo de Software'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ejercicios'),
        actions: [
          TextButton(
            onPressed: _mostrarInfo,
            child: const Text('Info', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: _pantallas[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: 'Salud'),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: 'Líquidos'),
          BottomNavigationBarItem(icon: SizedBox.shrink(), label: 'Videojuegos'),
        ],
      ),
    );
  }
}
