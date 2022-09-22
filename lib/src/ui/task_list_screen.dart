import 'package:flutter/material.dart';
import 'package:zayni_sqf/src/ui/add_task_screen.dart';

class TaskListScreen extends StatefulWidget {
  const TaskListScreen({Key? key}) : super(key: key);

  @override
  State<TaskListScreen> createState() => _TaskListScreenState();
}

class _TaskListScreenState extends State<TaskListScreen> {
  Widget _buildItem() {
    return Container(
      color: Colors.green,
      child: ListTile(
        title: const Text("123"),
        subtitle: const Text("llll"),
        trailing: Checkbox(
          value: true,
          onChanged: (bool? value) {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AddTaskScreen(),
          ),
        ),
        child: const Icon(
          Icons.add,
        ),
      ),
      body: Container(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return const Center(
                child: Text("akakka"),
              );
            } else {
              return _buildItem();
            }
          },
        ),
      ),
    );
  }
}
