enum Environment { development, uat, production }

abstract class FlavorConfig {
  static late String baseUrl;
  static late String environmentName;
  static late Environment _environment;

  static Environment get environment => _environment;

  static void setEnvironment(Environment env) {
    _environment = env;

    switch (env) {
      case Environment.development:
        baseUrl = "https://demo.readyecommerce.app";
        environmentName = "Development";
        break;

      case Environment.uat:
        baseUrl = "https://demo.readyecommerce.app";
        environmentName = "UAT";
        break;

      case Environment.production:
        baseUrl = "https://demo.readyecommerce.app";
        environmentName = "Production";
        break;
    }
  }

  /// Helpers (optional but useful)
  static bool get isDev => _environment == Environment.development;
  static bool get isUat => _environment == Environment.uat;
  static bool get isProd => _environment == Environment.production;
}
