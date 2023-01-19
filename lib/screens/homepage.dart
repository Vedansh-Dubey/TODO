import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import '../model/todo_model.dart';
import '../widgets/searchbox.dart';
import '../widgets/todolist.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final todoList = Todo.todoList();
  @override
  Widget build(BuildContext context) {
    Color bg = const Color.fromARGB(255, 235, 235, 235),
        dark = const Color.fromARGB(255, 78, 85, 90);
    return Scaffold(
      backgroundColor: bg,
      appBar: _buildAppBar(bg),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Column(
              children: [
                SearchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      for (Todo todoo in todoList) ToDoList(todo: todoo),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return Container(
                child: AlertDialog(
                  title: const Text('Add ToDo'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Add'),
                    )
                  ],
                ),
              );
            },
          );
        },
        label: const Text('ToDo', style: TextStyle(fontSize: 20)),
        icon: const Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: dark,
      ),
    );
  }

  AppBar _buildAppBar(Color bg) {
    const Color dark = Color.fromARGB(255, 78, 85, 90);
    return AppBar(
      backgroundColor: bg,
      elevation: 0,
      title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Icon(
              Icons.menu,
              color: tdBlack,
              size: 32,
            ),
            Text(
              'Ab Kya Karna Hai ?',
              style: TextStyle(
                fontSize: 25,
                color: dark,
              ),
            ),
            Icon(
              Icons.delete_forever,
              color: Colors.red,
              size: 35,
            ),
          ]),
    );
  }
}
