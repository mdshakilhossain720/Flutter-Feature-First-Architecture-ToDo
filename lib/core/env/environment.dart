import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum AppEnvironment { development, uat, production }

class Environment {
  static late final AppEnvironment current;

  static Future<void> init({AppEnvironment? forceEnv}) async {
    // Allow manual override (useful for UAT builds)
    if (forceEnv != null) {
      current = forceEnv;
    } else if (kReleaseMode) {
      current = AppEnvironment.production;
    } else {
      current = AppEnvironment.development;
    }

    switch (current) {
      case AppEnvironment.development:
        await dotenv.load(fileName: "assets/env/.env.development");
        break;

      case AppEnvironment.uat:
        await dotenv.load(fileName: "assets/env/.env.uat");
        break;

      case AppEnvironment.production:
        await dotenv.load(fileName: "assets/env/.env.production");
        break;
    }
  }

  static String get apiKey => dotenv.env['API_KEY'] ?? 'API_KEY not found';

  static String get apiBaseUrl =>
      dotenv.env['API_BASE_URL'] ?? 'API_BASE_URL not found';
}
