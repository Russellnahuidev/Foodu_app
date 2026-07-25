import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:foodu_app/app/constants/dimensions.dart';

class AppIcon extends StatelessWidget {
  final String path;
  final double size;
  final BoxFit fit;
  final Color? color;

  const AppIcon({
    super.key,
    required this.path,
    this.size = AppDimensions.iconSize,
    this.fit = BoxFit.contain,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final isSvg = path.toLowerCase().endsWith('.svg');

    return SizedBox(
      width: size,
      height: size,
      child: isSvg
          // ignore: deprecated_member_use
          ? SvgPicture.asset(path, fit: fit, color: color)
          : FittedBox(
              fit: fit,
              child: Image.asset(path, fit: fit),
            ),
    );
  }
}
