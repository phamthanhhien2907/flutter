import 'package:colen/widget/custom_text.dart';
import 'package:flutter/material.dart';
// định nghĩa button
class SubmitButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final VoidCallback onTap;
  final Color boxShadowColor;
  final Border? border;
  const SubmitButton(
      {super.key,
      this.textColor = const Color(0xFF0C9359),
      required this.text,
      this.backgroundColor = Colors.white,
      required this.onTap, this.boxShadowColor = Colors.transparent, this.border});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height:  52,
        decoration: BoxDecoration(
            border: border,
          borderRadius: BorderRadius.circular( 4),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: boxShadowColor,
              blurRadius: 24,
              offset: const Offset(0, 8),
              spreadRadius: 0,
            )
          ],
        ),
        child: Center(
            child: CustomText(
          text: text,
          color: textColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        )),
      ),
    );
  }
}
