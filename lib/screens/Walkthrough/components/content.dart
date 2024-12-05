import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/widgets/customImageView.dart';

import '../data/splashData.dart';

class SplashContent extends StatelessWidget {
  final void Function()? passer;
  final SplashItem data;
  final bool showButtonPasser;
  final Widget? bottomWidget;
  final Color backgroundColor;

  SplashContent({
    Key? key,
    required this.passer,
    required this.data,
    this.showButtonPasser = false,
    this.bottomWidget,
    this.backgroundColor = ThemeColors.white, // Default background color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    final double height = mediaQueryData.size.height - 50;
    final double width = mediaQueryData.size.width;

    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: data.backgroundImage != null
            ? DecorationImage(
                image: AssetImage(data.backgroundImage!),
                fit: BoxFit.cover,
              )
            : null,
        color: backgroundColor,
      ),
      child: Stack(
        children: [
          data.backgroundImage != null
              ? Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          ThemeColors.black.withOpacity(0.4),
                          ThemeColors.black.withOpacity(0.5),
                          ThemeColors.black.withOpacity(0.6),
                          ThemeColors.black.withOpacity(0.7),
                          ThemeColors.black.withOpacity(0.8),
                        ],
                      ),
                    ),
                    height: height * 0.5,
                    width: width,
                  ),
                )
              : const SizedBox.shrink(),
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  child: data.imagePath != null
                      ? CustomImageView(
                          alignment: Alignment.bottomCenter,
                          imagePath: data.imagePath!,
                          fit: BoxFit.contain,
                          width: MediaQuery.of(context).size.width * 0.85,
                        )
                      : const SizedBox(),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: AutoSizeText(
                          data.title,
                          presetFontSizes: const [40, 35, 32, 20, 15, 13],
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: data.titleColor),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, bottom: 5.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: AutoSizeText(
                            data.description,
                            presetFontSizes: const [14, 13, 12, 11, 10],
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                                fontFamily: "Aller",
                                fontStyle: FontStyle.normal,
                                color: data.descritionColor),
                          ),
                        ),
                      ),
                      if (bottomWidget != null)
                        Align(
                            alignment: Alignment.center, child: bottomWidget!),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ]),
        ],
      ),
    );
  }
}
