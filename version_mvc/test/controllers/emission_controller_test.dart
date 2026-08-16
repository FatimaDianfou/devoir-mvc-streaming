import 'package:flutter_test/flutter_test.dart';
import 'package:emissions_streaming_mvc/controllers/emission_controller.dart';

void main() {
  test('getEmissions est vide tant que loadEmissions n a pas ete appele', () {
    final controller = EmissionController();
    expect(controller.getEmissions(), isEmpty);
  });

  test('loadEmissions remplit la liste des emissions', () {
    final controller = EmissionController();
    controller.loadEmissions();
    expect(controller.getEmissions().length, 6);
  });

  test('onEmissionSelected renvoie bien l emission passee en parametre', () {
    final controller = EmissionController();
    controller.loadEmissions();
    final premiere = controller.getEmissions().first;

    final resultat = controller.onEmissionSelected(premiere);

    expect(resultat.id, premiere.id);
  });

  test('diffusionsPour renvoie une liste non vide', () {
    final controller = EmissionController();
    controller.loadEmissions();
    final emission = controller.getEmissions().first;

    final diffusions = controller.diffusionsPour(emission);

    expect(diffusions, isNotEmpty);
  });
}
