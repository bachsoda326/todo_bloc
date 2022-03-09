import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo.dart';

abstract class TodosState extends Equatable {
  final List<Todo> todos;
  final List<Todo> displayedTodos;

  const TodosState(this.todos, this.displayedTodos);

  @override
  List<Object> get props => [todos, displayedTodos];
}

class TodosLoading extends TodosState {
  const TodosLoading(List<Todo> todos, List<Todo> displayedTodos)
      : super(todos, displayedTodos);
}

class TodosLoadedSuccess extends TodosState {
  const TodosLoadedSuccess(List<Todo> todos, List<Todo> displayedTodos)
      : super(todos, displayedTodos);
}

class TodosLoadedFail extends TodosState {
  const TodosLoadedFail(List<Todo> todos, List<Todo> displayedTodos)
      : super(todos, displayedTodos);
}
