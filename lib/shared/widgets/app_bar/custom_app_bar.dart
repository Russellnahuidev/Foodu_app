import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? titleWidget;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showBack;
  final Color backgroundColor;
  final Color foregroundColor;
  final bool centerTitle;
  final double elevation;
  final VoidCallback? onBack;
  final SystemUiOverlayStyle? overlayStyle;

  const CustomAppBar({
    super.key,
    this.title,
    this.titleWidget,
    this.actions,
    this.leading,
    this.showBack = true,
    this.backgroundColor = AppColors.white,
    this.foregroundColor = AppColors.textPrimary,
    this.centerTitle = true,
    this.elevation = 0,
    this.onBack,
    this.overlayStyle,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: elevation,
      centerTitle: centerTitle,
      systemOverlayStyle:
          overlayStyle ??
          SystemUiOverlayStyle(
            statusBarColor: AppColors.transparent,
            statusBarIconBrightness: backgroundColor == AppColors.white
                ? Brightness.dark
                : Brightness.light,
          ),
      leading:
          leading ??
          (showBack
              ? IconButton(
                  icon: Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: foregroundColor,
                  ),
                  onPressed: onBack ?? () => Navigator.maybePop(context),
                )
              : null),
      automaticallyImplyLeading: showBack,
      title:
          titleWidget ??
          (title != null
              ? Text(
                  title!,
                  style: AppTextStyles.titleMedium.copyWith(
                    color: foregroundColor,
                  ),
                )
              : null),
      actions: actions,
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: Divider(
          height: 1,
          thickness: 1,
          color: elevation == 0 ? AppColors.grey200 : AppColors.transparent,
        ),
      ),
    );
  }
}
