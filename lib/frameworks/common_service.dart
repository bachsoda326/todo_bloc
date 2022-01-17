import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:todo_bloc/presentation/todos/widgets/add_or_edit_todo.dart';
import 'package:todo_bloc/presentation/todos/cubit/todos_cubit.dart';

class CommonService {
  static showAddTodoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => BlocProvider.value(
        value: context.read<TodosCubit>(),
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
        value: context.read<TodosCubit>(),
        child: AlertDialog(
          insetPadding: const EdgeInsets.all(24),
          contentPadding: const EdgeInsets.all(24),
          content: AddOrEditTodo(isEdit: true, todo: todo),
        ),
      ),
    );
  }
}
