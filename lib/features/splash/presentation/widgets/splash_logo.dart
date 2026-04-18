import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 70,
          height: 70,
          errorBuilder: (context, error, stackTrace) {
            return Icon(
              Icons.restaurant,
              size: 70,
              color: Theme.of(context).colorScheme.onSurface,
            );
          },
        ),
      ),
    );
  }
}
