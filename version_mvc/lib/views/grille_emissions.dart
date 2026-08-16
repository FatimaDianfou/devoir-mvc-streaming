import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../models/emission.dart';
import 'carte_emission.dart';

class GrilleEmissions extends StatelessWidget {
  final List<Emission> emissions;
  final void Function(Emission emission) onTap;

  const GrilleEmissions({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 160,
      minSpacing: 12,
      children: emissions.map((emission) {
        return CarteEmission(
          emission: emission,
          onTap: () => onTap(emission),
        );
      }).toList(),
    );
  }
}
