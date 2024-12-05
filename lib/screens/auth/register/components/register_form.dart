import 'package:flutter/material.dart';
import 'package:ged_app/animations/delay_animation.dart';
import 'package:ged_app/widgets/input/cutomInput.dart';

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  bool remember = false;

  bool showPassword = false;
  bool checkValue = false;

  Color colors = const Color(0xffe7123b).withOpacity(0.8);
  final TextEditingController _NameController = TextEditingController();
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
                ),
                InputTextField(
                    type: "nom",
                    text: "Nom Complet",
                    controller: _NameController,
                    prefixIcon: true),

                const SizedBox(
                  height: 5,
                ),
                // Le password
                InputTextField(
                    type: "password",
                    text: "Mot de passe ",
                    controller: _PwdController,
                    prefixIcon: true),
                const SizedBox(
                  height: 5,
                ),

                // InputTextField(
                //     type: "phone",
                //     text: "Telephone",
                //     controller: _EmailController,
                //     prefixIcon: true),
              ]),
        ),
      ),
    );
  }
}
