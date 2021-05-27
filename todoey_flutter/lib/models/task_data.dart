import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  List<Task> tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy something'),
  ];

  int get taskCount {
    return tasksList.length;
  }

  void addTaskToList(Task newTask) {
    tasksList.add(newTask);
    notifyListeners();
  }
}
