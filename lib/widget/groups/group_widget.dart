import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'groups_widget_model.dart';

class GroupsWidget extends StatefulWidget {
  const GroupsWidget({super.key});

  @override
  State<GroupsWidget> createState() => _GroupsWidgetState();
}

class _GroupsWidgetState extends State<GroupsWidget> {
  final _model = GroupsWidgetModel();
  @override
  Widget build(BuildContext context) {
    return GroupsWidgetModelInherited(
        model: _model, child: const _GroupsWidgetBody());
  }
}

class _GroupsWidgetBody extends StatelessWidget {
  const _GroupsWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text('ToDo Groups', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: const SafeArea(
        child: _GroupListWidget(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.add_task,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pushNamed('/groups/form');
        },
      ),
    );
  }
}

class _GroupListWidget extends StatelessWidget {
  const _GroupListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final groupsCount =
        GroupsWidgetModelInherited.watch(context)?.model.groups.length ?? 0;
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _GroupListRowWidget(
          indexList: index,
        );
      },
      itemCount: groupsCount,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
    );
  }
}

class _GroupListRowWidget extends StatelessWidget {
  final int indexList;
  const _GroupListRowWidget({super.key, required this.indexList});

  @override
  Widget build(BuildContext context) {
    final model = GroupsWidgetModelInherited.read(context)!.model;
    final group = model.groups[indexList];
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              model.deleteGroup(indexList);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          )
        ],
      ),
      child: ColoredBox(
        color: Colors.white,
        child: ListTile(
          onTap: () {},
          title: Text(group.name),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
