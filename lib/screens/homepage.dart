import 'package:flutter/material.dart';
import 'package:todo/constants/colors.dart';
import '../model/todo_model.dart';
import '../widgets/searchbox.dart';
import '../widgets/todolist.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Todo.todoList();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Color bg = const Color.fromARGB(255, 235, 235, 235);
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
                      for (Todo todoo in todoList)
                        ToDoList(
                          todo: todoo,
                          todochanged: todo_change,
                          delete_task: delete_todo_task,
                        )
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
              builder: (BuildContext context) {
                return AlertDialog(
                  scrollable: true,
                  title: const Align(
                    alignment: Alignment.center,
                    child: Text(
                      'ToDo',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 217, 163, 2),
                      ),
                    ),
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            decoration: const InputDecoration(
                              focusColor: Color.fromARGB(255, 217, 163, 2),
                              fillColor: Color.fromARGB(255, 217, 163, 2),
                              labelText: 'Your Task',
                              icon: Icon(Icons.edit),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  actions: [
                    FloatingActionButton.extended(
                        label:
                            const Text('Add', style: TextStyle(fontSize: 20)),
                        icon: const Icon(
                          Icons.add,
                          size: 20,
                        ),
                        backgroundColor: const Color.fromARGB(255, 217, 163, 2),
                        onPressed: () {
                          todo_adder(controller.text);
                        })
                  ],
                );
              });
        },
        label: const Text('ToDo', style: TextStyle(fontSize: 20)),
        icon: const Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: const Color.fromARGB(255, 217, 163, 2),
      ),
    );
  }

  void todo_adder(String task) {
    setState(() {
      todoList.add(Todo(
          id: DateTime.now().millisecondsSinceEpoch.toString(),
          todoItem: task));
    });
    controller.clear();
  }

  void delete_todo_task(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void todo_change(Todo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  AppBar _buildAppBar(Color bg) {
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
                color: Color.fromARGB(255, 9, 9, 9),
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
