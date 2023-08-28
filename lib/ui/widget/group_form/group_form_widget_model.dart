import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:todo/domain/entity/group.dart';

class GroupFormWidgetModel {
  var nameGroup = '';
  void saveGroup(BuildContext context) async {
    if (nameGroup.isEmpty) return;
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(GroupAdapter());
    }
    final box = await Hive.openBox<Group>('groups_box');
    final group = Group(name: nameGroup);
    unawaited(box.add(group));
    Navigator.of(context).pop();
  }

  // GroupFormWidgetModel({required this.nameGroup});
}

class GroupFormWidgetModelInherited extends InheritedWidget {
  final GroupFormWidgetModel modelFormField;
  const GroupFormWidgetModelInherited(
      {super.key, required Widget child, required this.modelFormField})
      : super(child: child);

  static GroupFormWidgetModelInherited? watch(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<GroupFormWidgetModelInherited>();
  }

  static GroupFormWidgetModelInherited? read(BuildContext context) {
    final widget = context
        .getElementForInheritedWidgetOfExactType<
            GroupFormWidgetModelInherited>()
        ?.widget;
    return widget is GroupFormWidgetModelInherited ? widget : null;
  }

  @override
  bool updateShouldNotify(GroupFormWidgetModelInherited oldWidget) {
    return false;
  }
}
