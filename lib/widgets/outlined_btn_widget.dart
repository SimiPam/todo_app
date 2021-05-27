import 'package:flutter/material.dart';
import 'package:todo_app/sizes.dart';

import '../colors.dart';

class OutlinedBtn extends StatelessWidget {
  const OutlinedBtn({
    this.icon,
    this.onPress,
    Key key,
  }) : super(key: key);
  final Icon icon;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Sizes.dimens_56,
      height: Sizes.dimens_56,
      child: OutlinedButton(
        onPressed: onPress,
        child: icon,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: AppColors.backgroundColor,
          ),
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
        ),
      ),
    );
  }
}
