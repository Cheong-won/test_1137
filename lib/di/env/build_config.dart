abstract class CustomEnv {
  static const String dev = 'dev';
  static const String prod = 'prod';
}

abstract class BuildConfig {
  String get flavor;
  // API and socket
  String get host;

  String get hostSocketIO;

  String get apiUrl => '$host';
}
