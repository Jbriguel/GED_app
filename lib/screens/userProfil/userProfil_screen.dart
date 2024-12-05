import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/screens/userProfil/components/profil_card.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../core/themes/theme_colors.dart';
import 'components/opaque_image.dart';
import 'components/profil_bigCard.dart';
import 'components/profil_item.dart';
import 'components/radial_progress.dart';
import 'components/rounded_image.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 430,
              width: double.infinity,
              child: Stack(children: <Widget>[
                SizedBox(
                  height: 370,
                  width: double.infinity,
                  child: Stack(
                    children: <Widget>[
                      const OpaqueImage(
                        imageUrl: Images.back01,
                      ),
                      SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 5.0),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        icon: Container(
                                            decoration: BoxDecoration(
                                                color: ThemeColors.primary
                                                    .withOpacity(0.1),
                                                shape: BoxShape.circle),
                                            padding: const EdgeInsets.all(8),
                                            child: const Icon(
                                              CupertinoIcons.arrow_left,
                                              color: ThemeColors.white,
                                              size: 22,
                                            )),
                                      ),
                                      const Text(
                                        "Mon Profil",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                            fontFamily: "Aller",
                                            color: ThemeColors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SizedBox.square(
                                      dimension: 150,
                                      child: RadialProgress(
                                        width: 4,
                                        goalCompleted: 0.9,
                                        child: RoundedImage(
                                          imagePath: Images.user,
                                          size: Size.fromWidth(80.0),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 5, horizontal: 5),
                                      child: Text(
                                        "Nom de l'utilisateur",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors.white
                                              .withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2, horizontal: 5),
                                      child: Text(
                                        "user@gmail.com",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w400,
                                          color: ThemeColors.white
                                              .withOpacity(0.9),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 350,
                  left: 16,
                  right: 16,
                  child: Container(
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        ProfileInfoCard(
                            text: "15 Documents",
                            icon: Icons.bookmark_border_rounded),
                        const SizedBox(
                          width: 10,
                        ),
                        ProfileInfoCard(
                            text: "8Go", icon: Icons.storage_outlined),
                        const SizedBox(
                          width: 10,
                        ),
                        ProfileInfoCard(text: "5 favoris", icon: Icons.star),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            ProfileListItem(
                text: "Mes informations",
                icon: LineAwesomeIcons.user,
                hasNavigation: true,
                press: () {}),
            ProfileListItem(
                text: "Mes Documents",
                icon: LineAwesomeIcons.book_reader_solid,
                hasNavigation: true,
                press: () {}),
            ProfileListItem(
                text: "Mes Favoris",
                icon: LineAwesomeIcons.star,
                hasNavigation: true,
                press: () {}),
            ProfileListItem(
                text: "Se Deconnecter",
                icon: LineAwesomeIcons.power_off_solid,
                hasNavigation: true,
                press: () {}),
          ],
        ),
      ),
    );
  }
}
