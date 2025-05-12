import 'package:eon_business/src/feature/station/widget/station_screen.dart';
import 'package:go_router/go_router.dart';

final mainRouter = GoRouter(
  initialLocation: StationScreen.routePath,
  routes: [
    GoRoute(
      path: StationScreen.routePath,
      builder: (context, state) {
        return StationScreen();
      },
    ),
  ],
  observers: [],
  debugLogDiagnostics: false,
);
