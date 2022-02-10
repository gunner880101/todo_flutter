import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/controllers/todo_list_controller.dart';

final todoListChangeNotifierProvider = ChangeNotifierProvider(
  (ref) => TodoListChangeNotifier(ref),
);
