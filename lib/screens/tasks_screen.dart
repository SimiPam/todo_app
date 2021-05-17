import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/colors.dart';
import 'package:todo_app/model/todo_list.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/view_task_screen.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/widgets/task_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../sizes.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todos.add(TodoModelClass(
        title: "Add A New Task",
        description: "none",
        currentDateTime: DateFormat('EEEE, d').format(DateTime.now()),
        selectedDate: null,
        selectedTime: null));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        title: Text(
          'My todos',
          style: GoogleFonts.poppins(
            color: AppColors.whiteColor,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      drawer: Drawer(),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 400,
            height: 600,
            child:
                Image.asset('assets/images/image.png', fit: BoxFit.fitHeight),
          ),
          Positioned(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Hey Simi ",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "🙂",
                  style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            top: 35,
            left: 30,
          ),
          DraggableScrollableSheet(
            maxChildSize: 0.85,
            minChildSize: 0.13,
            builder: (BuildContext context, ScrollController scrolController) {
              return Stack(
                clipBehavior: Clip.none,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                    ),
                    child: TaskListBuilder(
                      controllerScroll: scrolController,
                    ),
                  ),
                  Positioned(
                    child: Icon(
                      Icons.arrow_drop_up_outlined,
                      size: 50,
                    ),
                    top: -40,
                    right: (size.width / 2) - 32,
                  ),
                  Positioned(
                    child: Icon(
                      Icons.keyboard_arrow_up_outlined,
                      size: 50,
                    ),
                    top: -50,
                    right: (size.width / 2) - 32,
                  ),
                  Positioned(
                    child: FloatingActionButton(
                      backgroundColor: AppColors.backgroundColor,
                      child: Icon(Icons.add),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (context) => AddTaskScreen());
                      },
                    ),
                    bottom: 20,
                    right: 20,
                  )
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

// child: Column(
// mainAxisSize: MainAxisSize.min,
// children: <Widget>[
// ListTile(
// leading: new Icon(Icons.photo),
// title: new Text('Photo'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// leading: new Icon(Icons.music_note),
// title: new Text('Music'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// leading: new Icon(Icons.videocam),
// title: new Text('Video'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ListTile(
// leading: new Icon(Icons.share),
// title: new Text('Share'),
// onTap: () {
// Navigator.pop(context);
// },
// ),
// ],
// ),

//   Container(
//     // child: TaskList(tapAction: () => ViewTaskScreen()),
//     child: TaskList(controllerScroll: scrolController),
//   ),
// ),
//
//       ListTile(
//       title: Text(
//       "Task No $index",
// style: TextStyle(
// color: Colors.grey[900],
// fontWeight: FontWeight.bold),
// ),
// subtitle: Text(
// "This is the detail of task No $index",
// style: TextStyle(color: Colors.grey[700]),
// ),
// trailing: Icon(
// Icons.check_circle,
// color: Colors.greenAccent,
// ),
// isThreeLine: true,
// );

//   AnimatedList(
// itemBuilder: (context, index, animation)
