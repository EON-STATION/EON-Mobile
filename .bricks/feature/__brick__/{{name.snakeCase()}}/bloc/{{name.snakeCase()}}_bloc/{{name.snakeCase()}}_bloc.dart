import 'dart:async';

// import 'package:bloc_concurrency/bloc_concurrency.dart' as bloc_concurrency;
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:matching_state/matching_state.dart';

import '../../data/{{name.snakeCase()}}_repository.dart';

part '{{name.snakeCase()}}_event.dart';


typedef {{name.pascalCase()}}State = MatchingState<Object>;


/// Business Logic Component {{name.pascalCase()}}BLoC
class {{name.pascalCase()}}BLoC extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> implements EventSink<{{name.pascalCase()}}Event> {
  {{name.pascalCase()}}BLoC({
    required final I{{name.pascalCase()}}Repository repository,
    final {{name.pascalCase()}}State? initialState,
  }) : _repository = repository,
        super(
          initialState ??
              {{name.pascalCase()}}State.idle(
                message: 'Initial idle state',
              ),
        ) {
    // on<{{name.pascalCase()}}Event>(
    //   (event, emit) => event.map<Future<void>>(
    //     fetch: (event) => _fetch(event, emit),
    //   ),
    //   transformer: bloc_concurrency.sequential(),
    //   //transformer: bloc_concurrency.restartable(),
    //   //transformer: bloc_concurrency.droppable(),
    //   //transformer: bloc_concurrency.concurrent(),
    // );
  }
  
  final I{{name.pascalCase()}}Repository _repository;
  
  // /// Fetch event handler
  // Future<void> _fetch(_Fetch{{name.pascalCase()}}Event event, Emitter<{{name.pascalCase()}}State> emit) async {
  //   try {
  //     emit({{name.pascalCase()}}State.processing(data: state.data));
  //     final newData = await _repository.fetch(event.name);
  //     emit({{name.pascalCase()}}State.successful(data: newData));
  //   } on Object catch (err, stackTrace) {
  //     //l.e('An error occurred in the {{name.pascalCase()}}BLoC: $err', stackTrace);
  //     emit({{name.pascalCase()}}State.error(data: state.data));
  //     rethrow;
  //   } finally {
  //     emit({{name.pascalCase()}}State.idle(data: state.data));
  //   }
  // }
}
