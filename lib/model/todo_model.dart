// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Todo {
  String? id;
  String? todoItem;
  bool isDone;
  Todo({
    this.id,
    this.todoItem,
    this.isDone = false,
  });

  static List<Todo> todoList() {
    return [
      Todo(id: '01', todoItem: 'LOL1', isDone: false),
      Todo(
          id: '02',
          todoItem:
              'DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDd',
          isDone: true),
    ];
  }
}
