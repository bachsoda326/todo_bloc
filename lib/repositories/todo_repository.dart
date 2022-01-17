import 'package:todo_bloc/data_providers/todo_client.dart';
import 'package:todo_bloc/models/todo.dart';

class TodoRepository {
  final TodoClient _client = TodoClient();

  Future<List<Todo>> getTodos() => _client.getTodos();

  Future<void> updateTodo(Todo todo) => _client.updateTodo(todo);

  Future<void> addTodo(Todo todo) => _client.addTodo(todo);

  Future<void> deleteTodo(Todo todo) => _client.deleteTodo(todo);
}
