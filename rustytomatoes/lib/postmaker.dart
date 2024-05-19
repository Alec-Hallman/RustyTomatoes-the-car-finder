import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'theme.dart';
import 'reviewclass.dart';
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.
class CreatePage extends StatefulWidget {
  const CreatePage({super.key, required this.title});

  final String title;

  @override
  State<CreatePage> createState() => _CreateState();
}

class _CreateState extends State<CreatePage> {
  @override
  void initState(){
    super.initState();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Center(child: Text('How has your car experience been?')),
    ),
    body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 400,),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10), // Add padding for spacing
            children: const [
              TextField(
                maxLines: null, // Allow unlimited lines
                keyboardType: TextInputType.multiline, // Enable multiline input
                decoration: InputDecoration(
                  hintText: 'Type your update here!',
                  border: OutlineInputBorder(), // Add border for visual separation
                ),
              ),
              SizedBox(height: 300),
              TextField(
                maxLines: null, // Allow unlimited lines
                keyboardType: TextInputType.multiline, // Enable multiline input
                decoration: InputDecoration(
                  hintText: 'How much did this cost you?',
                  border: OutlineInputBorder(), // Add border for visual separation
                ),
              ),
            ],
          ),
        ),
        Container(width: 100, 
        height: 50, 
        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), 
        color: AppColors.green),
        child: TextButton(onPressed: () { Navigator.pop(context); },
        child:const Text('Submit', style: TextStyle(color: AppColors.charcoal),))),
        const SizedBox(height: 20, child: TextField()),
      ],
    ),
  );
}
}