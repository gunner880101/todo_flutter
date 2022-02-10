import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:todo_flutter/models/todo_info.dart';

Future<List<TodoInfo>> fetchTodoListFromLocal() async {
  String jsonString = await rootBundle.loadString('assets/todolist.json');
  List temp = json.decode(jsonString);
  List<TodoInfo> list = [];
  list.addAll(temp.map((e) => TodoInfo.fromJson(e)));
  return list;
}
