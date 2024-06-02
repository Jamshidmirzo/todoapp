import 'package:flutter/material.dart';

class AddTaskWidget extends StatefulWidget {
  const AddTaskWidget({super.key});

  @override
  _AddTaskWidgetState createState() => _AddTaskWidgetState();
}

class _AddTaskWidgetState extends State<AddTaskWidget> {
  final TextEditingController _taskController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  void _submit() {
    final String task = _taskController.text;
    final String date = _dateController.text;

    if (task.isNotEmpty && date.isNotEmpty) {
      Navigator.of(context).pop({'title': task, 'date': date});
    } else {
      // Handle empty task or date
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task and date cannot be empty')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _taskController,
            decoration: const InputDecoration(labelText: 'Task'),
          ),
          TextField(
            controller: _dateController,
            decoration: const InputDecoration(labelText: 'Date'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: _submit,
          child: const Text('Add'),
        ),
      ],
    );
  }
}
