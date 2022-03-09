import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/frameworks/common_service.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_bloc.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_event.dart';
import 'package:todo_bloc/presentation/todos/bloc/todos_state.dart';
import 'package:todo_bloc/presentation/todos/widgets/filter_button.dart';
import 'package:todo_bloc/presentation/todos/widgets/todo_item.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({Key? key}) : super(key: key);

  @override
  _TodosScreenState createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  @override
  void initState() {
    super.initState();

    _getTodos();
  }

  Future<void> _getTodos({bool hasLoading = false}) async =>
      context.read<TodosBloc>().add(TodosLoaded(hasLoading: hasLoading));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos using Bloc'),
        actions: const [
          FilterButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _getTodos(hasLoading: true),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<TodosBloc, TodosState>(
            builder: (context, state) {
              if (state is TodosLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TodosLoadedFail) {
                return LayoutBuilder(
                  builder: (context, constraints) => ListView(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: const Text('No data'),
                      )
                    ],
                  ),
                );
              } else {
                return ListView(
                  children: state.displayedTodos
                      .map((todo) => TodoItem(todo, parentContext: context))
                      .toList(),
                );
              }
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          CommonService.showAddTodoDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
