import 'package:example_app/src/core/config/app_routes.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:example_app/src/core/theme/themes.dart';
import 'package:example_app/src/features/weather/cubit/weather_cubit.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExampleApp extends StatelessWidget {
  final AppEnv env;
  const ExampleApp({super.key, required this.env});

  @override
  Widget build(BuildContext context) {
    return FlavorBanner(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<WeatherCubit>(create: (context) => WeatherCubit()),
        ],
        child: MaterialApp.router(
          title: env.appName,
          theme: lightThemeData,
          routerConfig: routers,
        ),
      ),
    );
  }
}
