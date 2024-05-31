import 'package:todoapp/models/task.dart';
import 'package:todoapp/services/tasksservices.dart';

class Tasksrepositroeis {
  final taskhttpservice = Tasksservices();
  Future<List<Task>> getTask() async {
    return taskhttpservice.getTasks();
  }
}
