abstract class AppConstants {
  // app_name
  static const String devAppName = '[DEV] Example App';
  static const String stgAppname = '[STG] Example App';
  static const String proAppName = '[PRO] Example App';

  // flavor_name
  static const String devFlavorName = 'dev';
  static const String stgFlavorName = 'stg';
  static const String proFlavorName = 'pro';

  // base_url
  static const String devBaseUrl = 'https://api.openweathermap.org/data/3.0/';
  static const String stgBaseUrl = 'https://api.openweathermap.org/data/3.0/';
  static const String proBaseUrl = 'https://api.openweathermap.org/data/3.0/';

  // others
  static const String logFilename = 'example_log.txt';
  static const String previousLogFileName = 'old_example_log.txt';
}

abstract class AppDurations {
  static const Duration tenSeconds = Duration(seconds: 10);
}
