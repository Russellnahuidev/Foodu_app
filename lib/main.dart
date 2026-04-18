import 'package:flutter/material.dart';
import 'package:foodu_app/app/app.dart';
import 'core/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  runApp(const FooduApp());
}
