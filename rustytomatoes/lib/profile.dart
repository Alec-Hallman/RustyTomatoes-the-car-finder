import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'theme.dart';
import 'reviewclass.dart';
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.

String name = '{error. Name should go here}';
CarDisplay car = CarDisplay();
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
    updateCar();
  }
  @override
Widget build(BuildContext context) {
  return Scaffold(
          appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Center(
                child: Text(
                  'Profile Page',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20), // Adjust the font size if needed
                ),
              ),
            ),
            Opacity(
              opacity: 0, // Hide this widget but keep its space
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {},
              ),
            ),
          ],
        ),
        centerTitle: true, // This ensures the title is centered within the AppBar
      ),
    body: Column(children: [
      const SizedBox(height: 20),
      Row( mainAxisAlignment: MainAxisAlignment.center, children: [Container( height: 150, width: 150, decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50)), color: AppColors.green), child: const Icon(Icons.person, size: 100))]),
      Text('$name', style: const TextStyle(color: AppColors.charcoal, fontWeight: FontWeight.bold, fontSize: 35),),
      Image.network(car.imageURL, height: 500, width: 600,),
      Text('${car.make}' + ' ${car.model}', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color:AppColors.primaryColor), textAlign: TextAlign.left,),
      Text('Total investment: ' + '\$${car.money}', style: TextStyle(fontSize: 30))
    ],)
  );
}
}

updateCar(){
  car.make = 'Lamborghini';
  car.model = 'Huracan EVO';
  car.money = '600000';
  car.imageURL = 'https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg';
}