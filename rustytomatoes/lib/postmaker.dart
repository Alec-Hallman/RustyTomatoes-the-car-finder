import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'theme.dart';
import 'dart:math';
import 'reviewclass.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.

String url = 'https://us-east-2.aws.neurelo.com/rest/review/__one';
Random random = Random();
int reviewNumber = random.nextInt(90000);
String reviewID = 'RSV' + '${reviewNumber.toString()}';
String userPost = '';
String userId = '';
class CreatePage extends StatefulWidget {
  const CreatePage({super.key, required this.title, required this.userId});
  final String userId;
  final String title;
  

  @override
  State<CreatePage> createState() => _CreateState();
}

class _CreateState extends State<CreatePage> {
  @override
  void initState(){
    userId = widget.userId;
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
        const SizedBox(height: 200,),
        Expanded(
          child: ListView(
            padding: EdgeInsets.all(10), // Add padding for spacing
            children: [
              TextField(
                maxLines: null, // Allow unlimited lines
                keyboardType: TextInputType.multiline, // Enable multiline input
                decoration: const InputDecoration(
                  hintText: 'Type your update here!',
                  border: OutlineInputBorder(), // Add border for visual separation
                ),
                onChanged: (String value) {userPost = value;},
              ),
              const SizedBox(height: 100),
              const TextField(
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
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), 
        color: AppColors.green),
        child: TextButton(onPressed: () { Navigator.pop(context); postData(); },
        child:const Text('Submit', style: TextStyle(color: AppColors.charcoal),))),
        const SizedBox(height: 20, child: TextField()),
      ],
    ),
  );
}
Future<void> postData() async{
  try{
    String apiKey = 'neurelo_9wKFBp874Z5xFw6ZCfvhXWFzaCnC3LmvI9nv8D0zCYrVmjwCB8DHGjCcpUgR8+3GjFdKRsspI5NSEsGF3O9/fO1N5gop84dimC5dT8YYJtDvXQgJU9lGngGGWqfKcbJ6Scft0mfrZ2O/bpZvnJ3uYraVyqpu6lY4tDBQDErC5TqFpi6gHUIgvwAbmUExtJgj_OpE+iPGWhvU9IB1BNM81v0KVKg8UiYow/3RAolbB7GE=';
    final Map<String, dynamic> requestBody = {
      'rev_review': '$userPost',
      //'user_id': '$userId',
      'rev_id': '$reviewID',
      'car_id': 'CAR00009'
    };
    final http.Response response = await http.post(
      Uri.parse(url),
      headers: {
        'X-API-KEY': apiKey,
        'content-Type': 'application/json',
      },
      body: jsonEncode(requestBody),
    );
    if (response.statusCode == 201) {
      print('POST request successful');
    } else {
      // print('Failed to make POST request');
      // print('Response status code: ${response.statusCode}');
      // print('Response body: ${response.body}');
    }
    } catch (e) {
    print('Exception occurred while making POST request: $e');
  }
    
  }
}
