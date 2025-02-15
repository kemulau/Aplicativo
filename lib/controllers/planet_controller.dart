import '../database/database_helper.dart';
import '../models/planet.dart';

class PlanetController {
  Future<void> addPlanet(Planet planet) async {
    await DatabaseHelper().insertPlanet(planet);
  }

  Future<List<Planet>> fetchPlanets() async {
    return await DatabaseHelper().getPlanets();
  }

  Future<void> updatePlanet(Planet planet) async {
    await DatabaseHelper().updatePlanet(planet);
  }

  Future<void> deletePlanet(int id) async {
    await DatabaseHelper().deletePlanet(id);
  }
}
