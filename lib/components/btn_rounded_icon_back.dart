 
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class BtnRoundedIconBack extends StatelessWidget {
  final Function? onpress;
  const BtnRoundedIconBack({super.key, required this.onpress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onpress as void Function()?,
      child: Container(
          decoration: BoxDecoration(
              color: ThemeColors.orangeDisable.withOpacity(0.3),
              shape: BoxShape.circle),
          padding: const EdgeInsets.all(10),
          child: const Icon(
            CupertinoIcons.arrow_left,
            color: ThemeColors.orangeBackground,
          )),
    );
  }
}
