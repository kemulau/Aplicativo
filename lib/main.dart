import 'package:flutter/material.dart';
import 'views/planet_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gerenciador de Planetas 🌍🪐',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PlanetListScreen(),
    );
  }
}
