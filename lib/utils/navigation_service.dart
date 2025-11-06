import 'package:flutter/material.dart';

class NavigationService {
  final Map<String, GlobalKey> _sectionKeys = {};

  void initializeKeys(Map<String, GlobalKey> keys) {
    _sectionKeys.addAll(keys);
  }

  GlobalKey? getKey(String sectionKey) {
    return _sectionKeys[sectionKey];
  }

  void scrollToSection(String sectionKey, BuildContext context) {
    final key = _sectionKeys[sectionKey];
    if (key != null && key.currentContext != null) {
      Scrollable.ensureVisible(
        key.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        alignment: 0.0, // Scroll to top of section
      );
    } else {
      debugPrint('Section key $sectionKey not found or context is null');
    }
  }
}
