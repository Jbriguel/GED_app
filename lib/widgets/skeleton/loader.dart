import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomWidget extends StatelessWidget {
  final double width;
  final double height;
  final ShapeBorder shapeBorder;

  const CustomWidget.rectangular(
      {this.width = double.infinity, required this.height})
      : this.shapeBorder = const RoundedRectangleBorder();

  const CustomWidget.circular(
      {this.width = double.infinity,
      required this.height,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) => Shimmer.fromColors(
        baseColor: Colors.grey.shade400.withOpacity(0.5),
        highlightColor: Colors.grey.shade200.withOpacity(0.4),
        period: const Duration(seconds: 3),
        child: Container(
          width: width,
          height: height,
          decoration: ShapeDecoration(
            color: Colors.grey.shade300,
            shape: shapeBorder,
          ),
        ),
      );
}

Widget buildSkeletonLoader_Item(
        BuildContext context, double width, double height) =>
    SizedBox(
      width: width,
      height: height,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: const CustomWidget.rectangular(
              height: 100,
              width: 100,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: const CustomWidget.rectangular(
                    height: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: const CustomWidget.rectangular(
                    height: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ]),
    );
