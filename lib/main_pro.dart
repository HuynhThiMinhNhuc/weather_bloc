import 'package:example_app/app.dart';
import 'package:example_app/src/core/config/enums/app_env.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ExampleApp(env: AppEnv.pro));
}
