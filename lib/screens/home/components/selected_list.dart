import 'package:flutter/material.dart';
import 'package:ged_app/widgets/input/cutomInput.dart';

class selectedWidget extends StatefulWidget {
  selectedWidget(
      {super.key,
      required this.onSelected,
      required this.dataList,
      this.hintText = "Choisir",
      this.itemSelected});

  void Function(String? value) onSelected;
  ValueNotifier<List<String>> dataList;
  String? hintText;
  String? itemSelected;

  @override
  State<selectedWidget> createState() => _selectedWidgetState();
}

class _selectedWidgetState extends State<selectedWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.dataList,
      builder: (BuildContext context, List<String> list, Widget? child) {
        return Container(
          padding: const EdgeInsets.all(2.0),
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: FormField<String>(
            builder: (FormFieldState<String> state) {
              return InputDecorator(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white10)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.white10)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(color: Colors.white10)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    style: const TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 14,
                        color: Colors.black87,
                        fontFamily: "Poppins"),
                    hint: Text(
                      widget.hintText ?? 'Choisir',
                      style: TextStyle(
                        color: Colors.grey.shade800.withOpacity(0.6),
                      ),
                    ),
                    value: widget.itemSelected,
                    isDense: true,
                    onChanged: (newValue) {
                      widget.itemSelected = newValue;
                      widget.onSelected(newValue);
                      widget.dataList.notifyListeners();
                    },
                    items: list.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontFamily: "Poppins",
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
