import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobgrocery/Jewlery/Entity/jewlery.dart';

class NetworkService {
  late List<Jewlery> collectionOfJewlery;
  late List<Jewlery> cartData;

  Future getJewlery(String url) async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      //  print(response.statusCode);
      collectionOfJewlery = (data as List).map((json) {
        return Jewlery.fromJSON(json);
      }).toList();

      return collectionOfJewlery;
    } else {
      print("Error, could not fetch the data");
    }
  }

  Future addToCart(int index) async {
    // final response = await http.get(Uri.parse(url));
    // if (response.statusCode == 200) {
    //   final data = jsonDecode(response.body);
    //  print(response.statusCode);
    // cartData = (data as List).map((json) {
    //   return Jewlery.fromJSON(json);
    // }).toList();
    cartData.add(collectionOfJewlery[index]);
    print(cartData);

    return cartData;
    // } else {
    //   print("Error, could not fetch the data");
    // }
  }

  Future<bool> deleteJewlery(int id) async {
    final postUrl = 'https://fakestoreapi.com/products/$id';

    final response = await http.delete(Uri.parse(postUrl));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
