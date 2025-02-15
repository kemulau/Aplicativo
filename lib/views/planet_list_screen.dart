import 'package:flutter/material.dart';
import '../controllers/planet_controller.dart';
import '../models/planet.dart';

class PlanetListScreen extends StatefulWidget {
  @override
  _PlanetListScreenState createState() => _PlanetListScreenState();
}

class _PlanetListScreenState extends State<PlanetListScreen> {
  final PlanetController _controller = PlanetController();
  List<Planet> _planets = [];

  @override
  void initState() {
    super.initState();
    _loadPlanets();
  }

  void _loadPlanets() async {
    List<Planet> planets = await _controller.fetchPlanets();
    setState(() {
      _planets = planets;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🌍 Lista de Planetas")),
      body: ListView.builder(
        itemCount: _planets.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text("${_planets[index].name} 🪐"),
            subtitle: Text("Distância: ${_planets[index].distanceFromSun} AU"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          // Adicionar lógica para navegar para a tela de adicionar
        },
      ),
    );
  }
}
