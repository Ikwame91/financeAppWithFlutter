import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  const CustomDropDown(
      {super.key,
      required this.items,
      required this.hint,
      required this.onChanged});
  final List<String> items;
  final String hint;
  final Function(String) onChanged;

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String? selectedItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: DropdownButton<String>(
          value: selectedItem,
          onChanged: ((value) {
            setState(() {
              selectedItem = value!;
            });
            widget.onChanged(selectedItem!);
          }),
          items: widget.items
              .map((e) => DropdownMenuItem(
                    value: e,
                    child: Row(
                      children: [
                        Icon(
                          Icons.circle,
                          color: AppColors.bgColor,
                          size: 10,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        ModifiedText(
                          text: e,
                          color: AppColors.black,
                          fontSize: 22,
                        ),
                      ],
                    ),
                  ))
              .toList(),
          selectedItemBuilder: (BuildContext context) => widget.items
              .map(
                (e) => Row(
                  children: [
                    Icon(
                      Icons.circle,
                      color: AppColors.bgColor,
                      size: 10,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ModifiedText(
                      text: e,
                      color: AppColors.black,
                      fontSize: 22,
                    ),
                  ],
                ),
              )
              .toList(),
          hint: ModifiedText(
            text: widget.hint,
            color: AppColors.black,
            fontSize: 22,
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: const SizedBox(),
        ),
      ),
    );
  }
}
