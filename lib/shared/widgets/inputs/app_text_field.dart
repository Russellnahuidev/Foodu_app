import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:foodu_app/app/themes/text_styles.dart';

class AppTextField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final VoidCallback? onTap;
  final VoidCallback? onSuffixTap;
  final bool readOnly;

  const AppTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.keyboardType = TextInputType.text,
    this.prefixIcon,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.onSuffixTap,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {});
    });
    widget.controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    widget.controller.removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bool isFocused = _focusNode.hasFocus;

    final bool hasText = widget.controller.text.isNotEmpty;

    Color iconColor;

    if (isFocused) {
      iconColor = AppColors.primary;
    } else if (hasText) {
      iconColor = isDark ? Colors.white : Colors.black;
    } else {
      iconColor = isDark ? AppColors.grey600 : AppColors.grey400;
    }

    return TextField(
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      focusNode: _focusNode,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      style: AppTextStyles.bodyMedium,
      decoration: InputDecoration(
        hintText: widget.hintText,

        // Icono izquierda
        prefixIcon: widget.prefixIcon != null
            ? Icon(widget.prefixIcon, color: iconColor)
            : null,

        // Icono derecha
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(widget.suffixIcon, color: iconColor),
                onPressed: widget.onSuffixTap,
              )
            : null,
        filled: true,
        fillColor: isDark ? AppColors.grey900 : AppColors.grey50,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          borderSide: BorderSide(
            color: isDark ? AppColors.grey900 : AppColors.grey200,
          ),
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
