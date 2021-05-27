import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/view_task_screen.dart';

import '../colors.dart';
import '../sizes.dart';

class TaskWidget extends StatelessWidget {
  final TodoModelClass todos;
  // final VoidCallback onClicked;
  final VoidCallback onDelete;
  final VoidCallback onDone;
  final Function onChange;

   TaskWidget({
    @required this.todos,
    // @required this.onClicked,
    this.onDelete,
    this.onDone,
    this.onChange,
  });
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
    todos.doneState = true;
    checkSwitch = 2;
  }

  void unCheck() {
    check = false;
    bckColor = AppColors.backgroundColor;
    txtColor = AppColors.whiteColor;
    strike = TextDecoration.none;
    ellipsColor = AppColors.ellipseColor;
   todos.doneState = false;
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
            value: todos.doneState,
            tristate: false,
            onChanged: onChange,
          ),
          IconSlideAction(
              caption: "Delete",
              foregroundColor: AppColors.globalButtonColor,
              icon: Icons.delete,
              onTap: onDelete)
        ],
        child: Container(
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: todos.doneState
                ? AppColors.inactiveColor
                : AppColors.backgroundColor,
          ),
          child: ListTile(
            title: Text(
              todos.title,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.poppins(
                color: todos.doneState
                    ? AppColors.greyColor
                    : AppColors.whiteColor,
                decorationColor: Colors.black54,
                decorationStyle: TextDecorationStyle.solid,
                decoration: todos.doneState
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: Sizes.dimens_20,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: Text(
             todos.currentDateTime,
              style: GoogleFonts.poppins(
                color: Colors.grey[400],
                height: 0.6,
                decorationColor: Colors.black54,
                decorationStyle: TextDecorationStyle.solid,
                decoration: todos.doneState
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: Sizes.dimens_10,
                fontWeight: FontWeight.w400,
              ),
            ),
            leading: Container(
              margin: EdgeInsets.only(top: 3.5),
              decoration: BoxDecoration(
                border: Border.all(
                  color: todos.doneState
                      ? AppColors.greyColor
                      : AppColors.ellipseColor,
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
                  todo: todos,
                  statusText: todos.doneState
                      ? "task completed"
                      : 'to be completed',
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
