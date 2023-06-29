import 'package:flutter/material.dart';
import 'package:todo2/data/models/todo.dart';

class TodoListItem extends StatefulWidget {
  final Todo todo;

  const TodoListItem({super.key, required this.todo});

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  bool _isDone = false;

  @override
  void initState() {
    _isDone = widget.todo.completed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key("${widget.todo.id}"),
      direction: DismissDirection.horizontal,
      onDismissed: (_) {
        // Handle dismiss action
      },
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        child: const Icon(
          Icons.delete,
          color: Colors.white,
        ),
      ),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            width: 1,
            color: Colors.grey.shade300,
          ),
        ),
        child: ListTile(
          title: Text(
            widget.todo.title,
            style: TextStyle(
              decoration:
                  _isDone ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          trailing: InkWell(
            onTap: () {
              setState(() {
                _isDone = !_isDone;
              });
            },
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _isDone ? Colors.blue : Colors.transparent,
                border: Border.all(
                  width: 2,
                  color: _isDone ? Colors.blue : Colors.grey.shade300,
                ),
              ),
              child: _isDone
                  ? const Icon(
                      Icons.check,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
