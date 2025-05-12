import 'dart:async';

import 'package:eon_business/src/core/model/dependencies.dart';
import 'package:eon_business/src/core/util/debug_bloc_observer.dart';
import 'package:eon_business/src/feature/initialization/data/initialize_dependencies.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;

Future<void> $initializeAndRun({
  required void Function(Object error, StackTrace stackTrace) onError,
  required FutureOr<void> Function(Dependencies dependencies) onSuccess,
}) async {
  final stopwatch = Stopwatch()..start();
  late final WidgetsBinding binding;

  try {
    binding = WidgetsFlutterBinding.ensureInitialized()..deferFirstFrame();

    Bloc.observer = DebugBlocObserver();

    Bloc.transformer = bloc_concurrency.concurrent();

    final dependencies = await $initializeDependencies();

    onSuccess.call(dependencies);
    /* ... */
  } on Object catch (err, stackTrace) {
    onError(err, stackTrace);
  } finally {
    stopwatch.stop();
    binding.addPostFrameCallback((_) {
      // Closes splash screen, and show the app layout.
      binding.allowFirstFrame();
      //final context = binding.renderViewElement;
    });
    //log('${(stopwatch..stop()).elapsedMicroseconds} μs', name: 'select', level: 100);
  }
}
