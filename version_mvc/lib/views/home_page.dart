import 'package:flutter/material.dart';

import '../controllers/emission_controller.dart';
import '../models/emission.dart';
import 'detail_page.dart';
import 'grille_emissions.dart';

class HomePage extends StatefulWidget {
  final EmissionController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    widget.controller.loadEmissions();
  }

  void _ouvrirDetail(Emission emission) {
    final emissionChoisie = widget.controller.onEmissionSelected(emission);
    final diffusions = widget.controller.diffusionsPour(emissionChoisie);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailPage(
          emission: emissionChoisie,
          diffusions: diffusions,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Vos emissions en streaming'),
        actions: [
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
          IconButton(icon: const Icon(Icons.list), onPressed: () {}),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder<List<Emission>>(
          valueListenable: widget.controller.emissions,
          builder: (context, emissions, _) {
            return GrilleEmissions(
              emissions: emissions,
              onTap: _ouvrirDetail,
            );
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
