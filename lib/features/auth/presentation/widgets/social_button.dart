import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        width: 80,
        decoration: BoxDecoration(
          color: isDark ? AppColors.grey900 : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          border: Border.all(
            color: isDark ? AppColors.grey800 : AppColors.grey300,
          ),
        ),
        child: Center(child: Image.asset(imagePath, height: 24)),
      ),
    );
  }
}
