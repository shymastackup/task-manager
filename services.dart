import 'model.dart';

class TaskManager {
  List<Task> _tasks = [];
  // task adding......................................................
  void addTask(String description) {
    _tasks.add(Task(description));
    print('Task added successfully.');
  }

  // tasks view........................................................
  void viewTasks() {
    if (_tasks.isEmpty) {
      print('No tasks available.');
    } else {
      for (int i = 0; i < _tasks.length; i++) {
        var status = _tasks[i].isCompleted ? 'Completed' : 'Incomplete';
        print('$i. ${_tasks[i].description} - $status');
      }
    }
  }

  // task editing...............................................
  void updateTask(int index, String newDescription) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].description = newDescription;
      print('Task updated successfully.');
    } else {
      print('Invalid task index.');
    }
  }

  // task status.................................................
  void markTaskAsComplete(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks[index].isCompleted = true;
      print('Task marked as complete.');
    } else {
      print('Invalid task index.');
    }
  }

  // task delete...............................................
  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      print('Task deleted successfully.');
    } else {
      print('Invalid task index.');
    }
  }
}
