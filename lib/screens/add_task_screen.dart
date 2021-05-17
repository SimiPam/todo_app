import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/model/todo_list.dart';
import 'package:todo_app/model/todo_model.dart';
import '../colors.dart';
import '../sizes.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  // DateTime _selectedDate = DateTime.now();
  String dateText = "ddmmyy";
  String _timeText = "00:00";
  Color btnTextColor = AppColors.bluegreyColor;
  Color btnDateTextColor = AppColors.bluegreyColor;
  Color btnColor = Colors.transparent;
  Color btnDateColor = Colors.transparent;
  String errorMsg = "";

  Future _pickDate() async {
    DateTime datepick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (datepick != null)
      setState(() {
        btnDateTextColor = AppColors.whiteColor;
        btnDateColor = AppColors.statementColor;
        dateText = DateFormat('dd/MM/yyyy').format(datepick);
      });
  }

  Future _pickTime() async {
    TimeOfDay timePick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timePick != null) {
      setState(() {
        btnTextColor = AppColors.whiteColor;
        btnColor = AppColors.statementColor;
        _timeText = timePick.format(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int maxLenght = (size.height / 2).toInt();
    print(maxLenght);
    // int x = int.parse(maxLenght);
    return Material(
      child: Container(
        color: AppColors.overlayColor,
        padding: EdgeInsets.only(top: 20),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
          ),
          child: Scrollbar(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 42, left: 26, right: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Text(
                        "New Task",
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: Sizes.dimens_18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      autofocus: true,
                      cursorColor: AppColors.statementColor,
                      style: GoogleFonts.poppins(
                        color: AppColors.blackColor,
                        fontSize: Sizes.dimens_25,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: titleController,
                      decoration: InputDecoration(
                        // border: InputBorder.none,
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.statementColor),
                        ),
                        labelText: "Add a title",
                        labelStyle: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: Sizes.dimens_15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    // Text(
                    //   "Pick a deadline",
                    //   style: GoogleFonts.poppins(
                    //     color: AppColors.blackColor,
                    //     fontSize: Sizes.dimens_27,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    // ),

                    Container(
                      padding: EdgeInsets.only(left: 20, right: 10, bottom: 30),
                      margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        // color: AppColors.descriptionColor,
                        color: Colors.grey[100],
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: size.height / 2,
                        ),
                        child: TextField(
                          controller: descController,
                          cursorColor: AppColors.statementColor,
                          maxLines: null,
                          // maxLines: (size.height/4).toString(),
                          style: GoogleFonts.poppins(
                            color: AppColors.blackColor,
                            fontSize: Sizes.dimens_22,
                            fontWeight: FontWeight.w400,
                          ),
                          decoration: InputDecoration(
                            hintText: "Add a description",
                            hintStyle: GoogleFonts.poppins(
                              color: AppColors.bluegreyColor,
                              fontStyle: FontStyle.italic,
                              fontSize: Sizes.dimens_20,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 150.0,
                          height: 50.0,
                          child: OutlinedButton(
                            onPressed: () {
                              _pickDate();
                            },
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.calendar_today_outlined,
                                  color: btnDateTextColor,
                                  // color: Colors.black54,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "$dateText",
                                  style: GoogleFonts.poppins(
                                    color: btnDateTextColor,
                                    fontSize: Sizes.dimens_16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: btnDateColor,
                              side: BorderSide(
                                // color: AppColors.bluegreyColor,
                                color: Colors.black54,
                              ),
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(18),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 125.0,
                          height: 50.0,
                          child: OutlinedButton(
                            onPressed: () {
                              // selectedTodoTime(context);

                              _pickTime();
                            },
                            child: Row(
                              // Replace with a Row for horizontal icon + text
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.access_alarm_outlined,
                                  color: btnTextColor,
                                  // color: Colors.black54,
                                  size: 15,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "$_timeText",
                                  style: GoogleFonts.poppins(
                                      color: btnTextColor,
                                      fontSize: Sizes.dimens_16,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: btnColor,
                              side: BorderSide(
                                // color: AppColors.bluegreyColor,
                                color: Colors.black54,
                              ),
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 34),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          focusColor: Colors.black,
                          child: Text(
                            "close",
                            style: GoogleFonts.poppins(
                              color: Colors.grey[400],
                              fontSize: Sizes.dimens_20,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                        ),
                        Container(
                          width: 106.0,
                          height: 56.0,
                          child: Material(
                            color: AppColors.backgroundColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () {
                                if (titleController.text.isNotEmpty &&
                                    descController.text.isNotEmpty) {
                                  setState(() {
                                    todos.add(TodoModelClass(
                                        title: titleController.text,
                                        description: descController.text,
                                        currentDateTime: DateFormat('EEEE, d')
                                            .format(DateTime.now()),
                                        selectedDate: dateText,
                                        selectedTime: _timeText));
                                  });
                                  Navigator.pop(context);
                                } else {
                                  setState(() {
                                    errorMsg =
                                        "Please check that title and description are filled";
                                  });
                                }
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
                      ],
                    ),
                    SizedBox(height: 24),
                    Center(
                      child: Text(
                        errorMsg,
                        style: GoogleFonts.poppins(
                          color: AppColors.borderColor,
                          fontSize: Sizes.dimens_12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
