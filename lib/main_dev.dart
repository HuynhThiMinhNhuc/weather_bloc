import 'package:example_app/app.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/observers/simple_bloc_observer.dart';
import 'package:example_app/src/core/theme/palette.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Flavor.create(
    Environment.dev,
    color: Palette.kE85959,
    name: AppEnv.dev.value,
  );

  Bloc.observer = SimpleBlocObserver();

  runApp(ExampleApp(env: AppEnv.dev));
}
