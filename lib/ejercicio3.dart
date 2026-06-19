import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        final genero = (item['genero'] as List).join(', ');

        return ListTile(
          leading: Image.network(
            item['imagen'] ?? '',
            width: 50,
            height: 50,
            errorBuilder: (c, e, s) => const Icon(Icons.image),
          ),
          title: Text(item['titulo'] ?? ''),
          subtitle: Text(genero),
        );
      },
    );
  }
}
