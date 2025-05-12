import 'dart:async';

// import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:eon_business/src/core/model/station.dart';
import 'package:eon_business/src/core/util/handle.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_state/matching_state.dart';

import '../../data/station_repository.dart';

part 'station_event.dart';

typedef StationState = MatchingState<List<Station>>;

/// Business Logic Component StationBLoC
class StationBLoC extends Bloc<StationEvent, StationState> implements EventSink<StationEvent> {
  StationBLoC({required final StationRepository repository, final StationState? initialState})
    : _repository = repository,
      super(initialState ?? StationState.idle(message: 'Initial idle state')) {
    on<StationEvent>((event, emit) => event.map<Future<void>>(fetch: (event) => _fetchStation(event, emit)));
  }

  final StationRepository _repository;

  // /// Fetch event handler
  Future<void> _fetchStation(_FetchStationEvent event, Emitter<StationState> emit) async => futureHandle(
    _repository.fetchStations(),
    onProcessing: () => emit(StationState.processing(data: state.data)),

    onSuccess: (onSuccess) => emit(StationState.successful(data: onSuccess)),
    onError: (error, stackTrace) {
      onError(error, stackTrace);
      emit(StationState.error(message: error.toString()));
    },
  );
}
