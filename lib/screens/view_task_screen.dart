import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo_model.dart';

import '../colors.dart';
import '../sizes.dart';

class ViewTaskScreen extends StatelessWidget {
  final TodoModelClass todo;
  final String statusText;
  ViewTaskScreen({
    @required this.todo,
    this.statusText,
  });
  @override
  Widget build(BuildContext context) {
    // final todo = ModalRoute.of(context).settings.arguments as TodoModelClass;
    return Material(
      child: Container(
        color: AppColors.overlayColor,
        padding: EdgeInsets.only(top: 2),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 42, left: 8),
                padding: EdgeInsets.only(left: 11),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(width: 6.0, color: AppColors.borderColor),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      todo.title,
                      style: GoogleFonts.poppins(
                        color: AppColors.blackColor,
                        fontSize: Sizes.dimens_25,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        text: 'Date: ',
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: Sizes.dimens_15,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: todo.currentDateTime,
                            style: GoogleFonts.poppins(
                              color: AppColors.bluegreyColor,
                              fontSize: Sizes.dimens_16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 23, left: 25, right: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Description",
                      style: GoogleFonts.poppins(
                        color: AppColors.blackColor,
                        fontSize: Sizes.dimens_15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      statusText,
                      style: GoogleFonts.poppins(
                        color: AppColors.borderColor,
                        fontSize: Sizes.dimens_12,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Scrollbar(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Text(
                        todo.description,
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: Sizes.dimens_22,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 26, vertical: 7),
                      // padding: EdgeInsets.all(9),
                      padding: EdgeInsets.only(
                          left: 15, top: 5, right: 10, bottom: 30),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        // color: Colors.white,
                        color: Colors.grey[100],
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: Colors.black.withOpacity(0.1),
                        //       offset: Offset(0, 9),
                        //       blurRadius: 20,
                        //       spreadRadius: 1)
                        // ]
                        boxShadow: [
                          //background color of box
                          BoxShadow(
                            color: Colors.grey[100],
                            blurRadius: 20.0, // soften the shadow
                            spreadRadius: 1.0, //extend the shadow
                            offset: Offset(
                              0.0, // Move to right 10  horizontally
                              9.0, // Move to bottom 10 Vertically
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 25, right: 25, top: 12, bottom: 14),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 236.0,
                        height: 56.0,
                        child: Material(
                          color: AppColors.backgroundColor,
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          elevation: 2.0,
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Save".toUpperCase(),
                              style: GoogleFonts.poppins(
                                color: AppColors.whiteColor,
                                fontSize: Sizes.dimens_18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 56.0,
                        height: 56.0,
                        child: OutlinedButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.edit_outlined,
                            color: AppColors.backgroundColor,
                          ),
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.backgroundColor,
                            ),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
