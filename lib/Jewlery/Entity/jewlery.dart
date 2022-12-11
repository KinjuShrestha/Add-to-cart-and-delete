class Jewlery {
  final String? title, description, category, image;
  final int? id;
  final double? price;
  final int? quantity;

  Jewlery(
      {this.title,
      this.id,
      this.category,
      this.description,
      this.image,
      this.price,
      this.quantity});

  factory Jewlery.fromJSON(Map<String, dynamic> json) {
    return Jewlery(
        id: json['id'],
        title: json['title'],
        category: json['category'],
        description: json['description'],
        image: json['image'],
        price: json['price']);
  }

//   factory Post.fromJSON(Map<String, dynamic> json) {
//     return Post(
//       id: json['id'],
//       userId: json['userId'],
//       title: json['title'],
//       body: json['body'],
//       //  image: json['image'],
//     );
}
