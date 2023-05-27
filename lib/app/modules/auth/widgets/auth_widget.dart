import 'package:chat_app/app/constants/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatelessWidget {
  const AuthWidget(
      {super.key,
      required this.width,
      required this.height,
      required this.onPressed,
      this.label,
      this.color});

  final double width;
  final double height;
  final String? label;
  final Color? color;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: width,
          vertical: height,
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Text(
            label!,
            style: AppTextStyle.white25,
          ),
        ),
      ),
    );
  }
}
