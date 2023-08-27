import 'package:flutter/material.dart';
import 'package:todo/widget/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  const TaskFormWidget({super.key});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  TaskFormWidgetModel? _model;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_model == null) {
      final groupKey = ModalRoute.of(context)!.settings.arguments as int;
      _model = TaskFormWidgetModel(groupKey: groupKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;
    if (model != null) {
      return TaskFormWidgetInherited(
        child: const _TaskFormWidgetBody(),
        model: model,
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}

class _TaskFormWidgetBody extends StatelessWidget {
  const _TaskFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Add Task',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: const SafeArea(
        child: _TaskTextWidget(),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.indigo,
          child: const Icon(
            Icons.done,
            color: Colors.white,
          ),
          onPressed: () =>
              TaskFormWidgetInherited.read(context)?.model.saveTasks(context)),
    );
  }
}

class _TaskTextWidget extends StatelessWidget {
  const _TaskTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetInherited.read(context)?.model;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        TextField(
          maxLines: null,
          minLines: null,
          // expands: true,
          onChanged: (value) => model?.taskText = value,
          onEditingComplete: () => model?.saveTasks(context),
          autofocus: true,
          // controller: addGroupsController,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Text task'),
        ),
      ]),
    );
  }
}
