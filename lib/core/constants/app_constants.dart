import 'package:flutter/foundation.dart';

class AppConstants {
  static const DATABASE_VERSION = 1;
  static const String version = String.fromEnvironment('VERSION');
  static const Version running =
      version == 'lazy' ? Version.lazy : Version.wait;
  static const String SORT_BY_NAME_TAG = 'Sort by name';
  static const String SORT_BY_DATE_TAG = 'Sort by date created';
  static const String HIDE_COMPLETED_TAG = 'hideCompleted';
  static const String DELETE_ALL_COMPLETED_TAG = 'deleteAllCompleted';
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
