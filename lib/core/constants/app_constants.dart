class AppConstants {
  static const DATABASE_VERSION = 1;
  static const String version = String.fromEnvironment('VERSION');
  static const Version running =
      version == 'lazy' ? Version.lazy : Version.wait;
}

enum Version {
  lazy,
  wait,
}