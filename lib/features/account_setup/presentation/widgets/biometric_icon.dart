import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';
import 'package:phosphor_icons/phosphor_icons.dart';

class BiometricIcon extends StatelessWidget {
  final IconData icon;

  const BiometricIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: PhosphorIcon(icon, size: 300, color: AppColors.primary),
      ),
    );
  }
}
