import 'package:flutter/material.dart';
import 'package:my_health_app/presentation/theme/app_theme.dart';
import 'package:my_health_app/routes/route_generator.dart';
import 'package:my_health_app/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final RouteGenerator _routeGenerator = RouteGenerator();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(context),
      onGenerateRoute: _routeGenerator.generateRoute,
      initialRoute: Routes.home,
    );
  }
}
