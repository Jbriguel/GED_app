import 'package:flutter/material.dart';
import 'package:ged_app/core/themes/theme_colors.dart';

class RechercheBar extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final Function onClear;
  RechercheBar({
    super.key,
    required this.onClear,
    required this.onChanged,
  });
  @override
  State<RechercheBar> createState() => _RechercheBarState();
}

class _RechercheBarState extends State<RechercheBar> {
  final TextEditingController Ctrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Card(
            margin: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            shadowColor: Colors.blueAccent.shade100,
            elevation: 0.2,
            //color: Colors.white,
            child: TextFormField(
              controller: Ctrl,
              onChanged: widget.onChanged,
              onTapOutside: (event) {
                print('onTapOutside');
              },
              textInputAction: TextInputAction.done,
              autofocus: false,
              style: const TextStyle(fontSize: 13, color: Colors.black),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                hintText: "Rechercher ... ",
                hintStyle: const TextStyle(color: Colors.black54),
                filled: true,
                enabled: true,
                fillColor: Colors.white,
                border: myinputborder(),
                enabledBorder: myinputborder(),
                focusedBorder: myfocusborder(),
                errorBorder: myerrorborder(),
                prefixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  iconSize: 20.0,
                  color: Colors.black45,
                  onPressed: () {},
                ),
                suffixIcon: Ctrl.text.trim().isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        iconSize: 20.0,
                        color: Colors.black45,
                        onPressed: () {
                          Ctrl.clear();
                          widget.onChanged("");
                        },
                      )
                    : null,
              ),
            ),
          ),
        ),
        Container(
            height: 45,
            width: 45,
            padding: const EdgeInsets.all(0.1),
            decoration: BoxDecoration(
              color: ThemeColors.primary.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.search, color: ThemeColors.primary)),
      ],
    );
  }

  //----------------------------------------------------///
  OutlineInputBorder myinputborder() {
    //return type is OutlineInputBorder
    return const OutlineInputBorder(
        //Outline border type for TextFeild
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myfocusborder() {
    return const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none);
  }

  OutlineInputBorder myerrorborder() {
    return OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide.none);
  }
}
