import 'package:flutter/material.dart';
import 'package:todo_app/sizes.dart';

import '../colors.dart';

class FilledBtn extends StatelessWidget {
  final VoidCallback onPress;
  final String btnText;
  final double widthPad;

  const FilledBtn({
    this.btnText,
    this.onPress,
    Key key,
    this.widthPad,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widthPad,
      height: Sizes.dimens_56,
      child: Material(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        elevation: Sizes.dimens_5,
        child: MaterialButton(
          onPressed: onPress,
          child: Text(
            btnText,
            style: Theme.of(context).textTheme.headline4,
          ),
        ),
      ),
    );
  }
}
