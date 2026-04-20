import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class SocialButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const SocialButton({super.key, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 56,
        width: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grey100),
        ),
        child: Center(child: Image.asset(imagePath, height: 24)),
      ),
    );
  }
}
