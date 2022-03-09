import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_bloc.dart';
import 'package:todo_bloc/presentation/todos/widgets/add_or_edit_todo.dart';

class CommonService {
  static showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<TodosBloc>(),
        child: const AlertDialog(
          insetPadding: EdgeInsets.all(24),
          contentPadding: EdgeInsets.all(24),
          content: AddOrEditTodo(),
        ),
      ),
    );
  }

  static showEditTodoDialog(BuildContext context, {required Todo todo}) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<TodosBloc>(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(24),
          contentPadding: const EdgeInsets.all(24),
          content: AddOrEditTodo(isEdit: true, todo: todo),
        ),
      ),
    );
  }

  static showToast(String msg) =>
      Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 3);
}
