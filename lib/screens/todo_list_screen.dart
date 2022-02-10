import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/controllers/providers.dart';
import 'package:todo_flutter/widgets/todo_card.dart';

class TodoListScreen extends ConsumerStatefulWidget {
  const TodoListScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends ConsumerState<TodoListScreen> {
  @override
  void initState() {
    super.initState();
    ref.read(todoListChangeNotifierProvider).fetchTodoList();
  }

  @override
  Widget build(BuildContext context) {
    final todoList =
        ref.watch(todoListChangeNotifierProvider.select((p) => p.todoList)) ??
            [];
    return Scaffold(
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) => TodoCard(todoInfo: todoList[index]),
      ),
    );
  }
}
