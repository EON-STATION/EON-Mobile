import 'dart:async';

// import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_state/matching_state.dart';

import '../../data/station_control_repository.dart';

part 'station_control_event.dart';


typedef StationControlState = MatchingState<Object>;


/// Business Logic Component StationControlBLoC
class StationControlBLoC extends Bloc<StationControlEvent, StationControlState> implements EventSink<StationControlEvent> {
  StationControlBLoC({
    required final IStationControlRepository repository,
    final StationControlState? initialState,
  }) : _repository = repository,
        super(
          initialState ??
              StationControlState.idle(
                message: 'Initial idle state',
              ),
        ) {
    // on<StationControlEvent>(
    //   (event, emit) => event.map<Future<void>>(
    //     fetch: (event) => _fetch(event, emit),
    //   ),
    //   transformer: bloc_concurrency.sequential(),
    //   //transformer: bloc_concurrency.restartable(),
    //   //transformer: bloc_concurrency.droppable(),
    //   //transformer: bloc_concurrency.concurrent(),
    // );
  }
  
  final IStationControlRepository _repository;
  
  // /// Fetch event handler
  // Future<void> _fetch(_FetchStationControlEvent event, Emitter<StationControlState> emit) async {
  //   try {
  //     emit(StationControlState.processing(data: state.data));
  //     final newData = await _repository.fetch(event.name);
  //     emit(StationControlState.successful(data: newData));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the StationControlBLoC: $err', stackTrace);
  //     emit(StationControlState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(StationControlState.idle(data: state.data));
  //   }
  // }
}
