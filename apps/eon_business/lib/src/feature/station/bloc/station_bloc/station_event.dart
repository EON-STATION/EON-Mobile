part of 'station_bloc.dart';

/// Business Logic Component StationEvent
@immutable
sealed class StationEvent extends _$StationEventBase {
const StationEvent();

const factory StationEvent.fetch({
required String name,
}) = _FetchStationEvent;

}

final class _FetchStationEvent extends StationEvent {
const _FetchStationEvent({
required this.name,
}) : super();

final String name;

@override
String toString() {
final buffer = StringBuffer()
..write('StationEvent.fetch(')
..write('name: $name, ')
..write(')');
return buffer.toString();
}
}

typedef StationEventMatch<R, E extends StationEvent> = R Function(E event);

abstract base class _$StationEventBase {
const _$StationEventBase();

R map<R>({
required StationEventMatch<R, _FetchStationEvent> fetch,
}) =>
switch (this) {
final _FetchStationEvent e => fetch(e),
_ => throw AssertionError(),
};

R maybeMap<R>({
required R Function() orElse,
StationEventMatch<R, _FetchStationEvent>? fetch,
}) =>
map<R>(
fetch: fetch ?? (_) => orElse(),
);

R? mapOrNull<R>({
StationEventMatch<R, _FetchStationEvent>? fetch,
}) =>
map<R?>(
fetch: fetch ?? (_) => null,
);
}
