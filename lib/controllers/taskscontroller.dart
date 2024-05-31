import 'package:todoapp/models/task.dart';
import 'package:todoapp/repositroies/tasksrepositroeis.dart';

class Taskscontroller {
  final taskrepository = Tasksrepositroeis();
  List<Task> _list = [];
  Future<List<Task>> get list async {
    _list = await taskrepository.getTask();
    return [..._list];
  }
}
