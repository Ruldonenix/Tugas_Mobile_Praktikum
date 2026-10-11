import 'package:flutter/material.dart';
import 'package:tugas_3/KartuNama.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kartu Nama',
      debugShowCheckedModeBanner: false,
      home: KartuNama(),
    );
  }
}