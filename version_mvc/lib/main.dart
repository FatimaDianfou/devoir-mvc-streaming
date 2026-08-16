import 'package:flutter/material.dart';

import 'controllers/emission_controller.dart';
import 'views/home_page.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = EmissionController();

    return MaterialApp(
      title: 'Emissions en streaming - MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.amber,
        useMaterial3: true,
      ),
      home: HomePage(controller: controller),
    );
  }
}
