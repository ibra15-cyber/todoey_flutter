import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  //we have modified our TaskTile once again to have 3 parameters
  //then finally to four because we needed to control onLongPress
  //its stateless means it can't change or update state
  //hence the class that require our checkbox call back will require to be stateful
  //or we use the Provider package to control state
  late final bool isChecked;
  late final String taskTitle;
  late final void Function(bool?) checkboxCallback;
  late final void Function() longPress;

  TaskTile(this.taskTitle, this.isChecked, this.checkboxCallback, this.longPress);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPress,
      leading: Text(
        taskTitle,
        style: TextStyle(
          decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback, //will control false and true of isChecked which doesn't need state by default
        value: isChecked,
    ),
    );

    }
}


//for back call tutorial

// class TaskTile extends StatefulWidget {
//   @override
//   _TaskTileState createState() => _TaskTileState();
// }
//
// class _TaskTileState extends State<TaskTile> {
//   bool isChecked = false; //this will allow us to use this as global
//   //1. this variable that changes state will be used to control the state of a text
//   //2. then the state of a checkbox by passing it as an argument during checkbox creation
//   //so that it can be used in that class more than one time
//   //but a variable in the build class can pass its state to the other classes by passing those as argument
//
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       //our build is returning a ListTile
//       //but before it does it must compute a Text and a checkbox
//       //but we needed one variable to control Text and the Checkbox selection
//       //if we create a stateful widget for our Checkbox the state of the variable only works in that class
//       //so when we run our program, isChecked is false, hence, both Text crossing and checkbox receive no activity or state change
//       //but when the check box is toggled, our onChange property is called
//       // its passed to the TaskTile Class that will change the state isChecked
//       //then move on to pass that state to the checkbox to be rendered
//       leading: Text(
//         "Task here",
//         style: TextStyle(
//           decoration: isChecked ? TextDecoration.lineThrough : null),
//           ),
//
//       trailing: TaskCheckbox(isChecked, (bool? value) {
//           setState(() {
//             isChecked = value!; //on click change isChecked to true and pass it to value
//             //works locally inside checkbox
//             }); //is checked is passed which is used to control the checkbox below
//             //isChecked's state changes here and the variable is passed to the code below
//       }),
//     );
//   }
// }
//
// //we are trying to make the variable that changes global
// //in the first instance we created one that works but it's local to checkbox
// //but imagine a situation where you will want to pass the same variable to other
// //part of the code
// class TaskCheckbox extends StatelessWidget {
//   bool checkboxState = false;
//   final void Function(bool?) toggleState;
//
//   TaskCheckbox(this.checkboxState, this.toggleState);
//
//   @override
//   Widget build(BuildContext context) {
//     //anytime the checkbox is clicked the parameter passed state through the toggleState will change
//     //hence value changes from false to true hence ticked
//     //t
//     return Checkbox(
//       activeColor: Colors.blueAccent,
//       //we are making the function that will run also as a parameter to our class
//       //we will use this to control the state
//       onChanged: toggleState,
//       value: checkboxState, //works with this value to show which state
//     );
//   }
// }