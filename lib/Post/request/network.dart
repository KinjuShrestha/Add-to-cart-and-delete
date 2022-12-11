import 'dart:convert';

import 'package:http/http.dart' as http;
import 'post.dart';

class NetworkService {
  late List<Post> posts;
  final baseUrl = "https://fakestoreapi.com/products/category/";

  Future getPosts(String url) async {
    // final postUrl = "$baseUrl/jewelery";
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //print(response.statusCode);
      posts = (data as List).map((json) {
        return Post.fromJSON(json);
      }).toList();

      //print(posts);
      // _PostStore.fetchPosts
      return posts;
    } else {
      print("Error in URL");
    }
  }
}
