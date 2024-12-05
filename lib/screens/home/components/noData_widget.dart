import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/widgets/customImageView.dart';
import 'package:provider/provider.dart';

class noDataWidget extends StatelessWidget {
  noDataWidget({super.key, required this.text, this.onRefresh});

  String text;
  Function? onRefresh;

  void loadData(BuildContext context) async {
    onRefresh?.call();
    // await context.read<MusicProvider>().fetchArtistsWithDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomImageView(
          imagePath: Images.cat01,
          fit: BoxFit.contain,
          height: 120,
          width: 120,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: "Aller",
                color: ThemeColors.greyDeep,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
      Ink(
        decoration: const ShapeDecoration(
          shape: CircleBorder(),
          color: ThemeColors.greyDeep,
        ),
        child: IconButton(
          icon: const Icon(
            CupertinoIcons.refresh,
          ),
          iconSize: 30,
          color: Colors.white,
          onPressed: () {
            loadData(context);
          },
        ),
      ),
    ]);
  }
}

class noDataWidgetEasy extends StatelessWidget {
  noDataWidgetEasy({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomImageView(
          imagePath: Images.cat01,
          fit: BoxFit.contain,
          height: 100,
          width: 100,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontFamily: "Aller",
                color: ThemeColors.greyDeep,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
        ),
      ),
    ]);
  }
}
