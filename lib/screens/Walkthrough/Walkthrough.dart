 
import 'package:flutter/material.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'components/content.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'data/splashData.dart';

class Walkthrough extends StatefulWidget {
  const Walkthrough({super.key});
  static String route = '/Customer/walktrough';
  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  int slideIndex = 0;
  late PageController controller;
  final ValueNotifier<int> currentPageNotifier = ValueNotifier<int>(0);
  final int totalPages = 2; // Update the total number of pages

  @override
  void initState() {
    super.initState();
    controller = PageController();
    controller.addListener(() {
      currentPageNotifier.value = controller.page?.round() ?? 0;
    });
  }

  void _onNextPressed() {
    // Changer de page en augmentant le numéro de la page actuelle
    if (slideIndex < totalPages - 1) {
      controller.animateToPage(
        slideIndex + 1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
    } else {
      //Navigation to client page
      print("##### [ to Login page ] ####");
     // Navigator.pushNamed(context, LoginPage.route);
    }
  }

  List<SplashItem> splashData(BuildContext context) {
    List<SplashItem> data = [
      SplashItem(
          title: "Déplacez vous différemment",
          description:
              "Avec ANGATA, profitez d'un transport sûr, confortable et rapide. Découvrez l'excellence à chaque trajet.",
          imagePath: Images.folder,
          titleColor: ThemeColors.black),
      SplashItem(
          title: "ANGATA",
          description:
              "Voyagez en toute sérénité avec nos chauffeurs professionnels. Confort, sécurité et ponctualité sont notre priorité. Faites l’expérience d’un trajet sans souci, à chaque fois",
          backgroundImage: Images.back01,
          descritionColor: ThemeColors.white,
          titleColor: ThemeColors.white),
    ];
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black.withOpacity(0.7), Colors.transparent],
            ),
          ),
          height: double.infinity,
          width: double.infinity,
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: PageView(
              controller: controller,
              onPageChanged: (index) {
                setState(() {
                  slideIndex = index;
                });
              },
              children: splashData(context).asMap().entries.map((entry) {
                final index = entry.key;
                final itemData = entry.value;

                return SplashContent(
                  passer: () {},
                  data: itemData,
                  showButtonPasser: true,
                  bottomWidget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildPageIndicator(
                          inactiveColor: itemData.descritionColor),
                      DefaultButton(
                          fontSize: 15,
                          textColor: ThemeColors.white,
                          backColor: ThemeColors.primary,
                          text: slideIndex < totalPages - 1
                              ? "Suivant".toUpperCase()
                              : "Commencer".toUpperCase(),
                          press: () => _onNextPressed()),
                    ],
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }

  Widget _buildPageIndicator({required Color inactiveColor}) {
    return Container(
      height: 7,
      margin: const EdgeInsets.only(
        top: 36,
        bottom: 27,
      ),
      child: AnimatedSmoothIndicator(
        activeIndex: slideIndex,
        count: totalPages,
        effect: WormEffect(
          spacing: 4.2,
          activeDotColor: ThemeColors.primary,
          dotColor: inactiveColor,
          dotHeight: 8,
          dotWidth: 8,
        ),
      ),
    );
  }
}
