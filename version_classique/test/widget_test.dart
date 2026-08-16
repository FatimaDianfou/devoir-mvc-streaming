import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emissions_streaming/main.dart';

void main() {
  testWidgets('la page d accueil affiche le titre et les emissions', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    expect(find.text('Vos emissions en streaming'), findsOneWidget);
    expect(find.text('Le Journal du Soir'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('appuyer sur une emission ouvre la page de detail', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    await tester.tap(find.text('Le Journal du Soir'));
    await tester.pumpAndSettle();

    expect(find.text('Prochaines diffusions'), findsOneWidget);
    expect(find.text('Radio Plus'), findsWidgets);
  });
}
