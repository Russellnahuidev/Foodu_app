import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class AppCountryPhoneField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String initialCountryCode;

  const AppCountryPhoneField({
    super.key,
    required this.controller,
    this.hintText = AppStrings.phoneHint,
    this.initialCountryCode = 'PE',
  });

  @override
  State<AppCountryPhoneField> createState() => _AppCountryPhoneFieldState();
}

class _AppCountryPhoneFieldState extends State<AppCountryPhoneField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return IntlPhoneField(
      controller: widget.controller,
      focusNode: _focusNode,
      initialCountryCode: widget.initialCountryCode,
      style: AppTextStyles.bodyMedium,
      dropdownTextStyle: AppTextStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.hintText,
        counterText: '',
        filled: true,
        fillColor: isDark ? AppColors.grey900 : AppColors.grey50,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          borderSide: BorderSide(
            color: isDark ? AppColors.grey900 : AppColors.grey200,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          borderSide: BorderSide(color: AppColors.primary, width: 1.5),
        ),
      ),
    );
  }
}
