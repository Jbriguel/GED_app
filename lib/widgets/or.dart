 
import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class or extends StatelessWidget {
  const or({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: Divider(
              height: 0.8,
              color: ThemeColors.greyDeep.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(" -•- "),
          ),
          Expanded(
            child: Divider(
              height: 0.8,
              color: ThemeColors.greyDeep.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }
}
