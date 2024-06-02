import 'dart:convert';
import 'package:todoapp/models/task.dart';
import 'package:http/http.dart' as http;

class Tasksservices {
  Future<List<Task>> getTasks() async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Task> loadedTasks = [];
    data.forEach((key, value) {
      value['id'] = key;
      loadedTasks.add(Task.fromJson(value));
    });
    return loadedTasks;
  }

  Future<Task?> addTask(String title, String date, bool isDone) async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    Map<String, dynamic> taskData = {
      'title': title,
      'date': date,
      'isDone': isDone
    };

    final response = await http.post(url, body: jsonEncode(taskData));
    final data = jsonDecode(response.body);
    if (data != null) {
      taskData['id'] = data['name'];

      return Task.fromJson(taskData);
    }
    return null;
  }

  Future<void> editTasks(
      String id, String title, String date, bool isDone) async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    Map<String, dynamic> taskData = {
      'title': title,
      'date': date,
      'isDone': isDone,
      'id': id
    };
    await http.patch(url, body: taskData);
  }

  Future<void> isDelete(String id) async {
    Uri url =
        Uri.parse('https://todo-e79e8-default-rtdb.firebaseio.com/tasks.json');
    await http.delete(url);
  }
}
