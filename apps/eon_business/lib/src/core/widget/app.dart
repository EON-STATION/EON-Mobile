import 'package:eon_business/src/core/router/main_router/main_router.dart';
import 'package:flutter/material.dart';

/// {@template app}
/// App widget.
/// {@endtemplate}
class App extends StatefulWidget {
  /// {@macro app}
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final Key builderKey = GlobalKey(); // Disable recreate widget tree

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    title: 'EON BUSSINES',
    routerConfig: mainRouter,
    builder:
        (context, child) => MediaQuery(
          key: builderKey,
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.noScaling),
          child: GestureDetector(onTap: () => FocusScope.of(context).unfocus(), child: child),
        ),
  );
}
