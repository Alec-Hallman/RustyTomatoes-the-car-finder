import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:rustytomatoes/home.dart';
import 'theme.dart';
import 'reviewclass.dart';
import 'cardetails.dart';
import 'dart:math';
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.
String url = 'https://us-east-2.aws.neurelo.com/rest/user/__one';
Random random = Random();
int userNumber = random.nextInt(90000);
String idNumber = userNumber.toString();
String ID = 'USR' + '$idNumber';
final Map<String, dynamic> filterValues = {
  'number of doors': 0,
  'number of seats': 0,
  'engine size': 0,
  'price': 0,
  'year': 0,
  'make': '',
  'model': '',
  'engine type': '',
  'body type': '',
  'drive train': '',
  'transmission': '',
  'class': '',
  'colour': '',
};

Car carInformation = Car();
var filterOptions = carInformation.information;
  String name = '...';
  bool enterText = true;
  bool hasCar = false;
  bool carStatus = true;
class IntroPage extends StatefulWidget {
  const IntroPage({super.key, required this.title});

  final String title;

  @override
  State<IntroPage> createState() => _IntroState();
}

class _IntroState extends State<IntroPage> {
  @override
  void initState(){
    super.initState();
    print(ID);
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 100,),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(10), // Add padding for spacing
              children: [
                Text('Hey' + ' $name' + ',', style: TextStyle(fontSize: 70, fontWeight: FontWeight.bold)),
                if (enterText)
                  TextField(
                    maxLines: null, // Allow unlimited lines
                    keyboardType: TextInputType.multiline, // Enable multiline input
                    onChanged: (String value) {
                      setState(() {
                        name = value;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter your name here!',
                      border: OutlineInputBorder(), // Add border for visual separation
                    ),
                  ),
                  if(enterText)
                  Container( width: 10, decoration: const BoxDecoration(color: AppColors.green, borderRadius: BorderRadius.all(Radius.circular(20))), child: TextButton(onPressed: (){enterText = false; setState(() {
                  });}, child: const Text('Submit', style: TextStyle(color: AppColors.charcoal),))),
                  if(!enterText && carStatus)
                  Column(children:[
                    SizedBox(height: 20),
                    Text("Do you currently own a car?", style: TextStyle(fontSize: 50)),
                    SizedBox(height: 20),
                    Container(width: 130,decoration: BoxDecoration(color: AppColors.charcoal, borderRadius: BorderRadius.all(Radius.circular(20))), child: TextButton(onPressed: (){hasCar = true; carStatus = false; setState(() {
                      
                    });}, child: Text('Yes I do!', style: TextStyle(color: AppColors.secondaryColor),))),
                    SizedBox(height: 20),
                    Container(width: 130,decoration: BoxDecoration(color: AppColors.charcoal, borderRadius: BorderRadius.all(Radius.circular(20))), child: TextButton(onPressed: (){ carStatus = false; setState(() {  
                    });}, child: Text('Not Yet', style: TextStyle(color: AppColors.secondaryColor),)))
                  ]),
                  if(hasCar)
                  Column(children: [
                    Text('Please enter your car details:', style: TextStyle(fontSize: 20),),
                    SizedBox(
                        height: 400,
                        child: ListView.builder(
                            itemCount: (filterOptions.length),
                            itemBuilder: (context, index) {
                              if (index < 3) {
                                return ListTile(
                                    title: Center(
                                        child: Row(children: [
                                  Text(filterOptions[index]),
                                  DropdownButton<int>(
                                      items: List.generate(10, (index) {
                                        return DropdownMenuItem<int>(
                                            value: index + 1,
                                            child: Text((index + 1).toString()));
                                      }),
                                      value: 1,
                                      onChanged: (int? newValue) {
                                        filterValues[filterOptions[index]] = newValue;
                                      }),
                                ])));
                              } else {
                                return ListTile(
                                    title: Center(
                                        child: Row(children: [
                                  Text(filterOptions[index]),
                                  const Text('   '),
                                  SizedBox(
                                      width: 100,
                                      child: TextField(
                                          decoration: InputDecoration(
                                            hintText: filterOptions[index].toString()),
                                          onSubmitted: (String value) {
                                            filterValues[filterOptions[index]] = value;
                                          })),
                                ])));
                              }
                            })),
                    TextButton(
                        onPressed: () {
                          updateCar();
                          hasCar = false;
                          setState(() {
                            
                          });
                        },
                        child: const Text('Submit'))
                  ]),
                  if(!hasCar && !carStatus)
                  Column(children:[
                    SizedBox(height: 20),
                    Text('Please sign in with your near wallet', style: TextStyle(fontSize: 20)),
                    SizedBox(height: 40),
                    Container( decoration: BoxDecoration(color: AppColors.charcoal, borderRadius: BorderRadius.all(Radius.circular(10))), child: TextButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage(title: 'home', userId: ID, userName: name)));}, child: Text('Sign in with Near', style: TextStyle(color: AppColors.secondaryColor))))

                  ])
              ],
            ),
          ),
        ],
      ),
    );
  }
  void updateCar() {
  carInformation.cardoors = filterValues['number of doors'] as int;
  carInformation.seats = filterValues['number of seats'] as String;
  carInformation.carenginesize = filterValues['engine size'] as int;
  carInformation.carprice = filterValues['price'] as String;
  carInformation.caryear = filterValues['year'] as String;
  carInformation.carMake = filterValues['make'] as String;
  carInformation.carmodel = filterValues['model'] as String;
  carInformation.carenginetype = filterValues['engine type'] as String;
  carInformation.bodytype = filterValues['body type'] as String;
  carInformation.drivetrain = filterValues['drive train'] as String;
  carInformation.cartransmission = filterValues['transmission'] as String;
  carInformation.carclass = filterValues['class'] as String;
  carInformation.carColor = filterValues['colour'] as String;
}
}
