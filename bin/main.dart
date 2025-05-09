import 'package:flutter/material.dart';
import 'views/inscription_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestion des Inscriptions',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const InscriptionView(),
    );
  }
}
