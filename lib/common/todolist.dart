import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:todo_flutter/bll/models/todo.dart';

class TodoList with ChangeNotifier {
  List<Todo> todolist = List();

  void loadData(BuildContext context) {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString("res/todolist.json");
    loadString.then((value) {
      List temp = json.decode(value);
      todolist.clear();
      todolist.addAll(temp.map((e) => Todo.fromJson(e)).toList());
      notifyListeners();
    });
  }

  void changeStatus(int id) {
    var item = todolist.firstWhere((element) {
      return element.id == id;
    });
    todolist[todolist.indexOf(item)].isCompleted =
        !todolist[todolist.indexOf(item)].isCompleted;
    notifyListeners();
  }
}
