import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/frameworks/arch_theme.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_bloc.dart';
import 'package:todo_bloc/presentation/todos/todos_screen.dart';
import 'package:todo_bloc/repositories/todo_repository.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ArchSampleTheme.theme,
      home: BlocProvider(
        create: (_) => TodosBloc(TodoRepository()),
        child: const TodosScreen(),
      ),
    );
  }
}
