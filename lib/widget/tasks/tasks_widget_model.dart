import 'package:flutter/material.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/entity/group.dart';
import 'package:todo/domain/entity/task.dart';

class TasksWidgetModal extends ChangeNotifier {
  int groupKey;
  late final Future<Box<Group>> _groupBox;
  Group? _group;
  Group? get group => _group;

  TasksWidgetModal({required this.groupKey}) {
    _setup();
  }

  void showForm(BuildContext context) {
    Navigator.of(context).pushNamed('/groups/tasks/form', arguments: groupKey);
  }

  void _loadGroup() async {
    final box = await _groupBox;
    _group = box.get(groupKey);
    notifyListeners();
  }

  void _setup() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    _groupBox = Hive.openBox<Group>('groups_box');

    _loadGroup();
  }
}

class TasksWidgetModelInherited extends InheritedNotifier {
  final TasksWidgetModal model;
  const TasksWidgetModelInherited(
      {super.key, required Widget child, required this.model})
      : super(child: child, notifier: model);

  static TasksWidgetModelInherited? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TasksWidgetModelInherited>();
  }

  static TasksWidgetModelInherited? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<TasksWidgetModelInherited>()
        ?.widget;
    return widget is TasksWidgetModelInherited ? widget : null;
  }
}
