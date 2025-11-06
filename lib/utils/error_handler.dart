import 'package:flutter/foundation.dart';

/// Centralized error handling for the application
class ErrorHandler {
  static void initializeErrorHandling() {
    // Handle Flutter framework errors
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
      if (kReleaseMode) {
        // In production, you might want to send to crash reporting service
        // FirebaseCrashlytics.instance.recordFlutterError(details);
      }
    };

    // Handle errors from async gaps
    PlatformDispatcher.instance.onError = (error, stack) {
      if (kReleaseMode) {
        // In production, you might want to send to crash reporting service
        // FirebaseCrashlytics.instance.recordError(error, stack);
      }
      return true;
    };
  }
}
