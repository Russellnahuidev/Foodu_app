import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/shared/widgets/icons/app_icon.dart';

class SocialLoginButton extends StatelessWidget {
  final String text;
  final String iconPath;
  final VoidCallback onTap;
  final Color? iconColor;
  final double? iconSize;

  const SocialLoginButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onTap,
    this.iconColor,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return InkWell(
      onTap: onTap,

      child: Container(
        height: AppDimensions.buttonHeight,
        width: double.infinity,

        decoration: BoxDecoration(
          color: isDark ? AppColors.grey900 : AppColors.transparent,
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          border: Border.all(
            color: isDark ? AppColors.grey800 : AppColors.grey300,
          ),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon(
              path: iconPath,
              color: iconColor,
              size: iconSize ?? AppDimensions.iconSize,
            ),

            const SizedBox(width: AppDimensions.spaceMD),

            Flexible(
              child: Text(
                text,
                overflow: TextOverflow.ellipsis,
                style: textTheme.bodyMedium?.copyWith(
                  color: isDark ? AppColors.white : AppColors.textPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
