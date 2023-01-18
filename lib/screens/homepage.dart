import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todo/constants/colors.dart';
import '../model/todo_model.dart';
import '../widgets/todolist.dart';

class Home extends StatelessWidget {
  Home({super.key});
  final todoList = Todo.todoList();
  @override
  Widget build(BuildContext context) {
    final Color bg = Color.fromARGB(255, 235, 235, 235),
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
                searchBox(),
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
        onPressed: () {},
        
        label: Text('ToDo', style: TextStyle(fontSize: 20)),
        icon: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: dark,
      ),
    );
  }

  Widget searchBox() {
    final Color bg = Color.fromARGB(255, 116, 88, 88),
        dark = const Color.fromARGB(255, 78, 85, 90);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(6),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search_rounded,
              color: dark,
              size: 20,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: dark),
        ),
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
