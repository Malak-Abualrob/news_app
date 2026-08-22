import 'package:flutter/material.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/onboarding/onboarding_screen.dart';
import 'package:news_app/features/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor : Color(0XFFC53030),
        scaffoldBackgroundColor: Color(0XFFf5f5f5),
        appBarTheme: AppBarTheme(),
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomeScreen(),
    );
  }
}

