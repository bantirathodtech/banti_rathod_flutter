import 'package:banti_rathod_flutter/sections/about_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('AboutSection Widget Tests', () {
    testWidgets('renders section title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AboutSection(),
            ),
          ),
        ),
      );

      expect(find.text('About Me'), findsOneWidget);
    });

    testWidgets('renders download resume button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AboutSection(),
            ),
          ),
        ),
      );

      expect(find.text('Download Resume'), findsOneWidget);
    });

    testWidgets('renders skills section', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AboutSection(),
            ),
          ),
        ),
      );

      expect(find.text('Skills & Technologies'), findsOneWidget);
    });

    testWidgets('displays skills badges', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: AboutSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for some skill labels
      expect(find.text('Dart'), findsWidgets);
      expect(find.text('Flutter'), findsWidgets);
    });
  });
}

