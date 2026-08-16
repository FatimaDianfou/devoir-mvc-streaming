import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:emissions_streaming/main.dart';

void main() {
  testWidgets('chaque emission ouvre bien sa propre image sur la page de detail', (WidgetTester tester) async {
    await tester.pumpWidget(const MonApplication());

    await tester.tap(find.text('Tribune Sportive'));
    await tester.pumpAndSettle();

    final images = tester.widgetList<Image>(find.byType(Image));
    final assetNames = images
        .map((img) => (img.image as AssetImage).assetName)
        .toList();

    print('Images affichees sur la page detail de Tribune Sportive: $assetNames');

    expect(assetNames, contains('assets/images/sport.png'));
    expect(assetNames, isNot(contains('assets/images/documentaire.png')));
  });
}
