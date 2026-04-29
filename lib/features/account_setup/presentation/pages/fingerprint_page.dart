import 'package:flutter/material.dart';
import 'package:foodu_app/app/constants/strings.dart';
import 'package:go_router/go_router.dart';

class FingerprintPage extends StatefulWidget {
  const FingerprintPage({super.key});

  @override
  State<FingerprintPage> createState() => _FingerprintPageState();
}

class _FingerprintPageState extends State<FingerprintPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          AppStrings.fingerprintTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          onPressed: () => context.pop(),
        ),
      ),
    );
  }
}
