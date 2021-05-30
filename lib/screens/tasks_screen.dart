import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/theme/colors.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/view_task_screen.dart';
import 'package:todo_app/widgets/task_list.dart';
import 'package:todo_app/widgets/task_widget.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/database/todo_db.dart';
import '../utils/constants.dart';
import '../theme/sizes.dart';
import 'add_task_screen.dart';

class TasksScreen extends StatefulWidget {
  @override
  _TasksScreenState createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  List<TodoModelClass> taskList;
  bool isLoading = false;

  Future refreshNotes() async {
    setState(() => isLoading = true);
    taskList = await TodoDatabase.instance.readAllNotes();
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    refreshNotes();
  }

  @override
  void dispose() {
    TodoDatabase.instance.close();

    super.dispose();
  }

  // DateFormat('EEEE, d').format(DateTime.parse(json[NoteFields.time])

  // DateTime.parse(json[NoteFields.time] as String)

  Future addNewTask(titleText, descriptionText) async {
    final task = TodoModelClass(
      title: titleText,
      description: descriptionText,
      currentDateTime: DateTime.now(),
      // selectedDate: datePick,
      // selectedTime: timePick,
    );
    await TodoDatabase.instance.create(task);
    setState(() {
      taskList.add(TodoModelClass(
        title: titleText,
        description: descriptionText,
        currentDateTime: DateTime.now(),
        // selectedDate: datePick,
        // selectedTime: timePick,
      ));

      // todos.add(TodoModelClass(
      //     title: titleText,
      //     description: descriptionText,
      //     currentDateTime: DateFormat('EEEE, d')
      //         .format(DateTime.now()),
      //     selectedDate: dateText,
      //     selectedTime: timeText));
    });
  }

  // Future updateTask(titleText, descriptionText, wTodo) async {
  //
  //   final task = wTodo.copy(
  //     title: titleText,
  //     description: descriptionText,
  //   );
  //
  //   await TodoDatabase.instance.update(task);
  //
  // }

  String error = "";
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
                      todoes: taskList,
                      isLoading: isLoading,
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
                          builder: (context) => AddTaskScreen(
                            addTask: (titleText, descriptionText) async {
                              // setState(() {
                              //   todos.add(TodoModelClass(
                              //       title: titleText,
                              //       description: descriptionText,
                              //       currentDateTime: DateFormat('EEEE, d')
                              //           .format(DateTime.now()),
                              //       selectedDate: dateText,
                              //       selectedTime: timeText));
                              // });
                              await addNewTask(
                                titleText,
                                descriptionText,
                              );
                            },
                            errorTask: () {
                              setState(() {
                                kErrorMsg =
                                    "Please check that title and description are filled";
                              });
                            },
                          ),
                        );
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
