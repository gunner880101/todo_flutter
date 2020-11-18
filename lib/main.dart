import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/routes/routes.dart';

import 'common/todolist.dart';

void main() {
  // runApp(MyApp());
  runApp(ChangeNotifierProvider<TodoList>(
      create: (context) => TodoList(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodoList>(context, listen: false);
    provider.loadData(context);
    return MaterialApp(
      title: 'Todo List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/list',
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
    );
  }
}
