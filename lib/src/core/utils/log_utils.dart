import 'dart:io';

import 'package:example_app/src/core/config/app_constant.dart';
import 'package:example_app/src/core/config/file_output.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';

abstract class LogUtil {
  static LogPrinter get logPrinter =>
      kReleaseMode
          ? SimplePrinter(colors: false, printTime: true)
          : PrettyPrinter(dateTimeFormat: DateTimeFormat.dateAndTime);

  static LogOutput logOutput(File outputFile) => MultiOutput(<LogOutput>[
    ConsoleOutput(),
    CustomFileOutput(file: outputFile, overrideExisting: true),
  ]);

  static Future<File> initLogFile() async {
    final Directory tempDir = await getTemporaryDirectory();
    final File logFile = File('${tempDir.path}/${AppConstants.logFilename}');
    if (logFile.existsSync()) {
      await logFile.rename(
        '${tempDir.path}/${AppConstants.previousLogFileName}',
      );
    }
    return logFile;
  }

  static Future<File> exportLog() async {
    final Directory tempDir = await getTemporaryDirectory();
    final String logPath = '${tempDir.path}/${AppConstants.logFilename}';
    final String previousLogPath =
        '${tempDir.path}/${AppConstants.previousLogFileName}';
    final File currentSessionLog = File(logPath);
    final File previousSessionLog = File(previousLogPath);

    final Uint8List fileContent = await currentSessionLog.readAsBytes();
    await previousSessionLog.writeAsString(
      '=============== Current session logs ===============\n',
      mode: FileMode.append,
    );
    return previousSessionLog.writeAsBytes(fileContent, mode: FileMode.append);
  }

  static Future<List<String>> exportLogAsStrings() async {
    final Directory tempDir = await getTemporaryDirectory();
    final String logPath = '${tempDir.path}/${AppConstants.logFilename}';
    final String previousLogPath =
        '${tempDir.path}/${AppConstants.previousLogFileName}';
    final File currentSessionLog = File(logPath);
    final File previousSessionLog = File(previousLogPath);

    final List<String> currentLog = await currentSessionLog.readAsLines();
    final List<String> prevLog = await previousSessionLog.readAsLines();
    return <String>[
      ...prevLog,
      '\n=============== Current session logs ===============\n',
      ...currentLog,
    ];
  }
}
