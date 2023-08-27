import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/domain/entity/group.dart';

import '../../domain/entity/task.dart';

class TaskFormWidgetModel {
  int groupKey;
  var taskText = '';

  TaskFormWidgetModel({required this.groupKey});
  void saveTasks(BuildContext context) async {
    if (taskText.isEmpty) return;

    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    if (!Hive.isAdapterRegistered(2)) {
      Hive.registerAdapter(TaskAdapter());
    }

    final task = Task(text: taskText, isDone: false);

    final tasksBox = await Hive.openBox<Task>('tasks_box');
    await tasksBox.add(task);

    final groupBox = await Hive.openBox<Group>('groups_box');
    final group = groupBox.get(groupKey);
    group?.addTask(tasksBox, task);

    Navigator.of(context).pop();
  }

  // GroupFormWidgetModel({required this.nameGroup});
}

class TaskFormWidgetInherited extends InheritedWidget {
  final TaskFormWidgetModel model;
  const TaskFormWidgetInherited(
      {super.key, required Widget child, required this.model})
      : super(child: child);

  static TaskFormWidgetInherited? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TaskFormWidgetInherited>();
  }

  static TaskFormWidgetInherited? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TaskFormWidgetInherited>()
        ?.widget;
    return widget is TaskFormWidgetInherited ? widget : null;
  }

  @override
  bool updateShouldNotify(TaskFormWidgetInherited oldWidget) {
    return false;
  }
}
