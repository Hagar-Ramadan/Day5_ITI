import 'package:flutter/cupertino.dart';
import 'package:todo_application/Task.dart';

class Todo extends ChangeNotifier {
  List<Task> tasklist = [];

  addTask() {
    Task task1 = Task("Task ${tasklist.length + 1}", "Details about it !");
    tasklist.add(task1);

    notifyListeners();
  }
}
