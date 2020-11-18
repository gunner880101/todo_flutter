import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/common/todolist.dart';

class TodoItemPage extends StatelessWidget {
  final Map arguments;

  const TodoItemPage({Key key, this.arguments}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<TodoList>(context, listen: false);
    var item = provider.todolist.firstWhere((element) {
      return element.id == this.arguments['id'];
    });
    return Scaffold(
        appBar: AppBar(
          title: Text('待办事项详情'),
        ),
        body: Center(
          child: Card(
            elevation: 10,
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Stack(
                  children: [
                    AspectRatio(
                      aspectRatio: 2.0 / 1.0,
                      child: Image.asset('res/images/todoback.jpg',
                          fit: BoxFit.cover),
                    ),
                    Positioned(
                        left: 10,
                        bottom: 10,
                        child: Text('${item.title}',
                            style: TextStyle(fontSize: 32))),
                  ],
                ),
                Container(
                  height: 300,
                  padding: EdgeInsets.all(10),
                  alignment: Alignment.topLeft,
                  child: Text(
                    '${item.content}',
                    style: TextStyle(fontSize: 18),
                    maxLines: 8,
                  ),
                ),
                Consumer<TodoList>(builder: (context, model, child) {
                  return RaisedButton(
                      child: Text('${item.isCompleted ? '取消已完成' : '标记已完成'}',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: item.isCompleted ? Colors.red : Colors.green,
                      onPressed: () {
                        model.changeStatus(item.id);
                        Navigator.of(context).pop();
                      });
                })
              ],
            ),
          ),
        ));
  }
}
