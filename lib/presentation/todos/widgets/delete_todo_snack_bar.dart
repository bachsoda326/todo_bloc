import 'package:flutter/material.dart';
import 'package:todo_bloc/models/todo.dart';

class DeleteTodoSnackBar extends SnackBar {
  DeleteTodoSnackBar({
    required Todo todo,
    required VoidCallback onUndo,
  }) : super(
          content: Text(
            'Deleted ${todo.title}',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          duration: const Duration(seconds: 2),
          action: SnackBarAction(
            label: 'Undo',
            onPressed: onUndo,
          ),
        );
}
