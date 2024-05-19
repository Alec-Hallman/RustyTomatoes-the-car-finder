class Review {
  String id;
  String title;
  String description;
  String imageURL;

  Review({
    required this.id,
    this.title = '',
    this.description = '',
    this.imageURL = '',
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['rev_id'],
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      imageURL: json['imageURL'] ?? '',
    );
  }
}
class CarDisplay{
  String imageURL = '';
  String make = ''; //company
  String model = ''; //type
  String id = '';
  String money ='';
}
class People{
  String name = '';
  String id = '';
  String password = '';
}