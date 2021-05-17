import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/view_task_screen.dart';

import '../colors.dart';
import '../sizes.dart';

class TaskWidget extends StatefulWidget {
  final TodoModelClass todos;
  final VoidCallback onClicked;
  final VoidCallback onDelete;
  final VoidCallback onDone;

  const TaskWidget({
    @required this.todos,
    @required this.onClicked,
    this.onDelete,
    this.onDone,
  });
  @override
  _TaskWidgetState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends State<TaskWidget> {
// class TaskWidget extends StatelessWidget {
  // void removeItem(int index) {
  //   items.remove(todos);
  TextDecoration strike = TextDecoration.none;
  bool check = false;
  int checkSwitch = 1;
  Color bckColor = AppColors.backgroundColor;
  Color txtColor = AppColors.whiteColor;
  Color ellipsColor = AppColors.ellipseColor;

  void onCheck() {
    check = true;
    bckColor = AppColors.inactiveColor;
    txtColor = Colors.grey;
    strike = TextDecoration.lineThrough;
    ellipsColor = Colors.grey;
    widget.todos.doneState = true;
    checkSwitch = 2;
  }

  void unCheck() {
    check = false;
    bckColor = AppColors.backgroundColor;
    txtColor = AppColors.whiteColor;
    strike = TextDecoration.none;
    ellipsColor = AppColors.ellipseColor;
    widget.todos.doneState = false;
    checkSwitch = 1;
  }

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        actionExtentRatio: 0.2,
        secondaryActions: [
          Checkbox(
            activeColor: Colors.transparent,
            checkColor: AppColors.ongoingColor,
            value: check,
            tristate: false,
            onChanged: (bool isChecked) {
              setState(() {
                if (checkSwitch == 1) {
                  onCheck();
                } else {
                  unCheck();
                }
              });
            },
          ),
          IconSlideAction(
              caption: "Delete",
              foregroundColor: AppColors.globalButtonColor,
              icon: Icons.delete,
              onTap: widget.onDelete)
        ],
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: bckColor,
          ),
          child: ListTile(
            title: Text(
              widget.todos.title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: txtColor,
                decorationColor: Colors.black54,
                decorationStyle: TextDecorationStyle.solid,
                decoration: strike,
                fontSize: Sizes.dimens_20,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
              widget.todos.currentDateTime,
              style: GoogleFonts.poppins(
                color: Colors.grey[400],
                height: 0.6,
                decorationColor: Colors.black54,
                decorationStyle: TextDecorationStyle.solid,
                decoration: strike,
                fontSize: Sizes.dimens_10,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Container(
              margin: EdgeInsets.only(top: 3.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: ellipsColor,
                  width: Sizes.dimens_4,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(Sizes.dimens_15),
                ),
              ),
              width: Sizes.dimens_17,
              height: Sizes.dimens_17,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => ViewTaskScreen(
                  todo: widget.todos,
                  statusText: check ? "task completed" : 'to be completed',
                ),
              );
            },
          ),
        ),
      );
}

// child: Theme(
//   data: ThemeData(
//     unselectedWidgetColor: Colors.transparent,
//   ),
//   child: Checkbox(
//     activeColor: Colors.transparent,
//     checkColor: AppColors.backgroundColor,
//     value: false,
//     tristate: false,
//     onChanged: (bool isChecked) {},
//   ),
// ),
