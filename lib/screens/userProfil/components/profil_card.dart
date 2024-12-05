import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class ProfileInfoCard extends StatelessWidget {
  final String text;
  IconData icon;

  ProfileInfoCard({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
          color: ThemeColors.white,
          surfaceTintColor: ThemeColors.white,
          elevation: 2.0,
          shadowColor: ThemeColors.primary.withOpacity(0.5),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Expanded(child: Icon(icon)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                child: Text(
                  " $text ",
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: ThemeColors.greyDeep,
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
