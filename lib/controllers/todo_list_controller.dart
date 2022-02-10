import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/apis/get_todo_list.dart';
import 'package:todo_flutter/models/todo_info.dart';

class TodoListChangeNotifier with ChangeNotifier {
  final ChangeNotifierProviderRef _ref;
  List<TodoInfo>? _todoList;

  List<TodoInfo>? get todoList => _todoList;

  TodoListChangeNotifier(this._ref) {
    _todoList = [];
  }

  Future<void> fetchTodoList() async {
    _todoList = await fetchTodoListFromLocal();
    notifyListeners();
  }

  void updateTodoInfo(TodoInfo info) {
    if (_todoList == null) {
      return;
    }
    final index = _todoList?.indexWhere((element) => element.id == info.id);
    _todoList?[index!] = info;
    notifyListeners();
  }
}
