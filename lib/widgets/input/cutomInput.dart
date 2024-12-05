import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

class InputTextField extends StatefulWidget {
  String type;
  String text;
  TextEditingController controller;
  bool prefixIcon;
  InputTextField({
    Key? key,
    required this.type,
    required this.text,
    required this.controller,
    required this.prefixIcon,
  }) : super(key: key);
  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputTextField> {
  bool showPassword = false;
  Color colors = darkColor.withOpacity(0.8);

  password() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          cursorColor: blueColor3,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.text,
            labelText: widget.text,
            labelStyle: const TextStyle(
                fontSize: 13.5, fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.shade800.withOpacity(0.6)),
            filled: true,
            fillColor: inputFillColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: mainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            prefixIcon: widget.prefixIcon
                ? _prefixIcon(
                    LineAwesomeIcons.lock_solid,
                  )
                : null,
            prefixIconColor: colors,
            suffixIcon: Padding(
              padding: const EdgeInsetsDirectional.only(end: 12.0),
              child: GestureDetector(
                onTap: () => setState(() {
                  showPassword = !showPassword;
                }),
                child: Icon(
                  showPassword ? Icons.visibility_off : Icons.visibility,
                  color: mainColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return '\u26A0 Champ requis!';
            }
            return null;
          },
        ),
      );

  email() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          cursorColor: blueColor3,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.text,
            labelText: widget.text,
            labelStyle: const TextStyle(
                fontSize: 13.5, fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.shade800.withOpacity(0.6)),
            filled: true,
            fillColor: inputFillColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: mainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            prefixIcon:
                widget.prefixIcon ? _prefixIcon(Icons.alternate_email) : null,
            prefixIconColor: colors,
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Adresse Email requise!';
            } else if (!RegExp(
                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                .hasMatch(text)) {
              return 'Adresse Email incorrecte!';
            } else {
              return null;
            }
          },
        ),
      );

  name() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          cursorColor: blueColor3,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.text,
            labelText: widget.text,
            labelStyle: const TextStyle(
                fontSize: 13.5, fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.shade800.withOpacity(0.6)),
            filled: true,
            fillColor: inputFillColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: mainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            prefixIcon:
                widget.prefixIcon ? _prefixIcon(LineAwesomeIcons.user) : null,
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Nom est requis';
            } else {
              return null;
            }
          },
        ),
      );

  info() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: widget.key,
          controller: widget.controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          cursorColor: blueColor3,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.text,
            labelText: widget.text,
            labelStyle: const TextStyle(
                fontSize: 13.5, fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.shade800.withOpacity(0.6)),
            filled: true,
            fillColor: inputFillColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: mainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            prefixIcon: widget.prefixIcon
                ? _prefixIcon(LineAwesomeIcons.info_circle_solid)
                : null,
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Nom est requis';
            } else {
              return null;
            }
          },
        ),
      );

  phone() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          key: widget.key,
          autovalidateMode: AutovalidateMode.disabled,
          controller: widget.controller,
          style: const TextStyle(fontSize: 13, color: Colors.black87),
          cursorColor: blueColor3,
          autocorrect: true,
          decoration: InputDecoration(
            hintText: widget.text,
            labelText: widget.text,
            labelStyle: const TextStyle(
                fontSize: 13.5, fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: Colors.grey.shade800.withOpacity(0.6)),
            filled: true,
            fillColor: inputFillColor,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: const BorderSide(color: mainColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: inputBorderColor)),
            prefixIcon: widget.prefixIcon
                ? _prefixIcon(LineAwesomeIcons.phone_solid)
                : null,
          ),
          validator: (text) {
            if (text == null || text.isEmpty) {
              return '\u26A0 Numero requis!';
            } else if (text.length < 8) {
              return '\u26A0 Numero incomplet!';
            }
            return null;
          },
        ),
      );

  message() => Container(
        padding: const EdgeInsets.all(2.0),
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: TextFormField(
          maxLengthEnforcement: MaxLengthEnforcement.enforced,
          maxLines: 10,
          minLines: 7,
          maxLength: 500,
          key: widget.key,
          controller: widget.controller,
          style: TextStyle(fontSize: 13, color: darkColor),
          decoration: InputDecoration(
            hintText: widget.text,
            labelStyle:
                const TextStyle(fontFamily: "Aller", color: Colors.black),
            hintStyle: TextStyle(color: darkColor.withOpacity(0.6)),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: darkColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: darkColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(radius),
                borderSide: BorderSide(color: darkColor)),
          ),
          validator: (text) {
            if (text!.isEmpty) {
              return 'Message requis!';
            } else {
              return null;
            }
          },
        ),
      );

  _prefixIcon(IconData iconData) {
    return Container(
      padding: const EdgeInsets.only(top: 13.0, bottom: 13.0),
      margin: const EdgeInsets.only(right: 8.0),
      decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
              bottomRight: Radius.circular(15.0))),
      child: Icon(
        iconData,
        size: 20,
        color: mainColor,
      ),
    );
  }

  //bool nomOk() {}
  bool eightChars = false;
  bool specialChar = false;
  bool upperCaseChar = false;
  bool number = false;
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  void dispose() {
    if (mounted) super.dispose();
    //  widget.controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (widget.type) {
      case "password":
        return password();
      case "nom":
        return name();
      case "email":
        return email();
      case "phone":
        return phone();
      default:
        return info();
    }
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

//##############"
final darkColor = Colors.grey.shade500;

const inputFillColor = Color(0xFFf7f7fb);
Color inputBorderColor = Colors.grey.shade200;

const blueColor3 = ThemeColors.secondary;
const mainColor = ThemeColors.primary;

double radius = 10.0;
