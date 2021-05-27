import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/colors.dart';

import '../sizes.dart';

class DateTimeBtn extends StatelessWidget {
  const DateTimeBtn({
    Key key,
    @required this.btnDateTextColor,
    @required this.dateText,
    @required this.btnDateColor,
    this.onPress,
    this.widthPad,
    this.icon,
  }) : super(key: key);

  final Color btnDateTextColor;
  final String dateText;
  final Color btnDateColor;
  final double widthPad;
  final onPress;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthPad,
      height: Sizes.dimens_50,
      child: OutlinedButton(
        onPressed: onPress,
        child: Row(
          // Replace with a Row for horizontal icon + text
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              icon,
              color: btnDateTextColor,
              // color: Colors.black54,
              size: Sizes.dimens_15,
            ),
            SizedBox(
              width: Sizes.dimens_10,
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
            color: AppColors.black54Color,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(18),
            ),
          ),
        ),
      ),
    );
  }
}
