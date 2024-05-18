import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'theme.dart';
import 'reviewclass.dart';
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.
class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  final String title;

  @override
  State<ProfilePage> createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  @override
  void initState(){
    super.initState();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(),
    body: Column(children: [
      const SizedBox(height: 20),
      Row( mainAxisAlignment: MainAxisAlignment.center, children: [Container( height: 150, width: 150, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(100)), color: AppColors.green), child: const Icon(Icons.person, size: 100))]),
      const Text("Welcome {Name goes here}", style: TextStyle(color: AppColors.charcoal, fontWeight: FontWeight.bold, fontSize: 35),),
    ],)
  );
}
}