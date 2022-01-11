import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';
import 'dart:collection';

class TaskData extends ChangeNotifier {

  List<Task> _tasks = [
    Task(name: 'Buy milk', isDone: false),
    Task(name: 'Buy eggs', isDone: false),
    Task(name: 'Buy bread', isDone: false),
  ];

  //this now returns the tasks in a form that cant be changed
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks); //prevents modification
  }

  //this gets the length of count
  int get taskCount {
    return _tasks.length;
  }

  void addTask(String newTaskTitle) {
    //create a new task
    //add task to our tasks list
    //notify listeners
    final task = Task(name: newTaskTitle, isDone: false);
    _tasks.add(task);
    notifyListeners();
  }

  //update list when clicked.
  //for each task invoke the toggleDone() method on it
  //ie make the isDone that is false to true which controls the checkbox tick
  void updateTask(Task task) {
    task.toggleDone();
    notifyListeners();
  }

  void deleteTask(Task task) {
    //inside our _tasks list, remove the task pass
    //so we use the index to look for the particular task
    _tasks.remove(task);
    notifyListeners();
  }
}