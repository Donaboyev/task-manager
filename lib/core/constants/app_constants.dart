import 'package:flutter/foundation.dart';

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

enum SortOrder {
  BY_NAME,
  BY_DATE,
}

extension SortOrderExtension on SortOrder {
  String get value => describeEnum(this);
}
