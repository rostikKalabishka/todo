import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class GroupsWidget extends StatelessWidget {
  const GroupsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo Groups'),
        backgroundColor: Colors.indigo,
      ),
      body: const SafeArea(
        child: _GroupList(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(Icons.add_task),
        onPressed: () {},
      ),
    );
  }
}

class _GroupList extends StatefulWidget {
  const _GroupList({super.key});

  @override
  State<_GroupList> createState() => _GroupListState();
}

class _GroupListState extends State<_GroupList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return const Divider(
          height: 1,
        );
      },
      itemCount: 100,
      separatorBuilder: (BuildContext context, int index) {
        return _GroupListRowWidget(
          indexList: index,
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
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {},
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
          title: const Text('2133123123213123'),
          trailing: const Icon(Icons.chevron_right),
        ),
      ),
    );
  }
}
