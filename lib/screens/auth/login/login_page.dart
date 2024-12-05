import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/core/themes/theme_images.dart';
import 'package:ged_app/screens/auth/register/register_page.dart';
import 'package:ged_app/widgets/customImageView.dart';

import '../../../../../../widgets/or.dart';
import 'components/login_form.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String route = '/Customer/loginPage';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                  child: AutoSizeText(
                    """Veuillez renseigner les informations pour vous connecter!""",
                    presetFontSizes: const [13, 12],
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    textDirection: TextDirection.ltr,
                    style: const TextStyle(color: ThemeColors.greyDeep),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
                  child: LoginForm(),
                ),
                or(),
                creerAccount(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class creerAccount extends StatelessWidget {
  const creerAccount({
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
            text: "Je n'ai pas de compte! ",
            style: TextStyle(
              color: ThemeColors.greyDeep,
              fontSize: 13,
            ),
          ),
          TextSpan(
            text: " Créer un compte",
            style: const TextStyle(
              color: ThemeColors.primary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushReplacement<void, void>(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const RegisterPage(),
                  ),
                );
              },
          ),
        ]),
      ),
    );
  }
}
