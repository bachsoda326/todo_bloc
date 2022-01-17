import 'dart:io';

import 'package:dio/dio.dart';
import 'package:todo_bloc/frameworks/rest_client.dart';
import 'package:todo_bloc/frameworks/url_constants.dart' as url_constants;
import 'package:todo_bloc/models/todo.dart';

class TodoClient {
  Future<List<Todo>> getTodos() async {
    try {
      final response = await RestClient.dio.get(url_constants.getTodosUrl);
      if (response.data != null && RestClient.isSuccess(response.statusCode)) {
        return (response.data as List).map((e) => Todo.fromJson(e)).toList();
      }

      throw Exception();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> addTodo(Todo todo) async {
    final Map<String, dynamic> body = todo.toJson();
    final String path = url_constants.getTodosUrl;

    try {
      final response = await RestClient.dio.post(path, data: body);
      if (response.data != null && response.statusCode == HttpStatus.created) {
        return;
      }

      throw Exception();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> updateTodo(Todo todo) async {
    final Map<String, dynamic> body = todo.toJson();
    final String path = url_constants.getTodosUrl + '/${todo.id}';

    try {
      final response = await RestClient.dio.put(path, data: body);
      if (response.data != null && RestClient.isSuccess(response.statusCode)) {
        return;
      }

      throw Exception();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }

  Future<void> deleteTodo(Todo todo) async {
    final String path = url_constants.getTodosUrl + '/${todo.id}';

    try {
      final response = await RestClient.dio.delete(path);
      if (response.data != null && RestClient.isSuccess(response.statusCode)) {
        return;
      }

      throw Exception();
    } on DioError catch (e) {
      print(e);
      throw Exception();
    }
  }
}
