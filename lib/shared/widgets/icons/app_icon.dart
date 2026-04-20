import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/dimensions.dart';

class AppIcon extends StatelessWidget {
  final String path;
  final double size;
  final BoxFit fit;

  const AppIcon({
    super.key,
    required this.path,
    this.size = AppDimensions.iconSize,
    this.fit = BoxFit.contain,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: FittedBox(fit: fit, child: Image.asset(path)),
    );
  }
}
