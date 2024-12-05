import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class ProfileListItem extends StatelessWidget {
  IconData icon;
  String text;
  bool hasNavigation;
  final Function? press;

  ProfileListItem({
    super.key,
    required this.icon,
    required this.text,
    this.press,
    this.hasNavigation = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: press as void Function()?,
      child: Container(
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: ThemeColors.greyDeep.withOpacity(0.05),
        ),
        child: Row(
          children: <Widget>[
            Icon(
              icon,
              size: 25,
              color: ThemeColors.greyDeep,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.greyDeep.withOpacity(0.9),
                ),
              ),
            ),
            // if (hasNavigation)
            //   const Icon(
            //     LineAwesomeIcons.angle_right_solid,
            //     size: 20,
            //   ),
          ],
        ),
      ),
    );
  }
}
