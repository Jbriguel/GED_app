import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:ged_app/animations/delay_animation.dart';
import 'package:ged_app/components/defaultButton.dart';
import 'package:ged_app/core/provider/user_provider.dart';
import 'package:ged_app/core/themes/theme_colors.dart';
import 'package:ged_app/screens/home/home_screen.dart';
import 'package:ged_app/widgets/input/cutomInput.dart';
import 'package:ged_app/widgets/loading/loading.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;

  bool showPassword = false;
  bool checkValue = false;

  Color colors = const Color(0xffe7123b).withOpacity(0.8);
  final TextEditingController _EmailController = TextEditingController();
  final TextEditingController _PwdController = TextEditingController();

  //-------------------------------------------------------------//
  String message = '';

  bool reload = false;

  void setMessage(String msg) {
    setState(() {
      message = msg;
    });
  }

  void doLogin() async {
    LoadingDialog.show(context, text: "Veuillez patienter...");
    await context.read<UserProvider>().login(email ?? '', password ?? '');
    LoadingDialog.hide(context);

    Navigator.push<void>(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => const HomeScreen(),
      ),
    );
  }

  //-------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return DelayedAnimation(
      delay: 1000,
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //Le Email
                InputTextField(
                    type: "email",
                    text: "Adresse Email",
                    controller: _EmailController,
                    prefixIcon: true),

                const SizedBox(
                  height: 5,
                ), // Le password
                InputTextField(
                    type: "password",
                    text: "Mot de passe ",
                    controller: _PwdController,
                    prefixIcon: true),
                const SizedBox(height: 5),
                DefaultButton(
                    paddingV: 10,
                    fontSize: 14,
                    textColor: ThemeColors.white,
                    backColor: ThemeColors.primary,
                    text: "Se Connecter".toUpperCase(),
                    press: () {
                      if (_formKey.currentState!.validate()) {
                        doLogin();
                      } else {
                        Flushbar(
                          backgroundColor: ThemeColors.greyDeep,
                          message: "Veuillez remplir tous les champs",
                          duration: const Duration(seconds: 4),
                          borderRadius: BorderRadius.circular(10),
                          flushbarPosition: FlushbarPosition.BOTTOM,
                          flushbarStyle: FlushbarStyle.FLOATING,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          icon: const Icon(
                            Icons.error,
                            color: ThemeColors.white,
                          ),
                        ).show(context);
                      }
                      // Navigator.pushNamed(context, CustomerHomePage.route);
                    }),
              ]),
        ),
      ),
    );
  }
}
