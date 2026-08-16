import 'package:flutter/foundation.dart';

import '../models/diffusion.dart';
import '../models/emission.dart';
import '../models/generateur_diffusions.dart';

class EmissionController {
  final ValueNotifier<List<Emission>> emissions = ValueNotifier<List<Emission>>([]);

  static const List<Emission> _emissionsSimulees = [
    Emission(id: 'e1', nom: 'Le Journal du Soir', chaine: 'Radio Plus', cheminImage: 'assets/images/news.png'),
    Emission(id: 'e2', nom: 'Tribune Sportive', chaine: 'RTS Sport', cheminImage: 'assets/images/sport.png'),
    Emission(id: 'e3', nom: 'Hit Parade', chaine: 'Fun Radio', cheminImage: 'assets/images/musique.png'),
    Emission(id: 'e4', nom: 'Cinephile', chaine: 'Cine Plus', cheminImage: 'assets/images/cinema.png'),
    Emission(id: 'e5', nom: 'Recre Kids', chaine: 'Radio Ados', cheminImage: 'assets/images/jeunesse.png'),
    Emission(id: 'e6', nom: 'Grand Angle', chaine: 'Decouverte FM', cheminImage: 'assets/images/documentaire.png'),
  ];

  void loadEmissions() {
    emissions.value = _emissionsSimulees;
  }

  List<Emission> getEmissions() => emissions.value;

  Emission onEmissionSelected(Emission emission) {
    return emission;
  }

  List<Diffusion> diffusionsPour(Emission emission) {
    return GenerateurDiffusions.generer();
  }
}
