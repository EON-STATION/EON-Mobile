part of '{{name.snakeCase()}}_bloc.dart';

/// Business Logic Component {{name.pascalCase()}}Event
@immutable
sealed class {{name.pascalCase()}}Event extends _${{name.pascalCase()}}EventBase {
const {{name.pascalCase()}}Event();

const factory {{name.pascalCase()}}Event.fetch({
required String name,
}) = _Fetch{{name.pascalCase()}}Event;

}

final class _Fetch{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
const _Fetch{{name.pascalCase()}}Event({
required this.name,
}) : super();

final String name;

@override
String toString() {
final buffer = StringBuffer()
..write('{{name.pascalCase()}}Event.fetch(')
..write('name: $name, ')
..write(')');
return buffer.toString();
}
}

typedef {{name.pascalCase()}}EventMatch<R, E extends {{name.pascalCase()}}Event> = R Function(E event);

abstract base class _${{name.pascalCase()}}EventBase {
const _${{name.pascalCase()}}EventBase();

R map<R>({
required {{name.pascalCase()}}EventMatch<R, _Fetch{{name.pascalCase()}}Event> fetch,
}) =>
switch (this) {
final _Fetch{{name.pascalCase()}}Event e => fetch(e),
_ => throw AssertionError(),
};

R maybeMap<R>({
required R Function() orElse,
{{name.pascalCase()}}EventMatch<R, _Fetch{{name.pascalCase()}}Event>? fetch,
}) =>
map<R>(
fetch: fetch ?? (_) => orElse(),
);

R? mapOrNull<R>({
{{name.pascalCase()}}EventMatch<R, _Fetch{{name.pascalCase()}}Event>? fetch,
}) =>
map<R?>(
fetch: fetch ?? (_) => null,
);
}
