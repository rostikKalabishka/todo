import 'package:hive_flutter/adapters.dart';

part 'group.g.dart';

@HiveType(typeId: 1)
class Group {
  @HiveField(0)
  String name;

  Group({required this.name});
}
