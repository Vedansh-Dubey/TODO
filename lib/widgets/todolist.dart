import 'package:flutter/material.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
      child: ListTile(
        onTap: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: const Icon(
          Icons.check_box,
          color: Colors.blue,
          size: 24,
        ),
        title: const Text(
          'Check Mail',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            decoration: TextDecoration.lineThrough,
          ),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.delete),
          color: Colors.red,
          iconSize: 24,
        ),
      ),
    );
  }
}
