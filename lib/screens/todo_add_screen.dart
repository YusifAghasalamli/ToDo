import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/widgets/add_screen_widget.dart';

class TodoAddScreen extends StatelessWidget {
  final TextEditingController _titleController = TextEditingController();

  TodoAddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo'),
      ),
      body: BlocConsumer<TodoBloc, TodoState>(
        listener: (context, state) {
          if (state is PostedSuccessful) {
            Navigator.pop(context);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Todo added successfully'),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TodoLoaded) {
            return AddScreenWidget(_addTodo, _titleController);
          } else if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return const Center(
            child: Text("Alinmadi"),
          );
        },
      ),
    );
  }

  void _addTodo(BuildContext context) {
    final String title = _titleController.text;
    context.read<TodoBloc>().add(PostTodos(title: title));
  }
}
