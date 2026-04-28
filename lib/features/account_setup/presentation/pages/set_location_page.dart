import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SetLocationPage extends StatefulWidget {
  const SetLocationPage({super.key});

  @override
  State<SetLocationPage> createState() => _SetLocationPageState();
}

class _SetLocationPageState extends State<SetLocationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Set Your Location',
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
