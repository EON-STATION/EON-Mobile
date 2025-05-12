import 'dart:async';

// import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_state/matching_state.dart';

import '../../data/unhandled_name_repository.dart';

part 'unhandled_name_event.dart';


typedef UnhandledNameState = MatchingState<Object>;


/// Business Logic Component UnhandledNameBLoC
class UnhandledNameBLoC extends Bloc<UnhandledNameEvent, UnhandledNameState> implements EventSink<UnhandledNameEvent> {
  UnhandledNameBLoC({
    required final IUnhandledNameRepository repository,
    final UnhandledNameState? initialState,
  }) : _repository = repository,
        super(
          initialState ??
              UnhandledNameState.idle(
                message: 'Initial idle state',
              ),
        ) {
    // on<UnhandledNameEvent>(
    //   (event, emit) => event.map<Future<void>>(
    //     fetch: (event) => _fetch(event, emit),
    //   ),
    //   transformer: bloc_concurrency.sequential(),
    //   //transformer: bloc_concurrency.restartable(),
    //   //transformer: bloc_concurrency.droppable(),
    //   //transformer: bloc_concurrency.concurrent(),
    // );
  }
  
  // ignore: unused_field
  final IUnhandledNameRepository _repository;
  
  // /// Fetch event handler
  // Future<void> _fetch(_FetchUnhandledNameEvent event, Emitter<UnhandledNameState> emit) async {
  //   try {
  //     emit(UnhandledNameState.processing(data: state.data));
  //     final newData = await _repository.fetch(event.name);
  //     emit(UnhandledNameState.successful(data: newData));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the UnhandledNameBLoC: $err', stackTrace);
  //     emit(UnhandledNameState.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit(UnhandledNameState.idle(data: state.data));
  //   }
  // }
}
