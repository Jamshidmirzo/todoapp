import 'dart:convert';
import 'package:todoapp/models/task.dart';
import 'package:http/http.dart' as http;

class Tasksservices {
  Future<List<Task>> getTasks() async {
    Uri url = Uri.parse(
        'https://todo-e79e8-default-rtdb.firebaseio.com/tasks/task1.json');
    final responce = await http.get(url);
    final data = jsonDecode(responce.body);
    List<Task> loadedtasks = [];
    data.forEach((key, value) {
      value['id'] = key;
      loadedtasks.add(Task.fromJson(value));
    });
    return loadedtasks;
  }
}
