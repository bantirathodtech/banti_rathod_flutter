// Configures project-wide settings for all subprojects
// Connects to: settings.gradle.kts (uses repositories defined there)
//             android/app/build.gradle.kts (applies to :app module)

allprojects {
    // Define repositories for dependencies used by all subprojects
    repositories {
        google() // Google Maven repository for Android dependencies
        mavenCentral() // Central Maven repository for general dependencies
    }
}

// Customize the build directory for the entire project
// Moves build outputs to a parent directory (../../build)
val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

// Customize build directories for each subproject
subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}

// Ensure the :app module is evaluated first for dependency resolution
subprojects {
    project.evaluationDependsOn(":app")
}

// Define a clean task to delete the build directory
// Connects to: All build tasks (cleans build outputs)
tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}