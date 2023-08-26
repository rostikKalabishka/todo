import 'package:flutter/material.dart';

class GroupFormWidget extends StatelessWidget {
  const GroupFormWidget({super.key});

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
        child: _AddGroup(),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.indigo,
        child: const Icon(
          Icons.done,
          color: Colors.white,
        ),
        onPressed: () {},
      ),
    );
  }
}

class _AddGroup extends StatefulWidget {
  const _AddGroup({super.key});

  @override
  State<_AddGroup> createState() => _AddGroupState();
}

class _AddGroupState extends State<_AddGroup> {
  @override
  Widget build(BuildContext context) {
    final addGroupsController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              autofocus: true,
              controller: addGroupsController,
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
