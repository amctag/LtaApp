// lib/api_constants.dart

class ApiConstants {
  static const String baseUrl = "https://amctag-trip.38f0fz.easypanel.host/api";
  static const String version = "/v1";

  static String get loginUrl => "$baseUrl$version/login";
  static String get registerUrl => "$baseUrl$version/register";
  static String get changePasswordUrl => "$baseUrl$version/change_password";
}
// lib/
// ├── constants/             # App constants, strings, colors
// ├── models/                # Data models
// ├── providers/             # State management
// ├── services/              # API services, database
// ├── utils/                 # Helpers, extensions
// ├── widgets/               # Reusable widgets
// ├── screens/               # All app screens/pages
// ├── routes.dart            # Navigation setup
// └── main.dart              # App entry point (explain each file)