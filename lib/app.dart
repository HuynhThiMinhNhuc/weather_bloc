import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/theme/themes.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

class ExampleApp extends StatelessWidget {
  final AppEnv env;
  const ExampleApp({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MaterialApp(title: env.appName, theme: lightThemeData),
    );
  }
}
