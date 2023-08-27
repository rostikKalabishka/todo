import 'package:hive_flutter/adapters.dart';
import 'package:todo/domain/entity/task.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(0)
  String name;

  @HiveField(1)
  HiveList<Task>? tasks;
  Group({required this.name});

  void addTask(Box<Task> box, Task task) {
    tasks ??= HiveList(box);
    tasks?.add(task);
  }
}
