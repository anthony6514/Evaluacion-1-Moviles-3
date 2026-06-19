import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// EJERCICIO 3 - Lista de videojuegos desde API
// URL: https://jritsqmet.github.io/web-api/videojuegos.json
// Campos reales del JSON: titulo, imagen, genero (lista), desarrollador

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});
  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  List _lista = [];
  bool _cargando = true;

  @override
  void initState() {
    super.initState();
    _cargar();
  }

  Future<void> _cargar() async {
    final res = await http.get(
      Uri.parse('https://jritsqmet.github.io/web-api/videojuegos.json'),
    );
    final data = jsonDecode(res.body);
    setState(() {
      _lista = data['videojuegos'];
      _cargando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cargando) return const Center(child: CircularProgressIndicator());

    return ListView.builder(
      itemCount: _lista.length,
      itemBuilder: (context, i) {
        final item = _lista[i];

        // genero es una Lista, la convertimos a texto uniendo con coma
        final genero = (item['genero'] as List).join(', ');

        return ListTile(
          // Dato 1: imagen (Image.network)
          leading: Image.network(
            item['imagen'] ?? '',
            width: 50,
            height: 50,
            errorBuilder: (c, e, s) => const Icon(Icons.image),
          ),
          // Dato 2: titulo
          title: Text(item['titulo'] ?? ''),
          // Dato 3: genero
          subtitle: Text(genero),
        );
      },
    );
  }
}
