part of 'station_control_bloc.dart';

/// Business Logic Component StationControlEvent
@immutable
sealed class StationControlEvent extends _$StationControlEventBase {
const StationControlEvent();

const factory StationControlEvent.fetch({
required String name,
}) = _FetchStationControlEvent;

}

final class _FetchStationControlEvent extends StationControlEvent {
const _FetchStationControlEvent({
required this.name,
}) : super();

final String name;

@override
String toString() {
final buffer = StringBuffer()
..write('StationControlEvent.fetch(')
..write('name: $name, ')
..write(')');
return buffer.toString();
}
}

typedef StationControlEventMatch<R, E extends StationControlEvent> = R Function(E event);

abstract base class _$StationControlEventBase {
const _$StationControlEventBase();

R map<R>({
required StationControlEventMatch<R, _FetchStationControlEvent> fetch,
}) =>
switch (this) {
final _FetchStationControlEvent e => fetch(e),
_ => throw AssertionError(),
};

R maybeMap<R>({
required R Function() orElse,
StationControlEventMatch<R, _FetchStationControlEvent>? fetch,
}) =>
map<R>(
fetch: fetch ?? (_) => orElse(),
);

R? mapOrNull<R>({
StationControlEventMatch<R, _FetchStationControlEvent>? fetch,
}) =>
map<R?>(
fetch: fetch ?? (_) => null,
);
}
