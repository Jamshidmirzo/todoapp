import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/controllers/taskscontroller.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class Taskswidget extends StatefulWidget {
  final task;
  final VoidCallback isEdit;
  final VoidCallback isDelete;
  Taskswidget(
      {super.key,
      required this.task,
      required this.isEdit,
      required this.isDelete});

  @override
  State<Taskswidget> createState() => _TaskswidgetState();
}

class _TaskswidgetState extends State<Taskswidget> {
  final TasksController taskController = TasksController();

  bool isChanged = false;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.task.title,
        style: GoogleFonts.abel(fontWeight: FontWeight.bold, fontSize: 23),
      ),
      subtitle: Text(
        widget.task.date,
        style: const TextStyle(color: Colors.red),
      ),
      leading: ZoomTapAnimation(
        onTap: () {
          isChanged = true;
          setState(() {});
        },
        child: isChanged
            ? Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.green),
                child: const Icon(
                  size: 29,
                  Icons.done_all_outlined,
                  weight: 50,
                ),
              )
            : Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
              ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: widget.isEdit,
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: widget.isDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
