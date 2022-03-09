import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/frameworks/common_service.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_event.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_state.dart';
import 'package:todo_bloc/repositories/todo_repository.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final TodoRepository _repo;

  TodosBloc(TodoRepository repo)
      : _repo = repo,
        super(const TodosLoading([], [])) {
    on<TodosLoaded>(_onLoaded);
    on<TodosAdded>(_onAdded);
    on<TodosUpdated>(_onUpdated);
    on<TodosDeleted>(_onDeleted);
    on<TodosFiltered>(_onFiltered);
  }

  Future<void> _onLoaded(TodosLoaded event, Emitter<TodosState> emit) async {
    try {
      if (event.hasLoading) emit(const TodosLoading([], []));

      final List<Todo> todos = await _repo.getTodos();

      emit(TodosLoadedSuccess(todos, List.from(todos)));
    } on Exception catch (_) {
      emit(const TodosLoadedFail([], []));
      CommonService.showToast('Something went wrong');
    }
  }

  Future<void> _onAdded(TodosAdded event, Emitter<TodosState> emit) async {
    if (state is TodosLoadedSuccess) {
      try {
        await _repo.addTodo(event.todo);
        final List<Todo> todos = await _repo.getTodos();

        emit(TodosLoadedSuccess(todos, List.from(todos)));
        CommonService.showToast('Added successfully');
      } on Exception catch (_) {
        CommonService.showToast('Fail to add todo');
      }
    }
  }

  Future<void> _onUpdated(TodosUpdated event, Emitter<TodosState> emit) async {
    if (state is TodosLoadedSuccess) {
      try {
        await _repo.updateTodo(event.todo);

        final List<Todo> todos = state.todos.map((e) {
          if (e.id == event.todo.id) return event.todo;
          return e;
        }).toList();

        emit(TodosLoadedSuccess(todos, List.from(todos)));
        CommonService.showToast('Updated Success');
      } on Exception catch (_) {
        CommonService.showToast('Fail to update todo');
      }
    }
  }

  Future<void> _onDeleted(TodosDeleted event, Emitter<TodosState> emit) async {
    if (state is TodosLoadedSuccess) {
      try {
        await _repo.deleteTodo(event.todo);

        final List<Todo> todos = List.from(state.todos)..remove(event.todo);

        emit(TodosLoadedSuccess(todos, List.from(todos)));
        CommonService.showToast('Deleted Success');
      } on Exception catch (_) {
        CommonService.showToast('Fail to delete todo');
      }
    }
  }

  void _onFiltered(TodosFiltered event, Emitter<TodosState> emit) {
    if (state is TodosLoadedSuccess) {
      List<Todo> filteredTodos = [];

      switch (event.filterType) {
        case FilterType.all:
          filteredTodos = List.from(state.todos);
          break;
        case FilterType.active:
          filteredTodos =
              state.todos.where((e) => e.isComplete == false).toList();
          break;
        case FilterType.completed:
          filteredTodos =
              state.todos.where((e) => e.isComplete == true).toList();
          break;
      }

      emit(TodosLoadedSuccess(state.todos, filteredTodos));
    }
  }
}
