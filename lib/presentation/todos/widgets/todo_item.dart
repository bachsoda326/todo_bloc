import 'package:flutter/material.dart';
import 'package:todo_bloc/frameworks/common_service.dart';
import 'package:todo_bloc/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_bloc.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_event.dart';
import 'package:todo_bloc/presentation/todos/widgets/delete_todo_snack_bar.dart';

class TodoItem extends StatelessWidget {
  final Todo todo;
  final BuildContext parentContext;

  const TodoItem(this.todo, {Key? key, required this.parentContext})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool _value = todo.isComplete;

    return Dismissible(
      key: ValueKey(todo.id),
      onDismissed: (direction) {
        context.read<TodosBloc>().add(TodosDeleted(todo));

        final messenger = ScaffoldMessenger.of(parentContext);
        messenger
          ..hideCurrentSnackBar()
          ..showSnackBar(
            DeleteTodoSnackBar(
              todo: todo,
              onUndo: () {
                messenger.hideCurrentSnackBar();
                parentContext.read<TodosBloc>().add(TodosAdded(todo));
              },
            ),
          );
      },
      child: InkWell(
        onTap: () => CommonService.showEditTodoDialog(context, todo: todo),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Checkbox(
                value: _value,
                onChanged: (val) {
                  context
                      .read<TodosBloc>()
                      .add(TodosUpdated(todo.copyWith(isComplete: val!)));
                },
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(todo.title, style: const TextStyle(fontSize: 20)),
                  const SizedBox(height: 4),
                  Text(todo.note),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
