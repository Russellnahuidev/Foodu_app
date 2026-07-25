import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/shared/widgets/icons/app_icon.dart';

class SocialButton extends StatelessWidget {
  final String iconPath;
  final VoidCallback onTap;
  final Color? iconColor;

  const SocialButton({
    super.key,
    required this.iconPath,
    required this.onTap,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
      child: Container(
        height: 56,
        width: 80,
        decoration: BoxDecoration(
          color: isDark ? AppColors.grey900 : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          border: Border.all(
            color: isDark
                ? AppColors.grey800
                : AppColors.grey300.withValues(alpha: 0.5),
            width: 1.0,
          ),
        ),
        child: Center(
          child: AppIcon(
            path: iconPath,
            size: AppDimensions.iconSize,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
