import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.indigo,
        scaffoldBackgroundColor: Colors.indigo.shade50,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.indigo),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.indigo,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: InputBorder.none,
          fillColor: Colors.white,
          filled: true,
        ),
      );
}
