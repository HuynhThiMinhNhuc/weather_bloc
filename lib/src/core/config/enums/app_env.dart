import 'package:example_app/src/core/config/app_constant.dart';

enum AppEnv { dev, pro, stg }

extension AppEnvExt on AppEnv {
  bool get isDev => this == AppEnv.dev;
  bool get isStg => this == AppEnv.stg;
  bool get isProd => this == AppEnv.pro;

  String get appName {
    switch (this) {
      case AppEnv.dev:
        return AppConstants.devAppName;
      case AppEnv.stg:
        return AppConstants.stgAppname;
      case AppEnv.pro:
        return AppConstants.proAppName;
    }
  }

  String get value {
    switch (this) {
      case AppEnv.dev:
        return AppConstants.devFlavorName;
      case AppEnv.stg:
        return AppConstants.stgFlavorName;
      case AppEnv.pro:
        return AppConstants.proFlavorName;
    }
  }

  String get baseUrl {
    switch (this) {
      case AppEnv.dev:
        return AppConstants.devBaseUrl;
      case AppEnv.stg:
        return AppConstants.stgBaseUrl;
      case AppEnv.pro:
        return AppConstants.proBaseUrl;
    }
  }
}
