import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const AmigoPetApp());
}

class AmigoPetApp extends StatelessWidget {
  const AmigoPetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AmigoPet',
      theme: ThemeData(
        fontFamily: 'Arial',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}