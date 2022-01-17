import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/repositories/todo_repository.dart';
import 'package:todo_bloc/presentation/todos/state/todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(const TodosState(status: CommonStatus.loading));

  final TodoRepository _repository = TodoRepository();

  Future<void> getTodos({bool hasLoading = false}) async {
    if (hasLoading) emit(state.copyWith(status: CommonStatus.loading));

    try {
      final List<Todo> todos = await _repository.getTodos();

      emit(state.copyWith(
          status: CommonStatus.success, todos: todos, displayedTodos: todos));
    } on Exception catch (e) {
      e.toString();
      emit(state.copyWith(status: CommonStatus.failure));
    }
  }

  void filterTodos(FilterType type) {
    List<Todo> filteredTodos = [];

    switch (type) {
      case FilterType.all:
        filteredTodos = List.from(state.todos);
        break;
      case FilterType.active:
        filteredTodos =
            state.todos.where((e) => e.isComplete == false).toList();
        break;
      case FilterType.completed:
        filteredTodos = state.todos.where((e) => e.isComplete == true).toList();
        break;
    }

    emit(state.copyWith(
        status: CommonStatus.success, displayedTodos: filteredTodos));
  }

  Future<bool> addTodo(Todo todo) async {
    try {
      await _repository.addTodo(todo);

      final List<Todo> todos = await _repository.getTodos();

      Fluttertoast.showToast(msg: 'Add successfully', timeInSecForIosWeb: 3);
      emit(state.copyWith(todos: todos, displayedTodos: todos));

      return true;
    } on Exception catch (_) {
      Fluttertoast.showToast(
          msg: 'Something went wrong', timeInSecForIosWeb: 3);
      emit(state.copyWith());

      return false;
    }
  }

  Future<bool> updateTodo(Todo todo) async {
    try {
      await _repository.updateTodo(todo);

      final List<Todo> todos = state.todos.map((e) {
        if (e.id == todo.id) return todo;
        return e;
      }).toList();

      Fluttertoast.showToast(msg: 'Success', timeInSecForIosWeb: 3);
      emit(state.copyWith(todos: todos, displayedTodos: todos));

      return true;
    } on Exception catch (_) {
      Fluttertoast.showToast(
          msg: 'Something went wrong', timeInSecForIosWeb: 3);
      emit(state.copyWith());

      return false;
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    try {
      await _repository.deleteTodo(todo);

      final List<Todo> todos = List.from(state.todos)
        ..removeWhere((e) => e.id == todo.id);

      Fluttertoast.showToast(msg: 'Success', timeInSecForIosWeb: 3);
      emit(state.copyWith(todos: todos, displayedTodos: todos));
    } on Exception catch (_) {
      Fluttertoast.showToast(
          msg: 'Something went wrong', timeInSecForIosWeb: 3);
      emit(state.copyWith());
    }
  }
}
