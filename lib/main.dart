import 'package:bakingapp/pages/screens/login_screen.dart';
import 'package:bakingapp/pages/screens/onboarding_screen.dart';
import 'package:bakingapp/pages/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       debugShowCheckedModeBanner: false,
       home: SplashScreen(),
    );
  }
}
