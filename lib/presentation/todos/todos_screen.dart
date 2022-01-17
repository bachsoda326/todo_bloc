import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/frameworks/common_service.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:todo_bloc/presentation/todos/cubit/todos_cubit.dart';
import 'package:todo_bloc/presentation/todos/state/todos_state.dart';
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

  _getTodos({bool hasLoading = false}) =>
      context.read<TodosCubit>().getTodos(hasLoading: hasLoading);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos using Cubit'),
        actions: const [
          FilterButton(),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () => _getTodos(hasLoading: true),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<TodosCubit, TodosState>(
            builder: (context, state) {
              switch (state.status) {
                case CommonStatus.init:
                case CommonStatus.loading:
                  return const Center(child: CircularProgressIndicator());
                case CommonStatus.failure:
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
                case CommonStatus.success:
                  return ListView(
                    children: state.displayedTodos
                        .map((todo) => TodoItem(todo))
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
