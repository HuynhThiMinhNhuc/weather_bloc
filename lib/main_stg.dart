import 'package:example_app/app.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/config/locator.dart';
import 'package:example_app/src/core/theme/palette.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Flavor.create(
    Environment.alpha,
    color: Palette.kE85959,
    name: AppEnv.stg.value,
  );

  await dotenv.load(fileName: ".env");
  await setUpLocator(AppEnv.stg);

  runApp(ExampleApp(env: AppEnv.stg));
}
