part of 'unhandled_name_bloc.dart';

/// Business Logic Component UnhandledNameEvent
@immutable
sealed class UnhandledNameEvent extends _$UnhandledNameEventBase {
const UnhandledNameEvent();

const factory UnhandledNameEvent.fetch({
required String name,
}) = _FetchUnhandledNameEvent;

}

final class _FetchUnhandledNameEvent extends UnhandledNameEvent {
const _FetchUnhandledNameEvent({
required this.name,
}) : super();

final String name;

@override
String toString() {
final buffer = StringBuffer()
..write('UnhandledNameEvent.fetch(')
..write('name: $name, ')
..write(')');
return buffer.toString();
}
}

typedef UnhandledNameEventMatch<R, E extends UnhandledNameEvent> = R Function(E event);

abstract base class _$UnhandledNameEventBase {
const _$UnhandledNameEventBase();

R map<R>({
required UnhandledNameEventMatch<R, _FetchUnhandledNameEvent> fetch,
}) =>
switch (this) {
final _FetchUnhandledNameEvent e => fetch(e),
_ => throw AssertionError(),
};

R maybeMap<R>({
required R Function() orElse,
UnhandledNameEventMatch<R, _FetchUnhandledNameEvent>? fetch,
}) =>
map<R>(
fetch: fetch ?? (_) => orElse(),
);

R? mapOrNull<R>({
UnhandledNameEventMatch<R, _FetchUnhandledNameEvent>? fetch,
}) =>
map<R?>(
fetch: fetch ?? (_) => null,
);
}
