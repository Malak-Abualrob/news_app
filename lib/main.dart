import 'package:flutter/material.dart';
import 'package:news_app/features/main/main_scrreen.dart';

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
        primaryColor: Color(0XFFC53030),
        scaffoldBackgroundColor: Color(0XFFf5f5f5),
        appBarTheme: AppBarTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MainScreen(),
    );
  }
}
