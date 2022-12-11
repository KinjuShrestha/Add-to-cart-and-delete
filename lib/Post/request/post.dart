import 'package:flutter/cupertino.dart';

class Post {
  final String? title, body;
  final int? userId, id;
  // final ImageCache? image;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJSON(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
      //  image: json['image'],
    );
  }
}

// class Post {
//   final String? title, description, jewelery;
//   final int? id, price;
//   final Image? image;

//   Post(
//       {this.id,
//       this.price,
//       this.title,
//       this.image,
//       this.description,
//       this.jewelery});

//   factory Post.fromJSON(Map<String, dynamic> json) {
//     return Post(
//         id: json['id'],
//         price: json['price'],
//         title: json['title'],
//         image: json['image'],
//         description: json['description'],
//         jewelery: json['jewelery']);
//   }
// }
