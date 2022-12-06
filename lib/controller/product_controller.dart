import 'dart:convert';
import 'dart:math';

import 'package:draw_idea/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../services/api_service.dart';

class TodoController extends GetxController {
  Future<Album>? _futureAlbum;
  var isLoading = true.obs;
  Random? productList;
  Album? postList;

  @override
  void onInit() {
    fetchTransactions();
    postTransactions();
    super.onInit();
  }

  void fetchTransactions() async {
    isLoading(true);
    try {
      var Random = await ApiService.fetchProducts();
      if (Random != null) {
        isLoading(false);
        productList = Random;
      }
    } catch (e) {
    } finally {
      isLoading(false);
    }
  }

  void postTransactions() async {
    isLoading(true);
    try {
      var Album = await ApiService.postProducts("title");
      if (Album != null) {
        isLoading(false);
        postList = Album;
      }
    } catch (e) {
    } finally {
      isLoading(false);
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


}
