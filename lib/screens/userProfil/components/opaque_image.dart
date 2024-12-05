import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class OpaqueImage extends StatelessWidget {
  final imageUrl;

  const OpaqueImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // Image.asset(
        //   imageUrl,
        //   width: double.maxFinite,
        //   height: double.maxFinite,
        //   fit: BoxFit.fill,
        // ),
        Container(
          // color: ThemeColors.primary.withOpacity(0.85),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            ThemeColors.primary,
            ThemeColors.primary.withOpacity(0.8),
            ThemeColors.secondary
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        ),
      ],
    );
  }
}
