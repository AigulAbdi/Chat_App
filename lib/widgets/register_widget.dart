import 'package:chat_app/app/constants/colors/app_colors.dart';
import 'package:chat_app/app/constants/text_style/app_text_styles.dart';
import 'package:flutter/material.dart';

class RegisterWidget extends StatelessWidget {
  RegisterWidget({
    required this.horizontal,
    required this.vertical,
    required this.title,
    required this.containerColor,
    super.key,
    this.onTap,
  });
  final String title;
  double horizontal;
  double vertical;
  final Color? containerColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: containerColor ?? AppColors.deepBlue),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontal,
            vertical: vertical,
          ),
          child: Text(
            title,
            style: AppTextStyle.white20wbold,
          ),
        ),
      ),
    );
  }
}
