import 'package:flutter/material.dart';
import 'package:todo/widget/tasks/tasks_widget_model.dart';

class TasksWidget extends StatefulWidget {
  const TasksWidget({super.key});

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  TasksWidgetModal? _model;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TasksWidgetModal(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TasksWidgetModelInherited(
          model: model, child: const TasksWidgetBody());
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class TasksWidgetBody extends StatelessWidget {
  const TasksWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TasksWidgetModelInherited.watch(context)?.model;
    final title = model?.group?.name ?? 'Task';
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          model?.showForm(context);
        },
      ),
    );
  }
}
