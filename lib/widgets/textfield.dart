import 'package:finance_app/utils/colors.dart';
import 'package:flutter/material.dart';

class Textfieldd extends StatelessWidget {
  const Textfieldd({
    super.key,
    required this.focusNode,
    required TextEditingController textEditingController,
    this.text,
    this.keyboardType,
  }) : _textEditingController = textEditingController;

  final FocusNode focusNode;
  final TextEditingController _textEditingController;
  final String? text;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
          keyboardType: keyboardType,
          focusNode: focusNode,
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: text,
            labelStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 22,
            ),
            hintStyle: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 22,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.lightWhite, width: 2),
            ),
            filled: true,
            fillColor: Colors.grey.shade200,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.black, width: 2),
            ),
          )),
    );
  }
}
