import 'package:banti_rathod_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Portfolio App Smoke Tests', () {
    testWidgets('app launches successfully', (WidgetTester tester) async {
      // Build our app and trigger a frame.
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump();

      // Verify that the app is rendered
      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('displays header section', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Banti Rathod'), findsOneWidget);
    });

    testWidgets('displays about section', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('About Me'), findsOneWidget);
    });

    testWidgets('displays work experience section', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 2));

      expect(find.text('Work Experience'), findsOneWidget);
    });

    testWidgets('displays projects section subtitle', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 2));

      // Find "Projects" section subtitle
      expect(find.text('Showcasing my Flutter development expertise'), findsOneWidget);
    });
  });
}
