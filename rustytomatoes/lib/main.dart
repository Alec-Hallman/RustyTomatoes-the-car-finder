import 'theme.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'Intro.dart';

bool accountCreated = false;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
      return MaterialApp(
      title: 'Rusty Tomatoes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          primary: AppColors.primaryColor,
          secondary: AppColors.secondaryColor)
      ),
      home: accountCreated
        ? const MyHomePage(title: 'home')
        : const IntroPage(title: 'Create an account')

  );
  }

}
