import 'package:flutter/material.dart';

import '../model/todo_model.dart';

class ToDoList extends StatelessWidget {
  final Todo todo;
  final todochanged;
  final delete_task;
  const ToDoList(
      {Key? key, required this.todo, this.todochanged, this.delete_task});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20),
      child: ListTile(
        onTap: () {
          todochanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone
              ? Icons.check_box
              : Icons.check_box_outline_blank_outlined,
          color: Color.fromARGB(255, 217, 163, 2),
          size: 24,
        ),
        title: Text(
          todo.todoItem!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: IconButton(
          onPressed: () {
            delete_task(todo.id);
          },
          icon: const Icon(Icons.delete),
          color: Colors.red,
          iconSize: 24,
        ),
      ),
    );
  }
}
