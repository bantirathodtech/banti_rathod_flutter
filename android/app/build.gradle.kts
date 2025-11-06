// Configures the Android app module for the Flutter project
// Connects to: settings.gradle.kts (included as :app module)
//             local.properties (uses flutter.* properties)
//             android/build.gradle.kts (inherits repositories)
//             AndroidManifest.xml (defines app structure)

plugins {
    // Android application plugin for building the app
    id("com.android.application")
    // Kotlin plugin for Android
    id("kotlin-android")
    // Flutter Gradle plugin for integrating Flutter with Android
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // Set the namespace for the Android app
    namespace = "com.example.banti_rathod_flutter"

    // Use Flutter's compileSdkVersion from local.properties
    compileSdk = flutter.compileSdkVersion

    // Use Flutter's NDK version for native code
//    ndkVersion = flutter.ndkVersion
    ndkVersion = "27.0.12077973" // Explicitly specify NDK version to match installed version
//
    // Configure Java/Kotlin compatibility
    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    // Configure Kotlin JVM target
    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    // Default configuration for the app
    defaultConfig {
        // Unique application ID for the Android app
        applicationId = "com.example.banti_rathod_flutter"
        // Minimum SDK version (from Flutter)
        minSdk = flutter.minSdkVersion
        // Target SDK version (from Flutter)
        targetSdk = flutter.targetSdkVersion
        // Version code (from local.properties)
        versionCode = flutter.versionCode
        // Version name (from local.properties)
        versionName = flutter.versionName
    }

    // Define build types (e.g., debug, release)
    buildTypes {
        release {
            // Use debug signing config for now (TODO: replace with release signing)
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

// Configure Flutter source directory
flutter {
    source = "../.." // Points to the root Flutter project directory
}