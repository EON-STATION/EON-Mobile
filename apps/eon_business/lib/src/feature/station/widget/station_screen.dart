import 'package:eon_business/src/core/model/dependencies.dart';
import 'package:eon_business/src/feature/station/bloc/station_bloc/station_bloc.dart';
import 'package:eon_business/src/feature/station/data/station_data_provider.dart';
import 'package:eon_business/src/feature/station/data/station_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// {@template station_screen}
/// _StationScope widget.
/// {@endtemplate}
class _StationScope extends StatelessWidget {
  /// {@macro station_screen}
  const _StationScope({required this.child});

  final Widget child;
  @override
  Widget build(BuildContext context) => RepositoryProvider<StationRepository>(
    create:
        (context) => StationRepositoryImpl(dataProvider: StationDataProviderImpl(dio: Dependencies.of(context).dio)),
    child: BlocProvider(
      create: (context) => StationBLoC(repository: RepositoryProvider.of<StationRepository>(context)),
      child: child,
    ),
  );
}

/// {@template station_screen}
/// StationScreen widget.
/// {@endtemplate}
class StationScreen extends StatefulWidget {
  /// {@macro station_screen}
  const StationScreen({
    super.key, // ignore: unused_element
  });

  static const routePath = '/station';

  @override
  State<StationScreen> createState() => _StationScreenState();
}

/// State for widget StationScreen.
class _StationScreenState extends State<StationScreen> {
  /* #region Lifecycle */
  @override
  void initState() {
    super.initState();
    // Initial state initialization
  }

  @override
  void dispose() {
    // Permanent removal of a tree stent
    super.dispose();
  }
  /* #endregion */

  @override
  Widget build(BuildContext context) {
    return _StationScope(
      child: BlocBuilder<StationBLoC, StationState>(
        builder: (context, state) {
          return Scaffold(
            body: state.map(
              idle: (_) => Text(''),
              processing: (_) => Text("hello world"),
              successful: (_) => Text("hello world"),
              error: (_) => Text('error'),
            ),
          );
        },
      ),
    );
  }
}
