import 'package:banti_rathod_flutter/widgets/skill_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SkillBadge Widget Tests', () {
    testWidgets('displays skill label correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkillBadge(label: 'Flutter'),
          ),
        ),
      );

      expect(find.text('Flutter'), findsOneWidget);
    });

    testWidgets('renders with different labels', (WidgetTester tester) async {
      const skills = ['Dart', 'Flutter', 'Firebase', 'Provider'];

      for (final skill in skills) {
        await tester.pumpWidget(
          MaterialApp(
            home: Scaffold(
              body: SkillBadge(label: skill),
            ),
          ),
        );

        expect(find.text(skill), findsOneWidget);
        await tester.pumpAndSettle();
      }
    });

    testWidgets('has correct structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: SkillBadge(label: 'Test Skill'),
          ),
        ),
      );

      expect(find.byType(SkillBadge), findsOneWidget);
      expect(find.byType(AnimatedContainer), findsOneWidget);
      expect(find.byType(Text), findsOneWidget);
    });
  });
}

