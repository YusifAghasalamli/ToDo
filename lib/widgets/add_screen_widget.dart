import 'package:flutter/material.dart';

class AddScreenWidget extends StatelessWidget {
  final Function addTodo;
  final TextEditingController titleController;
  const AddScreenWidget(this.addTodo, this.titleController, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: titleController,
            decoration: const InputDecoration(
              labelText: 'Title',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              addTodo(context);
            },
            child: const Text('Add Todo'),
          ),
        ],
      ),
    );
  }
}
