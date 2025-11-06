import 'package:banti_rathod_flutter/main.dart';
import 'package:banti_rathod_flutter/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Navigation Integration Tests', () {
    testWidgets('app initializes without errors', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(); // Just pump once, don't wait for all animations

      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('displays navigation menu', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 1));

      // Check for navigation items - may appear in nav bar or drawer
      expect(find.text('About'), findsWidgets);
      expect(find.text('Projects'), findsWidgets);
    });

    testWidgets('theme toggle button is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 1));

      // Theme toggle icon should be present
      expect(find.byIcon(Icons.dark_mode), findsWidgets);
    });

    testWidgets('menu drawer button is present', (WidgetTester tester) async {
      await tester.pumpWidget(const MyPortfolioApp());
      await tester.pump(const Duration(seconds: 1));

      // Menu icon should be present
      expect(find.byIcon(Icons.menu), findsWidgets);
    });
  });
}

