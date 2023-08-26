import 'package:flutter/material.dart';
import 'package:todo/widget/groups/group_widget.dart';

import 'group_form_widget_model.dart';

class GroupFormWidget extends StatefulWidget {
  const GroupFormWidget({super.key});

  @override
  State<GroupFormWidget> createState() => _GroupFormWidgetState();
}

class _GroupFormWidgetState extends State<GroupFormWidget> {
  final _model = GroupFormWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupFormWidgetModelInherited(
      modelFormField: _model,
      child: const _GroupFormWidgetBody(),
    );
  }
}

class _GroupFormWidgetBody extends StatelessWidget {
  const _GroupFormWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          'Add Group',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
      ),
      body: const SafeArea(
        child: _GroupNameWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () => GroupFormWidgetModelInherited.read(context)
            ?.modelFormField
            .saveGroup(context),
      ),
    );
  }
}

class _GroupNameWidget extends StatelessWidget {
  const _GroupNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final model = GroupFormWidgetModelInherited.read(context)?.modelFormField;
    // final addGroupsController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value) => model?.nameGroup = value,
              onEditingComplete: () => model?.saveGroup(context),
              autofocus: true,
              // controller: addGroupsController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), labelText: 'Name group'),
            ),
            const SizedBox(height: 20),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Back'))
          ]),
    );
  }
}
