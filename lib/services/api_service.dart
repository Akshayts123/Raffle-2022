import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/model.dart';

class ApiService {
  static Future<Random?> fetchProducts() async {
    var response =
        await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    print(response.body.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Random.fromJson(data);
    } else {
      return null;
    }
  }

  static Future<Album?> postProducts(String title) async {
    var response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );
    print(response.body.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return Album.fromJson(data);
    } else {
      return null;
    }
  }

  Future<Album> createAlbum(String title) async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/albums'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'title': title,
      }),
    );

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Album.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
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
