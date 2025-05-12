import 'package:eon_business/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';

/// {@template dependencies}
/// Dependencies.
/// {@endtemplate}
final class Dependencies {
  /// {@macro dependencies}

  late final SharedPreferences sharedPreferences;

  late final Dio dio;

  static Dependencies of(BuildContext context) {
    return InheritedDependencies.of(context);
  }
}
