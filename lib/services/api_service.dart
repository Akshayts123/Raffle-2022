
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/model.dart';

class ApiService {

  static Future<Random?> fetchProducts() async {
    var response =
    await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      Map<String,dynamic> data = jsonDecode(response.body);
      return Random.fromJson(data);
    } else {
      return null;
    }
  }

  // static Future<Random?> Postproducts() async {
  //   var response =
  //   await http.post(Uri.parse('https://reqres.in/api/unknown'),body:{
  //
  //   } );
  //   print(response.body.toString());
  //
  //   if (response.statusCode == 200) {
  //     Map<String,dynamic> data = jsonDecode(response.body);
  //
  //     return Random.fromJson(data);
  //   } else {
  //     return null;
  //   }
  // }
  // Future<Dog> fetchProducts() async {
  //   final response =
  //   await get(Uri.parse('https://reqres.in/api/users/2'));
  //
  //   if (response.statusCode == 200) {
  //     return Dog.fromJson(jsonDecode(response.body));
  //   } else {
  //     throw Exception('Failed to get data');
  //   }
  // }
}
