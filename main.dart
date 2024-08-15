import 'dart:io';

import 'services.dart';

void main() {
  TaskManager taskManager = TaskManager();
  while (true) {
    print('''\nTask Manager:
    1. Add Task
    2. View Tasks
    3. Update Task
    4. Mark Task as Complete
    5. Delete Task
    6. Exit''');
    stdout.write('Choose an option: ');
    String? choice = stdin.readLineSync();
    // selecting........................................................
    switch (choice) {
      case '1':
        stdout.write('Enter task description: ');
        String? description = stdin.readLineSync();
        if (description != null && description.isNotEmpty) {
          taskManager.addTask(description);
        } else {
          print('Description cannot be empty.');
        }
        break;
      case '2':
        taskManager.viewTasks();
        break;
      case '3':
        stdout.write('Enter task index to update: ');
        String? indexStr = stdin.readLineSync();
        stdout.write('Enter new description: ');
        String? newDescription = stdin.readLineSync();
        if (indexStr != null &&
            newDescription != null &&
            newDescription.isNotEmpty) {
          int? index = int.tryParse(indexStr);
          if (index != null) {
            taskManager.updateTask(index, newDescription);
          } else {
            print('Invalid index.');
          }
        } else {
          print('Description cannot be empty.');
        }
        break;
      case '4':
        stdout.write('Enter task index to mark as complete: ');
        String? indexStr = stdin.readLineSync();
        if (indexStr != null) {
          int? index = int.tryParse(indexStr);
          if (index != null) {
            taskManager.markTaskAsComplete(index);
          } else {
            print('Invalid index.');
          }
        }
        break;
      case '5':
        stdout.write('Enter task index to delete: ');
        String? indexStr = stdin.readLineSync();
        if (indexStr != null) {
          int? index = int.tryParse(indexStr);
          if (index != null) {
            taskManager.deleteTask(index);
          } else {
            print('Invalid index.');
          }
        }
        break;
      case '6':
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please choose a valid option.');
    }
  }
}
