// Configures Gradle plugin management and project structure for the Flutter app
pluginManagement {
    // Dynamically retrieve the Flutter SDK path from local.properties
    val flutterSdkPath = run {
        // Load properties from local.properties file
        val properties = java.util.Properties()
        file("local.properties").inputStream().use { properties.load(it) }
        // Get the flutter.sdk property
        val flutterSdkPath = properties.getProperty("flutter.sdk")
        // Ensure flutter.sdk is set, or throw an error
        require(flutterSdkPath != null) { "flutter.sdk not set in local.properties" }
        flutterSdkPath
    }

    // Include Flutter's Gradle build tools from the Flutter SDK
    // Connects to: local.properties (for flutter.sdk path)
    includeBuild("$flutterSdkPath/packages/flutter_tools/gradle")

    // Define repositories for downloading Gradle plugins
    repositories {
        google() // Google Maven repository for Android plugins
        mavenCentral() // Central Maven repository for general dependencies
        gradlePluginPortal() // Gradle plugin portal for additional plugins
        maven { url = uri("https://repo1.maven.org/maven2/") } // Fallback for dependency downloads
    }
}

// Apply plugins to the project
plugins {
    // Flutter plugin loader for integrating Flutter with Gradle
    id("dev.flutter.flutter-plugin-loader") version "1.0.0"
    // Android application plugin (applied to subprojects, not here)
    id("com.android.application") version "8.7.3" apply false
    // Kotlin plugin for Android (applied to subprojects, not here)
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
}

// Include the Android app module
// Connects to: android/app/build.gradle.kts (configures the :app module)
include(":app")