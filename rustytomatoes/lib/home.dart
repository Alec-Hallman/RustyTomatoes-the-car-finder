import 'package:flutter/material.dart';
import 'theme.dart';
import 'reviews.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(children: [
          const SizedBox(height:160),
          Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.accentColor),child: SizedBox( height:150, width:300, child: TextButton(onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context) => const ReviewPage(title: 'reviews')));}, child: Text('Reviews', style: TextStyle(color: AppColors.charcoal)),))),
          const SizedBox(height: 20),
          Container(decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: AppColors.accentColor),child: SizedBox( height:150, width:300, child: TextButton(onPressed: () {print('hello');}, child: Text('Create', style: TextStyle(color: AppColors.charcoal)),))),

        ],),
      ),
    );
  }
}




