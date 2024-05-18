
import 'package:flutter/material.dart';
import 'theme.dart';
import 'reviews.dart';
import 'cardetails.dart';
import 'reviewclass.dart';

Car carInformation = Car();
var filterOptions = carInformation.information;
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
  void initState() {
    super.initState();
    updateReview();
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
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primaryColor),
            ),
            const SizedBox(height: 40),
            const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                hintText: 'Don\'t know where to start? Try this!',
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 100,
              width: 100,
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
                        color: AppColors.secondaryColor, fontSize: 30),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
              child: Text(
                'Recomended Reviews',
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: AppColors.green),
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: AppColors.green,
                ),
                child: ListView.builder(
                  itemCount: 15,
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
                              Padding(padding: const EdgeInsets.all(8.0),
                              child:Image.network(
                                carReview.imageURL,
                                width: 150,
                                height: 130,
                                fit: BoxFit.cover,
                                
                              ),
                              ),
                              Expanded(
                                  child: Text(
                                carReview.description,
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
                    onPressed: () {},
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(
                            color: AppColors.charcoal,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: const Icon(Icons.add_circle_outline_outlined))),
                TextButton(
                    onPressed: () {},
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

void updateReview() {
  print('review Updated');
  carReview.description =
      'This is the description for the car. I am making it longer to test the scrolling on the preview. It needs to be even longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer';
  carReview.title = 'Lamborghini';
  carReview.imageURL =
      'https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg';
}