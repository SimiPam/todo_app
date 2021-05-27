import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/widgets/dialog_container_widget.dart';
import 'package:todo_app/widgets/filled_button_widget.dart';
import 'package:todo_app/widgets/outlined_btn_widget.dart';

import '../colors.dart';
import '../constants.dart';
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
      child: DialogContainer(
        topPad: Sizes.dimens_2,
        cardChild: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  EdgeInsets.only(top: Sizes.dimens_42, left: Sizes.dimens_8),
              padding: EdgeInsets.only(left: Sizes.dimens_11),
              decoration: BoxDecoration(
                border: Border(
                  left: BorderSide(
                      width: Sizes.dimens_6, color: AppColors.borderColor),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: Theme.of(context).textTheme.caption.copyWith(
                          fontSize: Sizes.dimens_25,
                        ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: kDateTitle,
                      style: Theme.of(context).textTheme.caption,
                      children: <TextSpan>[
                        TextSpan(
                            text: todo.currentDateTime,
                            style: Theme.of(context).textTheme.subtitle1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: Sizes.dimens_23,
                  left: Sizes.dimens_25,
                  right: Sizes.dimens_25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(kDescriptionText,
                      style: Theme.of(context).textTheme.caption),
                  Text(
                    statusText,
                    style: Theme.of(context).textTheme.headline3,
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
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(
                        horizontal: Sizes.dimens_26, vertical: Sizes.dimens_7),
                    padding: EdgeInsets.only(
                        left: Sizes.dimens_15,
                        top: Sizes.dimens_5,
                        right: Sizes.dimens_10,
                        bottom: Sizes.dimens_30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: AppColors.greyColor,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor,
                          blurRadius: Sizes.dimens_20, // soften the shadow
                          spreadRadius: Sizes.dimens_1, //extend the shadow
                          offset: Offset(
                            0.0, // Move to right 10  horizontally
                            Sizes.dimens_9, // Move to bottom 10 Vertically
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
                padding: EdgeInsets.only(
                    left: Sizes.dimens_25,
                    right: Sizes.dimens_25,
                    top: Sizes.dimens_12,
                    bottom: Sizes.dimens_14),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilledBtn(
                      widthPad: Sizes.dimens_236,
                      btnText: kSaveBtn.toUpperCase(),
                      onPress: () {
                        Navigator.pop(context);
                      },
                    ),
                    OutlinedBtn(
                      icon: Icon(
                        Icons.edit_outlined,
                        color: AppColors.backgroundColor,
                      ),
                      onPress: () {},
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
