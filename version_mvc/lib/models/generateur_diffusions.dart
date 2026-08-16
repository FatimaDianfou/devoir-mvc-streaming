import 'dart:math';

import 'diffusion.dart';

class GenerateurDiffusions {
  static const _jours = ['lundi', 'mardi', 'mercredi', 'jeudi', 'vendredi', 'samedi', 'dimanche'];

  static List<Diffusion> generer({int nombre = 5}) {
    final random = Random();
    return List.generate(nombre, (_) {
      return Diffusion(
        jour: _jours[random.nextInt(_jours.length)],
        heure: 6 + random.nextInt(16),
        minute: random.nextInt(60),
      );
    });
  }
}
