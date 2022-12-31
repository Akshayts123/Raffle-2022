import 'dart:convert';
import 'dart:developer';

import 'package:draw_idea/views/pages/home/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/model.dart';
import '../models/product_model.dart';

class ApiService  extends GetxService{

  static Future<Products?> fetchProducts() async {
    final String url = "https://aliexpress-datahub.p.rapidapi.com/item_search_2?q=iphone&page=1";

    Map<String, String> qParams = {
      "q": 'iphone', "page": '1'
    };
    Map<String, String> header = {
      'X-RapidAPI-Key': '1b1e5fbf89msha474d0f517a9504p1f3656jsn124c7f7dca5e',
      'X-RapidAPI-Host': 'aliexpress-datahub.p.rapidapi.com'
    };

    Uri uri = Uri.parse(url);
    final finalUri = uri.replace(queryParameters: qParams); //USE THIS

    final response = await http.get(
      finalUri,
      headers: header,
    );
    print("========================================================");
    log(response.body.toString());

    if (response.statusCode == 200) {

      Map<String, dynamic> data = jsonDecode(response.body);
      print("========================================================");
      log(data.toString());
      return Products.fromJson(data);
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
