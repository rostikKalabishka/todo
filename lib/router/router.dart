import 'package:flutter/material.dart';
import 'package:todo/ui/widget/task_form/task_form_widget.dart';
import 'package:todo/ui/widget/tasks/tasks_widget.dart';

import '../ui/widget/group_form/group_form_widget.dart';
import '../ui/widget/groups/group_widget.dart';

abstract class MainNavigationRouteNames {
  static const groups = '/';
  static const groupsForm = '/groupsForm';
  static const tasks = '/tasks';
  static const tasksForm = '/taskForm';
}

class MainNavigation {
  final initialRoute = MainNavigationRouteNames.groups;

  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRouteNames.groups: (context) => const GroupsWidget(),
    MainNavigationRouteNames.groupsForm: (context) => const GroupFormWidget(),
  };
}

Route<Object> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case MainNavigationRouteNames.tasks:
      final groupKey = settings.arguments as int;
      return MaterialPageRoute(builder: (context) {
        return TasksWidget(groupKey: groupKey);
      });
    case MainNavigationRouteNames.tasksForm:
      final groupKey = settings.arguments as int;
      return MaterialPageRoute(builder: (context) {
        return TaskFormWidget(groupKey: groupKey);
      });
    default:
      const widget = Text('Navigation Error');
      return MaterialPageRoute(builder: (context) => widget);
  }
}
