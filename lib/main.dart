import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/frameworks/arch_theme.dart';
import 'package:todo_bloc/presentation/todos/cubit/todos_cubit.dart';
import 'package:todo_bloc/presentation/todos/todos_screen.dart';

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
        create: (_) => TodosCubit(),
        child: const TodosScreen(),
      ),
    );
  }
}
