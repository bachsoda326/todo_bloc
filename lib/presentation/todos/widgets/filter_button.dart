import 'package:flutter/material.dart';
import 'package:todo_bloc/frameworks/enum.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/presentation/todos/cubit/todos_cubit.dart';

class FilterButton extends StatefulWidget {
  const FilterButton({Key? key}) : super(key: key);

  @override
  _FilterButtonState createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  FilterType _currentType = FilterType.all;

  _selectFilter(FilterType val) {
    setState(() {
      _currentType = val;
    });

    context.read<TodosCubit>().filterTodos(val);
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      tooltip: 'Show filter',
      icon: const Icon(Icons.filter_list_alt),
      onSelected: (FilterType val) {
        if (_currentType != val) {
          _selectFilter(val);
        }
      },
      itemBuilder: (_) => [
        PopupMenuItem(
          value: FilterType.all,
          child: Text(
            'Show All',
            style: TextStyle(
              color: _currentType == FilterType.all ? Colors.blueAccent : null,
            ),
          ),
        ),
        PopupMenuItem(
          value: FilterType.active,
          child: Text(
            'Show Active',
            style: TextStyle(
              color:
                  _currentType == FilterType.active ? Colors.blueAccent : null,
            ),
          ),
        ),
        PopupMenuItem(
          value: FilterType.completed,
          child: Text(
            'Show Completed',
            style: TextStyle(
              color: _currentType == FilterType.completed
                  ? Colors.blueAccent
                  : null,
            ),
          ),
        ),
      ],
    );
  }
}
