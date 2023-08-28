import 'package:flutter/material.dart';
import 'package:todo/ui/widget/task_form/task_form_widget_model.dart';

class TaskFormWidget extends StatefulWidget {
  final groupKey;
  const TaskFormWidget({super.key, required this.groupKey});

  @override
  State<TaskFormWidget> createState() => _TaskFormWidgetState();
}

class _TaskFormWidgetState extends State<TaskFormWidget> {
  late final TaskFormWidgetModel _model;
  @override
  void initState() {
    super.initState();
    _model = TaskFormWidgetModel(groupKey: widget.groupKey);
  }

  @override
  Widget build(BuildContext context) {
    final model = _model;

    return TaskFormWidgetModelProvider(
      model: model,
      child: const _TaskFormWidgetBody(),
    );
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
          onPressed: () => TaskFormWidgetModelProvider.read(context)
              ?.model
              .saveTask(context)),
    );
  }
}

class _TaskTextWidget extends StatelessWidget {
  const _TaskTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = TaskFormWidgetModelProvider.read(context)?.model;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        TextField(
          // maxLines: null,
          // minLines: null,
          // expands: true,
          onChanged: (value) => model?.taskText = value,
          onEditingComplete: () => model?.saveTask(context),
          autofocus: true,
          // controller: addGroupsController,
          decoration: const InputDecoration(
              border: InputBorder.none, hintText: 'Text task'),
        ),
      ]),
    );
  }
}
