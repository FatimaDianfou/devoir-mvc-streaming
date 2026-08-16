import 'package:flutter_test/flutter_test.dart';
import 'package:emissions_streaming_mvc/models/diffusion.dart';
import 'package:emissions_streaming_mvc/models/generateur_diffusions.dart';

void main() {
  test('heureFormatee ajoute bien un zero devant les minutes < 10', () {
    final d = Diffusion(jour: 'lundi', heure: 9, minute: 5);
    expect(d.heureFormatee, '9h05');
  });

  test('libelle contient le jour de la diffusion', () {
    final d = Diffusion(jour: 'mardi', heure: 14, minute: 30);
    expect(d.libelle, 'Diffusion du mardi');
  });

  test('le generateur produit le nombre de diffusions demande', () {
    final diffusions = GenerateurDiffusions.generer(nombre: 7);
    expect(diffusions.length, 7);
  });

  test('les heures generees restent dans une plage raisonnable (6h-22h)', () {
    final diffusions = GenerateurDiffusions.generer(nombre: 30);
    for (final d in diffusions) {
      expect(d.heure, greaterThanOrEqualTo(6));
      expect(d.heure, lessThan(22));
    }
  });
}
