import 'package:flutter/material.dart';
import 'package:todo_app/theme/sizes.dart';

import '../theme/colors.dart';

class DialogContainer extends StatelessWidget {
  const DialogContainer({
    this.cardChild,
    Key key,
    this.topPad,
  }) : super(key: key);

  final Widget cardChild;
  final double topPad;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.overlayColor,
      padding: EdgeInsets.only(top: topPad),
      child: Container(
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Sizes.dimens_30),
              topRight: Radius.circular(Sizes.dimens_30),
            ),
          ),
          child: cardChild),
    );
  }
}
