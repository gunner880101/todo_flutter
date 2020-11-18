import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/bll/models/todo.dart';
import 'package:todo_flutter/common/todolist.dart';

class TodoListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('待办事项列表')),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('res/images/listback.jpg'),
        )),
        child: Padding(
          padding: EdgeInsets.all(5),
          child: Consumer<TodoList>(
              builder: (context, model, child) => ListView.builder(
                  itemCount: model.todolist.length,
                  itemBuilder: (context, index) {
                    Todo item = model.todolist[index];
                    return Container(
                      height: 80,
                      child: Card(
                          elevation: 10,
                          child: Stack(
                            children: [
                              AnimatedContainer(
                                decoration: BoxDecoration(
                                    color: item.isCompleted
                                        ? Colors.lightGreen
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(3)),
                                duration: Duration(milliseconds: 1500),
                              ),
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ListTile(
                                      leading: Icon(
                                        item.isCompleted
                                            ? Icons.check
                                            : Icons.close,
                                        color: item.isCompleted
                                            ? Colors.green
                                            : Colors.red,
                                      ),
                                      title: Text('${item.title}',
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 20,
                                          )),
                                      trailing: InkWell(
                                          child: Text("查看",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 18,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      Colors.blue)),
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, '/item',
                                                arguments: {"id": item.id});
                                          }))
                                ],
                              )
                            ],
                          )),
                    );
                  })),
        ),
      ),
    );
  }
}
