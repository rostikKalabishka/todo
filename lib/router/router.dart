import 'package:todo/widget/task_form/task_form_widget.dart';
import 'package:todo/widget/tasks/tasks_widget.dart';

import '../widget/group_form/group_form_widget.dart';
import '../widget/groups/group_widget.dart';

final routes = {
  '/groups': (context) => const GroupsWidget(),
  '/groups/form': (context) => const GroupFormWidget(),
  '/groups/tasks': (context) => const TasksWidget(),
  '/groups/tasks/form': (context) => const TaskFormWidget()
};
