import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'add_task_screen.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        //for floating action we need a widget or directly FloatingActionButton
        //but because of want a Modal Button sheet we need to wrap it with a widget Builder
        //builder takes a property builder which takes the context and render our floating action
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              child: Icon(Icons.add),
              onPressed: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    context: context,
                    builder: (context) =>
                    //AddTaskScreen is a method that renders the addScreen inside the floating button
                    //when task list was here, the addition of new task was sorted out here
                    //where the string passed into our call back fn is the text from the text field
                    //that was stored in the add screen class and passed in the call back fn when pressed
                    //so here we call the constructor passing the call back fn.
                    //a new Task was created here with the String
                    //but after using Provider.of to get the value of TaskData in the Add task screen class
                    //we managed to add the created class on that screen by created a add fn in the task data class
                    //which means we ain't transporting our class with a parameter
                    AddTaskScreen()
                );
              },
            );
          }
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 30.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 30,
                      child: Icon(
                        Icons.list,
                        size: 30.0,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Qurbs',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      //we changed first from using a .length method on our task list
                      //to getting it from the provider and then .length
                      //to finally creating a method inside task data to handle the length
                      Provider.of<TaskData>(context).taskCount > 1 ? Provider.of<TaskData>(context).taskCount.toString() + " tasks" :
                      Provider.of<TaskData>(context).taskCount.toString() + " task",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // padding: EdgeInsets.symmetric(horizontal: 20.0),
                height: 300.0, //without size a container wont show
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child: Padding(
                  //you can put the padding around the first child in the container
                  //or use padding property of the container
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: TasksList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
