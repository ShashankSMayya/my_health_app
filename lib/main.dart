import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/screens/home_page.dart';
import 'package:my_health_app/presentation/theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      home: const HomePage(),
    );
  }
}
