import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors.dart';
import '../sizes.dart';

class TaskTile extends StatelessWidget {
  final String taskText;

  TaskTile({this.taskText});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskText,
        style: GoogleFonts.poppins(
          color: AppColors.blackColor,
          fontSize: Sizes.dimens_24,
          fontWeight: FontWeight.w500,
        ),
      ),
      leading: Container(
        margin: EdgeInsets.only(top: 3.5),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.ellipseColor,
            width: Sizes.dimens_4,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Sizes.dimens_15),
          ),
        ),
        width: Sizes.dimens_17,
        height: Sizes.dimens_17,
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
      ),
      // onTap: onPress,
    );
  }
}
