import 'theme.dart';
import 'package:flutter/material.dart';
import 'home.dart';

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
      home: const MyHomePage(title: 'Rusty Tomatoes')

  );
  }

}