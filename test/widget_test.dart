import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:examen_moviles/main.dart';

void main() {
  testWidgets('smoke test', (tester) async {
    await tester.pumpWidget(const MaterialApp(home: Home()));
  });
}
