import 'package:flutter/material.dart';
import 'package:mini_projet/shared/styles/theme.dart';
import 'layout/layout_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Themes.lightTheme,
      home: LayoutScreen(),
    );
  }
}
