
import 'package:flutter/material.dart';
import 'theme.dart';
import 'reviews.dart';
import 'cardetails.dart';
import 'reviewclass.dart';
import 'postmaker.dart';
import 'profile.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
Car carInformation = Car();
bool reviewsLoading = true;
var filterOptions = carInformation.information;
List<String> carIds= ['CAR00001', 'CAR00002', 'CAR00003', 'CAR00004', 'CAR00005', 'CAR00006', 'CAR00007'];
List<Review> reviews = [];
String token = 'neurelo_9wKFBp874Z5xFw6ZCfvhXWFzaCnC3LmvI9nv8D0zCYrVmjwCB8DHGjCcpUgR8+3GjFdKRsspI5NSEsGF3O9/fO1N5gop84dimC5dT8YYJtDvXQgJU9lGngGGWqfKcbJ6Scft0mfrZ2O/bpZvnJ3uYraVyqpu6lY4tDBQDErC5TqFpi6gHUIgvwAbmUExtJgj_OpE+iPGWhvU9IB1BNM81v0KVKg8UiYow/3RAolbB7GE=';
final Map<String, dynamic> filterValues = {
  'number of doors': 0,
  'number of seats': 0,
  'price': 0,
  'engine size': 0,
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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState(){
    super.initState();
    getReviews();
  }

  refreshState(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Auto Journey',
              style: TextStyle(
                  fontSize: 55,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            Row( mainAxisAlignment: MainAxisAlignment.center, children: [
              const SizedBox(width: 300, child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                hintText: 'Don\'t know where to start? Try this!',
              ),
            ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 70,
              width: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: AppColors.charcoal,
              ),
              child: SizedBox(
                height: 100,
                width: 150,
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Padding(
                          padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom,
                          ),
                          child: DraggableScrollableSheet(
                            expand: false,
                            builder: (context, scrollController) {
                              return SingleChildScrollView(
                                controller: scrollController,
                                child: const Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: FilterWidget(),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    );
                  },
                  child: const Text(
                    'Filter',
                    style: TextStyle(
                        color: AppColors.secondaryColor, fontSize: 19),
                  ),
                ),
              ),
            ),
            ],),
            
            const SizedBox(
              height: 70,
              child: Text(
                'Recomended Reviews',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.accentColor),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.green,
                ),
                child: ListView.builder(
                  itemCount: reviews.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Container(
                        width: 350,
                        height: 200,
                        decoration: const BoxDecoration(
                            color: AppColors.lightgrey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Column(
                          children: [
                            Center(
                                child: Text(carReview.title,
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.primaryColor))),
                            Row(children: [
                              Expanded(
                                  child: Text(
                                reviews[index].description,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style: const TextStyle(
                                    fontSize: 14, color: AppColors.charcoal),
                                textAlign: TextAlign.left,
                              ))
                            ]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            IconButton(onPressed: refreshState, icon: Icon(Icons.refresh)),
            ButtonBar(
              alignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextButton(
                    onPressed: () {},
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.charcoal,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.home))),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                    builder: (context) => const CreatePage(title: 'make a post')));
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.charcoal,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.add_circle_outline_outlined))),
                TextButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfilePage(title: 'profile')));
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.charcoal,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.person))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
          height: 500,
          child: ListView.builder(

              itemCount: (filterOptions.length),
              itemBuilder: (context, index) {
                if (index < 5) {
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
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ReviewPage(title: 'reviews')));
            updateCar();
          },
          child: const Text('Search'))
    ]);
  }
}

void updateCar() {
  carInformation.carid = filterValues['number of doors'] as int;
  carInformation.userid = filterValues['number of seats'] as int;
  carInformation.carprice = filterValues['price'] as int;
  carInformation.carenginesize = filterValues['engine size'] as int;
  carInformation.caryear = filterValues['year'] as int;
  carInformation.carMake = filterValues['make'] as String;
  carInformation.carmodel = filterValues['model'] as String;
  carInformation.carenginetype = filterValues['engine type'] as String;
  carInformation.bodytype = filterValues['body type'] as String;
  carInformation.drivetrain = filterValues['drive train'] as String;
  carInformation.cartransmission = filterValues['transmission'] as String;
  carInformation.carclass = filterValues['class'] as String;
  carInformation.carColor = filterValues['colour'] as String;
}

void getReviews() async {
  for(int i = 0; i < carIds.length; i++){
  String carid = carIds[i];
  List<String> Reviews = []; 
  final String url = 'https://us-east-2.aws.neurelo.com/rest/review';
  final String queryParams = '?select=%7B%0A++"rev_id"%3A+true%0A%7D&filter=%7B%0A++"car_id"%3A+%7B%0A++++"contains"%3A+"CAR00001"%0A++%7D%0A%7D';
  final String apiKey = 'neurelo_9wKFBp874Z5xFw6ZCfvhXWFzaCnC3LmvI9nv8D0zCYrVmjwCB8DHGjCcpUgR8+3GjFdKRsspI5NSEsGF3O9/fO1N5gop84dimC5dT8YYJtDvXQgJU9lGngGGWqfKcbJ6Scft0mfrZ2O/bpZvnJ3uYraVyqpu6lY4tDBQDErC5TqFpi6gHUIgvwAbmUExtJgj_OpE+iPGWhvU9IB1BNM81v0KVKg8UiYow/3RAolbB7GE=';

  final response = await http.get(
      Uri.parse(url + queryParams),
      headers: {
        'X-API-KEY': apiKey,
        'Content-Type': 'application/json',
      },
  );

   if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);

      if (data.containsKey('data') && data['data'] is List) {
        final List<dynamic> dataList = data['data'];

        for (var item in dataList) {

          if (item is Map<String, dynamic> && item.containsKey('rev_id') && item['rev_id'] != null) {
            Review newReview = Review(id: '');
            newReview.id = item['rev_id'];
            if(!reviews.contains(newReview.id)){
              Review listReview = await getReviewInfo(newReview);
              reviews.add(listReview);
            }
          }
        }
      }

      //print(reviews);
    } else {
      print('Failed to load data for car ID: $carid');
    }
  }
}

getReviewInfo(Review review) async{
  final String url = 'https://us-east-2.aws.neurelo.com/rest/review';
  final String queryParams = '?select=%7B%0A++"rev_review"%3A+true%0A%7D&filter=%7B%0A++"rev_id"%3A+%7B%0A++++"contains"%3A+"${review.id}"%0A++%7D%0A%7D';
  final String apiKey = 'neurelo_9wKFBp874Z5xFw6ZCfvhXWFzaCnC3LmvI9nv8D0zCYrVmjwCB8DHGjCcpUgR8+3GjFdKRsspI5NSEsGF3O9/fO1N5gop84dimC5dT8YYJtDvXQgJU9lGngGGWqfKcbJ6Scft0mfrZ2O/bpZvnJ3uYraVyqpu6lY4tDBQDErC5TqFpi6gHUIgvwAbmUExtJgj_OpE+iPGWhvU9IB1BNM81v0KVKg8UiYow/3RAolbB7GE=';

  final response = await http.get(
      Uri.parse(url + queryParams),
      headers: {
        'X-API-KEY': apiKey,
        'Content-Type': 'application/json',
      },
  );
  if (response.statusCode == 200) {
      //print('good neurello connection');
      String description = '';
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<dynamic> dataList = data['data'];
      //print(dataList);
      for (var item in dataList) {
      if (item is Map<String, dynamic> && item.containsKey('rev_review') && item['rev_review'] != null) {
        description = item['rev_review'];
        //print(description);
      }
    }
      Review returnReview = Review(id: review.id, description: description);
      return returnReview;
  }
}