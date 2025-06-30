plugins {
    id("com.android.application")
    id("kotlin-android")
    id("com.google.gms.google-services")  // Google Services plugin
    id("dev.flutter.flutter-gradle-plugin")  // Flutter plugin (must be last)
}

android {
    namespace = "com.amctag.lta"
    compileSdk = flutter.compileSdkVersion.toInt()
    ndkVersion = "27.0.12077973"

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
         isCoreLibraryDesugaringEnabled = true
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        applicationId = "com.amctag.lta"
        minSdk = flutter.minSdkVersion.toInt()
        targetSdk = flutter.targetSdkVersion.toInt()
        versionCode = flutter.versionCode.toInt()
        versionName = flutter.versionName
        multiDexEnabled = true  // Add if using multidex
    }

    

    buildTypes {
        getByName("release") {
            // TODO: Add your own signing config
            signingConfig = signingConfigs.getByName("debug")
            isMinifyEnabled = true  // Enable code shrinking
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
        getByName("debug") {
            signingConfig = signingConfigs.getByName("debug")
        }
    }

    // Enable view binding if needed
    buildFeatures {
        viewBinding = true
        // compose = true  // Uncomment if using Jetpack Compose
    }
}

flutter {
    source = "../.."
}

dependencies {
    // Add your dependencies here
    implementation(platform("com.google.firebase:firebase-bom:32.7.0"))  // Firebase BoM
    implementation("com.google.firebase:firebase-analytics")  // Analytics
    implementation("com.google.firebase:firebase-messaging")  // FCM
    implementation("androidx.multidex:multidex:2.0.1")  // Multidex if needed
    implementation("androidx.core:core-ktx:1.12.0")  // Kotlin extensions
    coreLibraryDesugaring("com.android.tools:desugar_jdk_libs:2.1.4")
}