import 'package:flutter/material.dart';
import 'package:todo_flutter/ui/pages/item.dart';
import 'package:todo_flutter/ui/pages/list.dart';

final routes = {
  '/list': (context) => TodoListPage(),
  '/item': (context, {arguments}) => TodoItemPage(arguments: arguments),
};

var onGenerateRoute = (RouteSettings settings) {
  final String name = settings.name;
  final Function pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
          MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};
