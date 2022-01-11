import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class AddTaskScreen extends StatelessWidget {
  //we want to export the call back function that takes a screen,
  // hence we create a constructor to carry it along
  // final void Function(String?) addTaskCallback;

  AddTaskScreen(){}

  @override
  Widget build(BuildContext context) {
    String newTaskTitle = '';

    return Container(
      height: 300,
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                color: Colors.lightBlueAccent,
              ),
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                // print(newText); //print as keys typed
                newTaskTitle = newText;
              },
            ),
            SizedBox(
             height: 15,
            ),
            FlatButton(
              child: Text(
                'Add',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              color: Colors.lightBlueAccent,
              onPressed: () {
                // print(newTaskTitle); //on pressed print the final typed
                // previously, addTaskCallback(newTaskTitle); a call back that takes a string
                //was used to carry the string ie new task name to the task screen
                //after entering text in text field; that text is saved as newTaskTitle
                //this data is carried to the next screen using the constructor
                //and creating a fn that it carries or passed
                //so on that screen this current class with its parameter ie fn is passed
                //this fn is a string. the string is harnessed and used to construct a task that its
                //added to our tasks list

                //but now we use the Provider that is able to grab the TaskData we streamed
                //in main class
                //therefore we get access to all data in that class
                //but we are going to create a task and add to the list, which we have created in that class
                //so we call it here and passed the argument, a string, which we got from the textfield and stored high above
                Provider.of<TaskData>(context, listen: false).addTask(newTaskTitle);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}