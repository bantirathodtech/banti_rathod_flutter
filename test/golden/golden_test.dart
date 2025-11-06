import 'package:banti_rathod_flutter/sections/about_section.dart';
import 'package:banti_rathod_flutter/sections/header_section.dart';
import 'package:banti_rathod_flutter/sections/work_experience_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Golden Tests - Responsive Layouts', () {
    testWidgets('HeaderSection - Mobile Size', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(
        const Size(375, 667),
      ); // iPhone SE size

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: HeaderSection())),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(HeaderSection),
        matchesGoldenFile('golden/header_section_mobile.png'),
      );
    }, skip: true); // Skip until goldens are generated

    testWidgets('HeaderSection - Tablet Size', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(const Size(768, 1024)); // iPad size

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: HeaderSection())),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(HeaderSection),
        matchesGoldenFile('golden/header_section_tablet.png'),
      );
    }, skip: true);

    testWidgets('AboutSection - Desktop Size', (WidgetTester tester) async {
      await tester.binding.setSurfaceSize(
        const Size(1920, 1080),
      ); // Desktop size

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(body: SingleChildScrollView(child: AboutSection())),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(AboutSection),
        matchesGoldenFile('golden/about_section_desktop.png'),
      );
    }, skip: true);

    testWidgets('WorkExperienceSection - Mobile Size', (
      WidgetTester tester,
    ) async {
      await tester.binding.setSurfaceSize(const Size(375, 667));

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SingleChildScrollView(child: WorkExperienceSection()),
          ),
        ),
      );

      await tester.pumpAndSettle();

      await expectLater(
        find.byType(WorkExperienceSection),
        matchesGoldenFile('golden/work_experience_mobile.png'),
      );
    }, skip: true);
  });
}
