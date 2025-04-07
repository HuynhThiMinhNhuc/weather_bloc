import 'dart:io';

import 'package:example_app/src/core/utils/log_utils.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

/// Global [GetIt.instance].
final GetIt locator = GetIt.instance;

/// Set up [GetIt] locator.
Future<void> setUpLocator() async {
  final File logOutputFile = await LogUtil.initLogFile();

  locator.registerSingleton<Logger>(
    Logger(
      printer: LogUtil.logPrinter,
      output: LogUtil.logOutput(logOutputFile),
    ),
  );
}
