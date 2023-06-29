import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo2/blocs/todo_bloc/todo_bloc.dart';
import 'package:todo2/screens/todo_add_screen.dart';
import 'package:todo2/widgets/todo_list_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<TodoBloc, TodoState>(
        builder: (context, state) {
          if (state is TodoInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodoLoaded) {
            return ListView.builder(
              itemCount: state.todos.length,
              itemBuilder: (context, index) {
                final todo = state.todos[index];
                return TodoListItem(todo: todo);
              },
            );
          } else if (state is TodoError) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TodoAddScreen()),
          ).then((value) => context.read<TodoBloc>().add(LoadTodos()));

          // Navigator.of(context)
          //     .pushNamed(AppRoutes.add)
          //     .then((value) => context.read<TodoBloc>().add(LoadTodos()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
