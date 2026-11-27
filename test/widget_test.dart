import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';

import 'package:upp_one/main.dart';

List<String> displayedLogoAssets(
  WidgetTester tester,
) {
  return tester
      .widgetList<Image>(
        find.byType(Image, skipOffstage: false),
      )
      .map((image) => image.image)
      .whereType<AssetImage>()
      .map((image) => image.assetName)
      .toList();
}

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

  testWidgets('UPP ONE all light mode logos',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final images = displayedLogoAssets(tester);

    expect(images, contains(AppAssets.logoPrimary));
    expect(images, contains(AppAssets.logoHorizontal));
    expect(images, contains(AppAssets.logoMonogram));

    expect(images, isNot(contains(AppAssets.logoWhite)));
    expect(
      images,
      isNot(contains(AppAssets.logoHorizontalWhite)),
    );
    expect(
      images,
      isNot(contains(AppAssets.logoMonogramWhite)),
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE all dark mode logos',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    await tester.tap(
      find.byKey(const Key('theme_toggle')),
    );
    await tester.pumpAndSettle();

    final images = displayedLogoAssets(tester);

    expect(images, contains(AppAssets.logoWhite));
    expect(
      images,
      contains(AppAssets.logoHorizontalWhite),
    );
    expect(
      images,
      contains(AppAssets.logoMonogramWhite),
    );

    expect(images, isNot(contains(AppAssets.logoPrimary)));
    expect(
      images,
      isNot(contains(AppAssets.logoHorizontal)),
    );
    expect(
      images,
      isNot(contains(AppAssets.logoMonogram)),
    );

    expect(tester.takeException(), isNull);
  });

  testWidgets('UPP ONE repeated theme switching',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();

    final toggle =
        find.byKey(const Key('theme_toggle'));

    for (int i = 0; i < 3; i++) {
      await tester.tap(toggle);
      await tester.pumpAndSettle();

      expect(find.text('DARK MODE'), findsOneWidget);

      final darkImages = displayedLogoAssets(tester);

      expect(darkImages, contains(AppAssets.logoWhite));
      expect(
        darkImages,
        contains(AppAssets.logoHorizontalWhite),
      );
      expect(
        darkImages,
        contains(AppAssets.logoMonogramWhite),
      );

      await tester.tap(toggle);
      await tester.pumpAndSettle();

      expect(find.text('LIGHT MODE'), findsOneWidget);

      final lightImages = displayedLogoAssets(tester);

      expect(lightImages, contains(AppAssets.logoPrimary));
      expect(
        lightImages,
        contains(AppAssets.logoHorizontal),
      );
      expect(
        lightImages,
        contains(AppAssets.logoMonogram),
      );

      expect(tester.takeException(), isNull);
    }
  });
}
