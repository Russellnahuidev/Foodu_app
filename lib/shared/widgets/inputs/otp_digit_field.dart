import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class OtpDigitField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final FocusNode? previousFocus;
  final VoidCallback? onChanged;

  final bool obscureText;

  const OtpDigitField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    this.previousFocus,
    this.onChanged,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return SizedBox(
      width: 70,
      height: 80,
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        showCursor: false,
        obscureText: obscureText,
        obscuringCharacter: '●',
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w700,
          fontSize: 24,
        ),

        decoration: InputDecoration(
          counterText: '',
          filled: true,
          fillColor: isDark ? AppColors.grey900 : AppColors.grey100,
          contentPadding: const EdgeInsets.symmetric(vertical: 18),

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLG),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLG),
            borderSide: BorderSide(
              color: isDark ? AppColors.grey800 : AppColors.grey100,
              width: 1.2,
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppDimensions.borderRadiusLG),
            borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
          ),
        ),

        onChanged: (value) {
          if (value.isNotEmpty) {
            nextFocus?.requestFocus();
          }

          if (value.isEmpty) {
            previousFocus?.requestFocus();
          }

          onChanged?.call();
        },
      ),
    );
  }
}
