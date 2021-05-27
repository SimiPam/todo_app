// style: Theme.of(context).textTheme.caption

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/theme/sizes.dart';

import 'colors.dart';

ThemeData myThemeData = ThemeData(
    primaryColor: AppColors.backgroundColor,
    scaffoldBackgroundColor: AppColors.backgroundColor,
    backgroundColor: AppColors.backgroundColor,
    textTheme: TextTheme(
      subtitle1: _subtitle,
      // headline1: _resultHeading,
      headline2: _resultHeading2,
      headline3: _resultHeading3,
      headline4: _resultHeading4,
      caption: _body1,
      bodyText1: _counterNumberHeading,
      bodyText2: _bodytext2,
    ));

TextStyle _subtitle = GoogleFonts.poppins(
  color: AppColors.bluegreyColor,
  fontSize: Sizes.dimens_16,
  fontWeight: FontWeight.w500,
);

TextStyle _counterHeading = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: Sizes.dimens_16,
);

TextStyle _counterNumberHeading = GoogleFonts.poppins(
  color: AppColors.bluegreyColor,
  fontStyle: FontStyle.italic,
  fontSize: Sizes.dimens_20,
  fontWeight: FontWeight.w400,
);

TextStyle _bodytext2 = GoogleFonts.poppins(
  color: AppColors.blackColor,
  fontSize: Sizes.dimens_22,
  fontWeight: FontWeight.w400,
);

TextStyle _resultHeading2 = GoogleFonts.poppins(
  color: Colors.grey[400],
  fontSize: Sizes.dimens_20,
  fontWeight: FontWeight.w400,
);

TextStyle _body1 = GoogleFonts.poppins(
  color: AppColors.blackColor,
  fontSize: Sizes.dimens_15,
  fontWeight: FontWeight.w400,
);

TextStyle _resultHeading3 = GoogleFonts.poppins(
  color: AppColors.borderColor,
  fontSize: Sizes.dimens_12,
  fontWeight: FontWeight.w700,
);

TextStyle _resultHeading4 = GoogleFonts.poppins(
  color: AppColors.whiteColor,
  fontSize: Sizes.dimens_18,
  fontWeight: FontWeight.w500,
);
