import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/themes/constants.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/widgets/bottomSheet_cardContent.dart';
import 'package:ged_app/widgets/customImageView.dart';

class NewRequestDetails_PopUp extends StatefulWidget {
  NewRequestDetails_PopUp({Key? key, required this.accepter}) : super(key: key);
  VoidCallback accepter;
  @override
  State<StatefulWidget> createState() => NewRequestDetails_PopUpState();
}

class NewRequestDetails_PopUpState extends State<NewRequestDetails_PopUp>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  Color Color3 = const Color.fromARGB(255, 18, 40, 70);

  //-------------------------------------------------------------//
  TextStyle style = const TextStyle(fontFamily: 'Aller');

//##############################################//

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 800), vsync: this);
    scaleAnimation = CurvedAnimation(
        parent: controller, curve: Curves.easeInOutCubicEmphasized);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final mediaQueryData = MediaQuery.of(context);
    return MediaQuery(
      data: MediaQuery.of(context)
          .copyWith(textScaler: const TextScaler.linear(1)),
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: ScaleTransition(
            scale: scaleAnimation,
            child: OrientationBuilder(builder: (context, orientation) {
              return Stack(children: [
                Container(
                  width: MediaQuery.of(context).size.width < 400
                      ? MediaQuery.of(context).size.width * 0.9
                      : 380,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(5.0),
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        side: BorderSide(
                            color: ThemeColors.primary.withOpacity(0.8),
                            width: 1.5),
                        borderRadius: BorderRadius.circular(10.0)),
                    shadows: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.8),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                CustomImageView(
                                  imagePath: Images.logo1,
                                  width: 50,
                                  fit: BoxFit.contain,
                                  margin:
                                      const EdgeInsets.symmetric(horizontal: 5),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color:
                                              ThemeColors.primary.withOpacity(0.2),
                                          width: 1.0),
                                      color: ThemeColors.primary,
                                      borderRadius: BorderRadius.circular(5.0)),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 2),
                                  child: RichText(
                                    textAlign: TextAlign.center,
                                    text: const TextSpan(children: [
                                      TextSpan(
                                        text: " Nouveau ",
                                        style: TextStyle(
                                          color: ThemeColors.white,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ]),
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      '1500',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: ThemeColors.greyDeep
                                            .withOpacity(0.9),
                                      ),
                                    ),
                                    const Text(
                                      ' Fcfa',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          color: ThemeColors.greyDeep),
                                    ),
                                  ]),
                            ),
                            //--------------------------------//
                            Row(
                              children: [
                                SizedBox(
                                  width: 10,
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Text("•"),
                                      Expanded(
                                        child: VerticalDivider(
                                          color: ThemeColors.greyDeep
                                              .withOpacity(0.8),
                                          width: 1.2,
                                          thickness: 1.5,
                                        ),
                                      ),
                                      const Text("•"),
                                    ],
                                  ),
                                ),
                                Expanded(
                                    child: SizedBox(
                                  height: 120,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      ...[
                                        title(text: "à 1min (2Km)"),
                                        subTitle(text: 'Position du client'),
                                      ],
                                      Spacer(),
                                      ...[
                                        title(text: "trajet : 10min (6km)"),
                                        subTitle(
                                            text:
                                                'Adresse destination du client'),
                                      ]
                                    ],
                                  ),
                                ))
                              ],
                            ),
                            DefaultButton(
                                paddingV: 10,
                                fontSize: 14,
                                textColor: ThemeColors.white,
                                backColor: ThemeColors.primary,
                                text: "Accepter".toUpperCase(),
                                press: () {
                                  widget.accepter();

                                  Navigator.of(context).pop();
                                  CardContentBottomSheet.show(context,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 5),
                                              child: AutoSizeText(
                                                "Abdoul Karim",
                                                presetFontSizes: const [
                                                  15,
                                                  14,
                                                  13,
                                                  12
                                                ],
                                                maxLines: 2,
                                                textAlign: TextAlign.start,
                                                textDirection:
                                                    TextDirection.ltr,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: ThemeColors.greyDeep
                                                      .withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 2,
                                                      horizontal: 5),
                                              child: Text(
                                                "+223 77889944",
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w400,
                                                  color: ThemeColors.greyDeep
                                                      .withOpacity(0.9),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                            Text(
                                              " à 1min (2km)",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 13,
                                                  color: ThemeColors.greyDeep,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(
                                              "Prix Trajet : 5000 Fcfa",
                                              textAlign: TextAlign.left,
                                              style: const TextStyle(
                                                  fontSize: 15,
                                                  color: ThemeColors.greyDeep,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            DefaultButton(
                                              backColor: Colors.white,
                                              text: '📞 Contacter',
                                              elevation: 1.0,
                                              textColor: ThemeColors.primary,
                                              fontSize: 15,
                                              height: 40,
                                              paddingV: 5,
                                              press: () {},
                                            ),
                                            DefaultButton(
                                              backColor: ThemeColors.primary,
                                              text:
                                                  'Lancer Trajet'.toUpperCase(),
                                              elevation: 1.0,
                                              textColor: Colors.white,
                                              fontSize: 15,
                                              paddingV: 5,
                                              height: 40,
                                              press: () {},
                                            )
                                          ],
                                        ),
                                      ),
                                      fit: BoxFit.contain,
                                      setCircle: false,
                                      image: Images.user);
                                }),

                            //--------------------------------//
                            //--------------------------------//
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                // --------------------------//

                Positioned(
                  top: 10,
                  right: 10,
                  child: GestureDetector(
                    onTap: (() => Navigator.of(context).pop()),
                    child: Icon(
                      Icons.close,
                      color: Color3,
                      size: 20,
                    ),
                  ),
                )
                // ----------------------------//
              ]);
            }),
          ),
        ),
      ),
    );
  }

  title({required String text}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: ThemeColors.greyDeep.withOpacity(0.9),
            ),
          ),
        ),
      );

  subTitle({required String text}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.normal,
              color: ThemeColors.greyDeep.withOpacity(0.9),
            ),
          ),
        ),
      );

  subTitle2({required String text, bool toBold = false}) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            textAlign: TextAlign.left,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: Colors.black,
                fontWeight: toBold ? FontWeight.w500 : FontWeight.normal),
          ),
        ),
      );

  content(
          {required String index,
          required String titre,
          required String contenu}) =>
      Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 2,
          horizontal: 10,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: AutoSizeText.rich(
            TextSpan(text: '$index. ', children: [
              TextSpan(
                text: "$titre : ",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: contenu,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, color: Colors.black),
              ),
            ]),
            textAlign: TextAlign.left,
            style: const TextStyle(color: Colors.black, fontSize: 13),
            minFontSize: 12,
          ),
        ),
      );
}
