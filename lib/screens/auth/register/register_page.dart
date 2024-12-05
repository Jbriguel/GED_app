import 'package:another_flushbar/flushbar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/screens/auth/login/login_page.dart';
import 'package:ged_app/widgets/customImageView.dart';

import '../../../../../../widgets/or.dart';
import 'components/register_form.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String route = '/Customer/RegisterPage';
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 10.0),
                    child: CustomImageView(
                      imagePath: Images.logo1,
                      fit: BoxFit.contain,
                      width: 200,
                      height: 100,
                    ),
                  ),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
                    child: AutoSizeText(
                      """Veuillez renseigner les informations pour créer un compte!""",
                      presetFontSizes: const [13, 12],
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      textDirection: TextDirection.ltr,
                      style: const TextStyle(color: ThemeColors.greyDeep),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 5.0, vertical: 5),
                    child: RegisterForm(),
                  ),
                  DefaultButton(
                      paddingV: 10,
                      fontSize: 14,
                      textColor: ThemeColors.white,
                      backColor: ThemeColors.primary,
                      text: "Créer un compte".toUpperCase(),
                      press: () {
                        // Navigator.pushNamed(context, CompletProfilPage.route);
                        Flushbar(
                          backgroundColor: ThemeColors.greyDeep,
                          message:
                              'Impossible de créer un compte pour le moment!',
                          messageColor: ThemeColors.white,
                          duration: const Duration(seconds: 3),
                          icon: const Icon(
                            Icons.error,
                            color: ThemeColors.white,
                          ),
                          flushbarPosition: FlushbarPosition.BOTTOM,
                          flushbarStyle: FlushbarStyle.FLOATING,
                          borderRadius: BorderRadius.circular(10),
                          margin: const EdgeInsets.all(10),
                          forwardAnimationCurve: Curves.decelerate,
                        ).show(context);
                      }),
                  or(),
                  LoginAccount(),
                ]),
          ),
        ),
      ),
    );
  }
}

class LoginAccount extends StatelessWidget {
  const LoginAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: ThemeColors.secondary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8.0)),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          const TextSpan(
            text: "J'ai un compte! ",
            style: TextStyle(
              color: ThemeColors.greyDeep,
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: " Se connecter",
            style: const TextStyle(
              color: ThemeColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LoginPage(),
                  ),
                );
              },
          ),
        ]),
      ),
    );
  }
}
