import 'package:flutter/material.dart';
import 'theme.dart';
int index = 5;
class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.title});

  final String title;

  @override
  State<ReviewPage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 15,
        itemBuilder: (context, index) {
          return const ListTile(
            title: Center(child: Text('review')),
          );
        },
      ),
    );
    
    
    
  }
}


