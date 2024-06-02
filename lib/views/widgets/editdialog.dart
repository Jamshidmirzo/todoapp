// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class Editdialog extends StatelessWidget {
  String title;
  String date;
  String newTitle = '';
  String newDate = '';
  final taskController = TextEditingController();
  final dateController = TextEditingController();
  Editdialog({super.key, required this.title, required this.date}) {
    taskController.text = title;
    dateController.text = date;
  }
  final formKey = GlobalKey<FormState>();
  savedfunct(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      newTitle = taskController.text;
      newDate = dateController.text;
      Navigator.pop(context, {
        'title': newTitle,
        'date': newDate,
        'isDone': false,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit your task'),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel ❌"),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () {
            savedfunct(context);
          },
          child: const Text("Done ✅"),
        ),
      ],
      content: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: taskController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a title';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: dateController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Please enter a date';
                }
                return null;
              },
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
