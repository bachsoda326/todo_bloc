import 'package:equatable/equatable.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:todo_bloc/models/todo.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object?> get props => [];
}

class TodosLoaded extends TodosEvent {
  final bool hasLoading;

  const TodosLoaded({this.hasLoading = false});
}

class TodosAdded extends TodosEvent {
  final Todo todo;

  const TodosAdded(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosUpdated extends TodosEvent {
  final Todo todo;

  const TodosUpdated(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosDeleted extends TodosEvent {
  final Todo todo;

  const TodosDeleted(this.todo);

  @override
  List<Object?> get props => [todo];
}

class TodosFiltered extends TodosEvent {
  final FilterType filterType;

  const TodosFiltered(this.filterType);

  @override
  List<Object?> get props => [filterType];
}
