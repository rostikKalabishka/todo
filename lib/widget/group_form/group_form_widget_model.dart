import 'package:flutter/material.dart';

class GroupFormWidgetModel {
  void saveGroup(BuildContext context) {
    print(nameGroup);
  }

  var nameGroup = '';

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
    return true;
  }
}
