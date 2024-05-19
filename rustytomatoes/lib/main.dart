import 'dart:convert';
import 'package:http/http.dart' as http;
import 'theme.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'Intro.dart';
import 'reviewclass.dart';
bool accountCreated = false;

//This page is responsible for establishing project wide information. For example the theme.

void main() {
  runApp(const MyApp()); //start
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
      home: accountCreated //if this isn't the first time openning the application
        ? const MyHomePage(title: 'home', userId: 'USR00000', userName: '') //jump to the home page
        : const IntroPage(title: 'Create an account')// go into the account creation process
  );
  }

}



