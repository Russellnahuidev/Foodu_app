import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class AppIconButton extends StatelessWidget {
  final Widget icon;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? iconColor;
  final double size;
  final double iconSize;
  final bool hasBorder;

  const AppIconButton({
    super.key,
    required this.icon,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
    this.size = AppDimensions.buttonHeightMD,
    this.iconSize = AppDimensions.iconSizeMD,
    this.hasBorder = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Ink(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey100,
          shape: BoxShape.circle,
          border: hasBorder ? Border.all(color: AppColors.borderLight) : null,
        ),
        child: InkWell(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadiusCircle),
          onTap: onPressed,
          child: Center(
            child: IconTheme(
              data: IconThemeData(size: iconSize, color: iconColor),
              child: icon,
            ),
          ),
        ),
      ),
    );
  }
}
