import 'package:example_app/src/core/config/app_constant.dart';

enum AppEnv { dev, pro, stg }

extension AppEnvExt on AppEnv {
  bool get isDev => this == AppEnv.dev;
  bool get isStg => this == AppEnv.stg;
  bool get isProd => this == AppEnv.pro;

  String get appName {
    switch (this) {
      case AppEnv.dev:
        return AppConstant.devAppName;
      case AppEnv.stg:
        return AppConstant.stgAppname;
      case AppEnv.pro:
        return AppConstant.proAppName;
    }
  }

  String get value {
    switch (this) {
      case AppEnv.dev:
        return AppConstant.devFlavorName;
      case AppEnv.stg:
        return AppConstant.stgFlavorName;
      case AppEnv.pro:
        return AppConstant.proFlavorName;
    }
  }
}
