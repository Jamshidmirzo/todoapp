import 'package:json_annotation/json_annotation.dart';
part 'task.g.dart';

@JsonSerializable()
class Task {
  String title;
  String id;
  String date;
  bool isDone;
  Task({
    required this.title,
    required this.date,
    required this.id,
    this.isDone = false,
  });
  factory Task.fromJson(Map<String, dynamic> json) {
    print(json);
    return _$TaskFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$TaskToJson(this);
  }
}
