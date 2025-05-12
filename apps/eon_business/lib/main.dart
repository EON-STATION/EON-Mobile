import 'dart:async';

import 'package:eon_business/src/core/widget/app.dart';
import 'package:eon_business/src/feature/initialization/data/initialization.dart';
import 'package:eon_business/src/feature/initialization/widget/inherited_dependencies.dart';
import 'package:flutter/material.dart';

@pragma('vm:entry-point')
void main([List<String>? args]) => runZonedGuarded<Future<void>>(
  () => $initializeAndRun(
    onError: (error, stackTrace) {},
    onSuccess: (dependencies) {
      runApp(InheritedDependencies(dependencies: dependencies, child: App()));
    },
  ),
  (error, stackTrace) {
    //Error.safeToString(error);
    //stackTrace.toString();
    print('Error: error, stackTrace: stackTrace');
  },
);
