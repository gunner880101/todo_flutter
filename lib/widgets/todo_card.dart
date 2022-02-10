import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo_flutter/controllers/providers.dart';
import 'package:todo_flutter/models/todo_info.dart';

class TodoCard extends ConsumerStatefulWidget {
  final TodoInfo todoInfo;
  const TodoCard({
    Key? key,
    required this.todoInfo,
  }) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TodoCardState();
}

class _TodoCardState extends ConsumerState<TodoCard> {
  @override
  Widget build(BuildContext context) {
    final todoList = ref.watch(todoListChangeNotifierProvider);
    return InkWell(
      onTap: () {
        TodoInfo temp = widget.todoInfo;
        temp.isCompleted = temp.isCompleted == true ? false : true;
        todoList.updateTodoInfo(temp);
      },
      child: Card(
        child: ListTile(
          title: Text(widget.todoInfo.title ?? ''),
          subtitle: Text(widget.todoInfo.content ?? ''),
          tileColor: widget.todoInfo.isCompleted == true
              ? Colors.green[100]
              : Colors.red[50],
        ),
      ),
    );
  }
}
