import 'package:example_app/app.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/theme/palette.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';

void main() {
  Flavor.create(
    Environment.dev,
    color: Palette.kE85959,
    name: AppEnv.dev.value,
  );

  runApp(ExampleApp(env: AppEnv.dev));
}
