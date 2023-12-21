import 'package:finance_app/utils/colors.dart';
import 'package:finance_app/utils/text.dart';
import 'package:flutter/material.dart';

class SimpleContainer extends StatelessWidget {
  const SimpleContainer({
    super.key,
    this.width,
    this.height,
    this.onTap,
    required this.text,
  });
  final double? width;
  final double? height;
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        alignment: Alignment.center,
        width: width ?? 150,
        height: height ?? 50,
        decoration: BoxDecoration(
          color: AppColors.bgColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {},
          child: BoldText(
            text: text,
            color: Colors.white,
            size: 22,
          ),
        ),
      ),
    );
  }
}
