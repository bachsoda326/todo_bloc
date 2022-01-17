import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:todo_bloc/models/todo.dart';

part 'todos_state.freezed.dart';

@freezed
class TodosState with _$TodosState {
  const factory TodosState({
    required CommonStatus status,
    @Default([]) List<Todo> todos,
    @Default([]) List<Todo> displayedTodos,
  }) = _TodosState;
}
