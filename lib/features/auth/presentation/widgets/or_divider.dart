import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';

class OrDivider extends StatelessWidget {
  final String text;

  const OrDivider({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      children: [
        Expanded(
          child: Divider(color: isDark ? AppColors.grey800 : AppColors.grey300),
        ),

        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimensions.space),
          child: Text(text, style: AppTextStyles.bodyMedium),
        ),

        Expanded(
          child: Divider(color: isDark ? AppColors.grey800 : AppColors.grey300),
        ),
      ],
    );
  }
}
