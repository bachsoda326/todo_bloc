// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'todos_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TodosStateTearOff {
  const _$TodosStateTearOff();

  _TodosState call(
      {required CommonStatus status,
      List<Todo> todos = const [],
      List<Todo> displayedTodos = const []}) {
    return _TodosState(
      status: status,
      todos: todos,
      displayedTodos: displayedTodos,
    );
  }
}

/// @nodoc
const $TodosState = _$TodosStateTearOff();

/// @nodoc
mixin _$TodosState {
  CommonStatus get status => throw _privateConstructorUsedError;
  List<Todo> get todos => throw _privateConstructorUsedError;
  List<Todo> get displayedTodos => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TodosStateCopyWith<TodosState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TodosStateCopyWith<$Res> {
  factory $TodosStateCopyWith(
          TodosState value, $Res Function(TodosState) then) =
      _$TodosStateCopyWithImpl<$Res>;
  $Res call({CommonStatus status, List<Todo> todos, List<Todo> displayedTodos});
}

/// @nodoc
class _$TodosStateCopyWithImpl<$Res> implements $TodosStateCopyWith<$Res> {
  _$TodosStateCopyWithImpl(this._value, this._then);

  final TodosState _value;
  // ignore: unused_field
  final $Res Function(TodosState) _then;

  @override
  $Res call({
    Object? status = freezed,
    Object? todos = freezed,
    Object? displayedTodos = freezed,
  }) {
    return _then(_value.copyWith(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonStatus,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      displayedTodos: displayedTodos == freezed
          ? _value.displayedTodos
          : displayedTodos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc
abstract class _$TodosStateCopyWith<$Res> implements $TodosStateCopyWith<$Res> {
  factory _$TodosStateCopyWith(
          _TodosState value, $Res Function(_TodosState) then) =
      __$TodosStateCopyWithImpl<$Res>;
  @override
  $Res call({CommonStatus status, List<Todo> todos, List<Todo> displayedTodos});
}

/// @nodoc
class __$TodosStateCopyWithImpl<$Res> extends _$TodosStateCopyWithImpl<$Res>
    implements _$TodosStateCopyWith<$Res> {
  __$TodosStateCopyWithImpl(
      _TodosState _value, $Res Function(_TodosState) _then)
      : super(_value, (v) => _then(v as _TodosState));

  @override
  _TodosState get _value => super._value as _TodosState;

  @override
  $Res call({
    Object? status = freezed,
    Object? todos = freezed,
    Object? displayedTodos = freezed,
  }) {
    return _then(_TodosState(
      status: status == freezed
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonStatus,
      todos: todos == freezed
          ? _value.todos
          : todos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
      displayedTodos: displayedTodos == freezed
          ? _value.displayedTodos
          : displayedTodos // ignore: cast_nullable_to_non_nullable
              as List<Todo>,
    ));
  }
}

/// @nodoc

class _$_TodosState implements _TodosState {
  const _$_TodosState(
      {required this.status,
      this.todos = const [],
      this.displayedTodos = const []});

  @override
  final CommonStatus status;
  @JsonKey(defaultValue: const [])
  @override
  final List<Todo> todos;
  @JsonKey(defaultValue: const [])
  @override
  final List<Todo> displayedTodos;

  @override
  String toString() {
    return 'TodosState(status: $status, todos: $todos, displayedTodos: $displayedTodos)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TodosState &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.todos, todos) ||
                const DeepCollectionEquality().equals(other.todos, todos)) &&
            (identical(other.displayedTodos, displayedTodos) ||
                const DeepCollectionEquality()
                    .equals(other.displayedTodos, displayedTodos)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(todos) ^
      const DeepCollectionEquality().hash(displayedTodos);

  @JsonKey(ignore: true)
  @override
  _$TodosStateCopyWith<_TodosState> get copyWith =>
      __$TodosStateCopyWithImpl<_TodosState>(this, _$identity);
}

abstract class _TodosState implements TodosState {
  const factory _TodosState(
      {required CommonStatus status,
      List<Todo> todos,
      List<Todo> displayedTodos}) = _$_TodosState;

  @override
  CommonStatus get status => throw _privateConstructorUsedError;
  @override
  List<Todo> get todos => throw _privateConstructorUsedError;
  @override
  List<Todo> get displayedTodos => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$TodosStateCopyWith<_TodosState> get copyWith =>
      throw _privateConstructorUsedError;
}
