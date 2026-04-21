import 'package:flutter/material.dart';

class AuthHeaderImage extends StatelessWidget {
  const AuthHeaderImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        "assets/images/logo.png",
        width: 200,
        height: 200,
        fit: BoxFit.contain,
      ),
    );
  }
}
