import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {
  List<Task> _tasksList = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy something'),
  ];

  int get taskCount {
    return _tasksList.length;
  }

  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasksList);
  }

  void addTaskToList(Task newTask) {
    _tasksList.add(newTask);
    notifyListeners();
  }
}
