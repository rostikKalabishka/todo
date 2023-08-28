import 'dart:async';

import 'package:flutter/material.dart';

import 'package:todo/domain/data_provider/box_manager.dart';
import 'package:todo/domain/entity/group.dart';

class GroupFormWidgetModel {
  var nameGroup = '';
  void saveGroup(BuildContext context) async {
    if (nameGroup.isEmpty) return;

    final box = await BoxManager.instance.openGroupBox();
    final group = Group(name: nameGroup);
    await box.add(group);
    await BoxManager.instance.closeBox(box);
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
