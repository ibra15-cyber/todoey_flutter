class Task {

  final String name;
  bool isDone = false;

  Task({required this.name, required this.isDone});

  //this fn forces isDone to be true
  void toggleDone() {
    isDone = !isDone;
  }
}