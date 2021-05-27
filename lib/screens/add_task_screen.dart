import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/constants.dart';
import 'package:todo_app/widgets/dialog_container_widget.dart';
import 'package:todo_app/widgets/filled_button_widget.dart';
import 'package:todo_app/widgets/datetime_button_widget.dart';
import '../colors.dart';
import '../sizes.dart';

class AddTaskScreen extends StatefulWidget {
  final Function addTask;
  final Function errorTask;

  const AddTaskScreen({this.addTask, this.errorTask});
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String dateText = "ddmmyy";
  String _timeText = "00:00";
  Color btnTextColor = AppColors.bluegreyColor;
  Color btnDateTextColor = AppColors.bluegreyColor;
  Color btnColor = Colors.transparent;
  Color btnDateColor = Colors.transparent;
  String errorMsg = "";

  Future _pickDate() async {
    DateTime datePick = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime.now().add(Duration(days: -365)),
        lastDate: new DateTime.now().add(Duration(days: 365)));
    if (datePick != null)
      setState(() {
        btnDateTextColor = AppColors.whiteColor;
        btnDateColor = AppColors.statementColor;
        dateText = DateFormat('dd/MM/yyyy').format(datePick);
      });
  }

  Future<TimeOfDay> _pickTime() async {
    TimeOfDay timePick = await showTimePicker(
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
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: AppColors.blackColor),
                    ),
                  ),
                  SizedBox(
                    height: Sizes.dimens_10,
                  ),
                  TextFormField(
                    autofocus: true,
                    cursorColor: AppColors.statementColor,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: Sizes.dimens_25,
                        ),
                    controller: titleController,
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.statementColor),
                      ),
                      labelText: kLabelText,
                      labelStyle: Theme.of(context).textTheme.caption,
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
                      child: TextField(
                        controller: descController,
                        cursorColor: AppColors.statementColor,
                        maxLines: null,
                        style: Theme.of(context).textTheme.bodyText2,
                        decoration: InputDecoration(
                          hintText: kHintText,
                          hintStyle: Theme.of(context).textTheme.bodyText1,
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
                        child: Text("close",
                            style: Theme.of(context).textTheme.headline2),
                      ),
                      SizedBox(
                        width: Sizes.dimens_40,
                      ),
                      FilledBtn(
                        widthPad: Sizes.dimens_106,
                        btnText: kSaveBtn.toUpperCase(),
                        onPress: () {
                          if (titleController.text.isNotEmpty &&
                              descController.text.isNotEmpty) {
                            widget.addTask(titleController.text,
                                descController.text, dateText, _timeText);
                            // setState(() {
                            //   todos.add(TodoModelClass(
                            //       title: titleController.text,
                            //       description: descController.text,
                            //       currentDateTime: DateFormat('EEEE, d')
                            //           .format(DateTime.now()),
                            //       selectedDate: dateText,
                            //       selectedTime: _timeText));
                            // });

                          } else {
                            widget.errorTask();
                            // setState(() {
                            //   errorMsg = kErrorMsg;
                            // });
                          }
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: Sizes.dimens_24),
                  Center(
                    child: Text(kErrorMsg,
                        style: Theme.of(context).textTheme.headline3),
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
