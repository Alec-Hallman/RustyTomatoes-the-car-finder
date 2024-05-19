import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'theme.dart';
import 'reviewclass.dart';
//Get a list of review id's from the api
//when iterating for the item list, poke the api to get the description, title, and image url
//Display the information in the widget tree.
Review carReview = Review(id: '');
class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.title});

  final String title;

  @override
  State<ReviewPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReviewPage> {
  @override
  void initState(){
    super.initState();
    updateReview();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return ListTile(
            title: Container(
              width: 350, 
              height: 200, 
              decoration: const BoxDecoration(
                color: AppColors.lightgrey, 
                borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  children:[ Center( child: Text(carReview.title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.primaryColor))), 
                  Row(children: [Image.network(carReview.imageURL, 
                  width: 150, 
                  height: 130, 
                  fit: BoxFit.cover,), 
                  Expanded(child: Text(carReview.description,
                                softWrap: true,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 7,
                                style:const TextStyle(fontSize: 14, color: AppColors.charcoal),
                                textAlign: TextAlign.left,)
                  )
                  ]
                  ),
                  ]
                  )
                )
          );
        },
      ),
    );
    
    
    
  }
}
void updateReview(){
  print('review Updated');
  carReview.description = 'This is the description for the car. I am making it longer to test the scrolling on the preview. It needs to be even longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer longer';
  carReview.title = 'Lamborghini';
  carReview.imageURL = 'https://hips.hearstapps.com/hmg-prod/images/dw-burnett-pcoty22-8260-1671143390.jpg';
}


