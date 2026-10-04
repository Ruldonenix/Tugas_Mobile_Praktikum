import 'package:flutter/material.dart';
import 'home_page.dart';
void main() {
  runApp(const MyBini());
}

class MyBini extends StatelessWidget {
  const MyBini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List My Bini',
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}