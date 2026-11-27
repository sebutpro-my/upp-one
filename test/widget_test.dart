import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:upp_one/main.dart';

void main() {
  testWidgets('UPP ONE application startup',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.text('UPP ONE'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE default light mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    expect(find.text('LIGHT MODE'), findsOneWidget);

    final Image logo = tester.widget<Image>(
      find.byKey(const Key('main_logo')),
    );

    expect(
      (logo.image as AssetImage).assetName,
      AppAssets.logoPrimary,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE switch to dark mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const Key('theme_toggle')),
    );

    await tester.pumpAndSettle();

    expect(find.text('DARK MODE'), findsOneWidget);

    final Image logo = tester.widget<Image>(
      find.byKey(const Key('main_logo')),
    );

    expect(
      (logo.image as AssetImage).assetName,
      AppAssets.logoWhite,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE return to light mode',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final toggle =
        find.byKey(const Key('theme_toggle'));

    await tester.tap(toggle);
    await tester.pumpAndSettle();

    expect(find.text('DARK MODE'), findsOneWidget);

    await tester.tap(toggle);
    await tester.pumpAndSettle();

    expect(find.text('LIGHT MODE'), findsOneWidget);

    final Image logo = tester.widget<Image>(
      find.byKey(const Key('main_logo')),
    );

    expect(
      (logo.image as AssetImage).assetName,
      AppAssets.logoPrimary,
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE logo assets displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final images = tester
        .widgetList<Image>(find.byType(Image))
        .map((image) => image.image)
        .whereType<AssetImage>()
        .map((image) => image.assetName)
        .toList();

    expect(images, contains(AppAssets.logoPrimary));
    expect(images, contains(AppAssets.logoHorizontal));
    expect(images, contains(AppAssets.logoMonogram));

    expect(tester.takeException(), isNull);
  });
}
