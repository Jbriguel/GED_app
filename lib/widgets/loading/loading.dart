import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'dart:math' as math;
import 'fadeCircle.dart';

class LoadingDialog extends StatelessWidget {
  static void show(BuildContext context, {Key? key, required String text}) =>
      showDialog<void>(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (_) => LoadingDialog(
          key: key,
          text: text,
        ),
      ).then((_) => FocusScope.of(context).requestFocus(FocusNode()));

  static void hide(BuildContext context) => Navigator.pop(context);

  LoadingDialog({Key? key, required this.text}) : super(key: key);

  String text;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => true,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FadingCircle(color: ThemeColors.primary),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text(
                  text,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontFamily: 'Aller',
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
