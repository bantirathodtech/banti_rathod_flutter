import 'package:banti_rathod_flutter/sections/work_experience_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WorkExperienceSection Widget Tests', () {
    testWidgets('renders section title', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: WorkExperienceSection(),
            ),
          ),
        ),
      );

      expect(find.text('Work Experience'), findsOneWidget);
    });

    testWidgets('renders experience items', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: WorkExperienceSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      // Check for company names
      expect(find.text('Suvidha Software Solutions Pvt Ltd'), findsOneWidget);
      expect(find.text('Exceloid Soft Systems Pvt Ltd'), findsOneWidget);
    });

    testWidgets('displays current job badge', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(
              child: WorkExperienceSection(),
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.text('Current'), findsOneWidget);
    });
  });
}

