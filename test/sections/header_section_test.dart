import 'package:banti_rathod_flutter/sections/header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeaderSection Widget Tests', () {
    testWidgets('renders name', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeaderSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Banti Rathod'), findsOneWidget);
    });

    testWidgets('renders role/tagline', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeaderSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Flutter Developer'), findsOneWidget);
    });

    testWidgets('displays profile image with Semantics', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: HeaderSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(CircleAvatar), findsOneWidget);
    });
  });
}

