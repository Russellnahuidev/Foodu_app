import 'package:flutter/material.dart';
import 'package:foodu_app/app/themes/app_colors.dart';

class OnboardingBackground extends StatelessWidget {
  const OnboardingBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: const [
        _Circle(top: 40, left: 60, size: 60),
        _Circle(top: 120, right: 50, size: 30),
        _Circle(top: 200, left: 30, size: 20),
        _Circle(top: 260, right: 80, size: 40),
        _Circle(top: 320, left: 100, size: 16),
        _Circle(top: 380, right: 40, size: 26),
      ],
    );
  }
}

class _Circle extends StatelessWidget {
  final double? top;
  final double? left;
  final double? right;
  final double size;

  const _Circle({this.top, this.left, this.right, required this.size});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
