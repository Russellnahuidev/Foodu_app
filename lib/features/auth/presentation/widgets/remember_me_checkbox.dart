import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';

class RememberMeCheckbox extends StatelessWidget {
  final bool value;
  final Function(bool?) onChanged;

  const RememberMeCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
            side: BorderSide(color: AppColors.primary, width: 1),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(4),
            ),
          ),
          Text(AppStrings.rememberMe, style: AppTextStyles.bodyMedium),
        ],
      ),
    );
  }
}
