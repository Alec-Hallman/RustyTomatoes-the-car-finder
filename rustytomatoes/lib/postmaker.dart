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
      appBar: AppBar( title: const Text('How has your car experience been?')),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Container(height: 100, width: 100, child: TextField())
      ],),
    );
  }
}


