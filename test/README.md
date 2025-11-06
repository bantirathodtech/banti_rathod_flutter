# Test Suite

This directory contains comprehensive tests for the Flutter portfolio application.

## Test Structure

```
test/
├── widgets/          # Widget component tests
├── sections/         # Section component tests
├── utils/            # Utility function tests
├── integration/      # Integration tests
├── golden/           # Golden tests (visual regression)
└── widget_test.dart # Main app smoke tests
```

## Running Tests

### Run all tests
```bash
flutter test
```

### Run specific test file
```bash
flutter test test/widgets/custom_button_test.dart
```

### Run tests with coverage
```bash
flutter test --coverage
```

### Generate golden files
```bash
flutter test --update-goldens
```

## Test Coverage

### Widget Tests
- ✅ CustomButton - All button states and interactions
- ✅ SkillBadge - Badge rendering and labels
- ✅ Navigation - Navigation items and interactions

### Section Tests
- ✅ HeaderSection - Profile display and animations
- ✅ AboutSection - Content rendering and skills
- ✅ WorkExperienceSection - Timeline and experience items

### Integration Tests
- ✅ Navigation flows
- ✅ Theme switching
- ✅ App initialization

### Golden Tests (Visual Regression)
- HeaderSection - Mobile/Tablet/Desktop sizes
- AboutSection - Desktop layout
- WorkExperienceSection - Mobile layout

## Test Best Practices

1. **Isolation**: Each test should be independent
2. **Naming**: Use descriptive test names
3. **Setup**: Use `setUp` and `tearDown` for common initialization
4. **Assertions**: Use specific matchers (findsOneWidget, findsNothing, etc.)
5. **Async**: Use `pumpAndSettle` for animations

## Notes

- Golden tests are currently skipped (set `skip: false` to enable)
- Run `flutter test --update-goldens` to generate golden files
- Some tests require proper asset setup

