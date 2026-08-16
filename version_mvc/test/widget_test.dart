import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emissions_streaming_mvc/main.dart';

void main() {
  testWidgets('la page d accueil affiche le titre et les emissions', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    expect(find.text('Vos emissions en streaming'), findsOneWidget);
    expect(find.text('Le Journal du Soir'), findsOneWidget);
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('appuyer sur une emission ouvre sa page de detail avec la bonne image', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    await tester.tap(find.text('Tribune Sportive'));
    await tester.pumpAndSettle();

    expect(find.text('Prochaines diffusions'), findsOneWidget);
    expect(find.text('RTS Sport'), findsWidgets);

    final images = tester.widgetList<Image>(find.byType(Image));
    final assetNames = images.map((img) => (img.image as AssetImage).assetName);
    expect(assetNames, contains('assets/images/sport.png'));
  });
}
