import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  //during refactoring our task list has gone through lots of changes
  //from creating a constructor to export it to get the data in task screen
  //to wrapping it with a provider.of(context) to listen to the TaskData being streamed at the main
  //to wrapping it in a consumer widget so that the long typing can be wrapped by value, a property of consumer
  //also, our stateful widget was changed to stateless because checkbox isn't implemented
  //again instead of tapping directly to our task list in task data to get the length, we use a private and made it into a method
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      //taskData replaced 'value' to mean items in the class TaskData
      builder: (BuildContext context, taskData, Widget? child) {
        return ListView.builder( //we needed an index
          itemCount: taskData.taskCount,
          itemBuilder: (BuildContext context, int index) {
            //calling our class TaskTile which used to be stateful and implemented a state change of isChecked
            //it got modified to have a constructor and transported here
            //here we first used a statefull and setstate which we changed to Provider.of<TaskData>(context)
            // to grab all the data in the class task_data
            //we again changed it to use consumer that uses value as parameter to hold all of this Provider.of<TaskData>(context)
            return TaskTile(
              //we can also replace taskData.tasks[index] with a variable calling it on each
                taskData.tasks[index].name, //we are passing the name as parameter to the argument
                taskData.tasks[index].isDone,
                (value) {
                  taskData.updateTask(taskData.tasks[index]);
                  },
                (){
                  taskData.deleteTask(taskData.tasks[index]);
                },
            );
          },
        );
      },
    );
  }
}
