import 'package:banti_rathod_flutter/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('NavigationService Tests', () {
    late NavigationService navigationService;

    setUp(() {
      navigationService = NavigationService();
    });

    test('initializes keys correctly', () {
      final keys = {
        'header': GlobalKey(),
        'about': GlobalKey(),
        'projects': GlobalKey(),
      };

      navigationService.initializeKeys(keys);

      expect(navigationService.getKey('header'), equals(keys['header']));
      expect(navigationService.getKey('about'), equals(keys['about']));
      expect(navigationService.getKey('projects'), equals(keys['projects']));
    });

    test('returns null for non-existent key', () {
      expect(navigationService.getKey('nonExistent'), isNull);
    });

    test('getKey retrieves correct key after initialization', () {
      final testKey = GlobalKey();
      navigationService.initializeKeys({'test': testKey});

      expect(navigationService.getKey('test'), equals(testKey));
    });
  });
}

