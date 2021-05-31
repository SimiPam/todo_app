import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database/todo_db.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/screens/tasks_screen.dart';
import 'package:todo_app/utils/constants.dart';
import 'package:todo_app/widgets/dialog_container_widget.dart';
import 'package:todo_app/widgets/filled_button_widget.dart';
import 'package:todo_app/widgets/datetime_button_widget.dart';
import '../theme/colors.dart';
import '../theme/sizes.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTask;
  final Function errorTask;
  final TodoModelClass todo;

  const AddTaskScreen({this.addTask, this.errorTask, this.todo});
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  // TextEditingController titleController = TextEditingController();
  // TextEditingController descController = TextEditingController();

  String dateText = "ddmmyy";
  String _timeText = "00:00";
  Color btnTextColor = AppColors.bluegreyColor;
  Color btnDateTextColor = AppColors.bluegreyColor;
  Color btnColor = Colors.transparent;
  Color btnDateColor = Colors.transparent;
  String errorMsg = "";
  String title = "";
  String description = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.todo != null) {
      title = widget.todo.title;
      description = widget.todo.description;
    }
  }

  DateTime datePick;
  TimeOfDay timePick;

  Future _pickDate() async {
    datePick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: 0)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (datePick != null)
      setState(() {
        btnDateTextColor = AppColors.whiteColor;
        btnDateColor = AppColors.statementColor;
        dateText = DateFormat('dd/MM/yyyy').format(datePick);
      });
  }

  Future<TimeOfDay> _pickTime() async {
    timePick = await showTimePicker(
        context: context, initialTime: new TimeOfDay.now());
    if (timePick != null) {
      setState(() {
        btnTextColor = AppColors.whiteColor;
        btnColor = AppColors.statementColor;
        _timeText = timePick.format(context);
      });
    }
    // return timePick;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Material(
      child: DialogContainer(
        topPad: Sizes.dimens_20,
        cardChild: Scrollbar(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(
                  top: Sizes.dimens_42,
                  left: Sizes.dimens_26,
                  right: Sizes.dimens_25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      kTasktitle,
                      style: GoogleFonts.poppins(
                          fontSize: Sizes.dimens_18,
                          fontWeight: FontWeight.w500,
                          color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.dimens_10,
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: AppColors.statementColor,
                    style: GoogleFonts.poppins(
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.dimens_25,
                    ),
                    initialValue: title,
                    // controller: titleController,
                    onChanged: (tit) {
                      setState(() {
                        title = tit;
                      });
                    },
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.statementColor),
                      ),
                      labelText: kLabelText,
                      labelStyle: GoogleFonts.poppins(
                        color: AppColors.blackColor,
                        fontSize: Sizes.dimens_15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  SizedBox(height: Sizes.dimens_24),
                  Container(
                    padding: EdgeInsets.only(
                        left: Sizes.dimens_20,
                        right: Sizes.dimens_10,
                        bottom: Sizes.dimens_30),
                    margin: EdgeInsets.only(top: 0),
                    decoration: BoxDecoration(
                      // color: AppColors.descriptionColor,
                      color: AppColors.greyColor,
                      borderRadius: new BorderRadius.circular(18.0),
                    ),
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: size.height / Sizes.dimens_2,
                      ),
                      child: TextFormField(
                        initialValue: description,
                        // controller: descController,
                        onChanged: (desc) {
                          setState(() {
                            description = desc;
                          });
                        },
                        cursorColor: AppColors.statementColor,
                        maxLines: null,
                        style: GoogleFonts.poppins(
                          color: AppColors.blackColor,
                          fontSize: Sizes.dimens_22,
                          fontWeight: FontWeight.w400,
                        ),
                        decoration: InputDecoration(
                          hintText: kHintText,
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
                  SizedBox(height: Sizes.dimens_24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      DateTimeBtn(
                          widthPad: Sizes.dimens_150,
                          onPress: () {
                            _pickDate();
                          },
                          btnDateTextColor: btnDateTextColor,
                          dateText: dateText,
                          icon: Icons.calendar_today_outlined,
                          btnDateColor: btnDateColor),
                      SizedBox(
                        height: Sizes.dimens_10,
                      ),
                      DateTimeBtn(
                          widthPad: Sizes.dimens_125,
                          onPress: () {
                            _pickTime();
                          },
                          btnDateTextColor: btnTextColor,
                          dateText: _timeText,
                          btnDateColor: btnColor,
                          icon: Icons.access_alarm_outlined),
                    ],
                  ),
                  SizedBox(height: Sizes.dimens_34),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        focusColor: AppColors.blackColor,
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
                        width: Sizes.dimens_40,
                      ),
                      FilledBtn(
                        widthPad: Sizes.dimens_106,
                        btnText: kSaveBtn.toUpperCase(),
                        onPress: () async {
                          if (title.isNotEmpty && description.isNotEmpty) {
                            if (widget.todo != null) {
                              final updatedTask = widget.todo.copy(
                                title: title,
                                description: description,
                              );

                              await TodoDatabase.instance.update(updatedTask);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => TasksScreen()),
                              );
                            } else {
                              widget.addTask(
                                title,
                                description,
                              );
                            }
                          } else {
                            setState(() {
                              errorMsg =
                                  "Please check that title and description are filled";
                            });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.dimens_24),
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
    );
  }
}
