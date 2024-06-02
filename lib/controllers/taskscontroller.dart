import 'package:todoapp/models/task.dart';

import 'package:todoapp/repositroies/tasksrepositroeis.dart';

class TasksController {
  final TasksRepositories taskRepository = TasksRepositories();
  List<Task> _list = [];

  Future<List<Task>> get list async {
    if (_list.isEmpty) {
      await _fetchTasks();
    }

    return [..._list];
  }

  Future<void> _fetchTasks() async {
    _list = await taskRepository.getTasks();
  }

  Future<void> addTask(String title, String date) async {
    bool isDone = false;
    final newTask = await taskRepository.addTask(title, date, isDone);
    if (newTask != null) {
      _list.add(newTask);
    }
  }

  Future<void> editTasks(
      String id, String title, String date, bool isDone) async {
    final index = _list.indexWhere((task) {
      return task.id == id;
    });
    _list[index].title = title;
    _list[index].date = date;
    _list[index].isDone = isDone;
  }

  isDelete(String id) async {
    _list.removeWhere((task) {
      return task.id == id;
    });
    taskRepository.isdelete(id);
  }
}
