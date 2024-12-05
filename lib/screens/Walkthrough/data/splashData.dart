 
import 'package:flutter/cupertino.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class SplashItem {
  final String title;
  final String description;
  final String? imagePath;
  final String? backgroundImage;
  final descritionColor;
  final titleColor;

  SplashItem(
      {required this.title,
      required this.description,
      this.imagePath,
      this.backgroundImage,
      this.descritionColor = ThemeColors.greyDeep,
      this.titleColor = ThemeColors.orangeDisable});
}
