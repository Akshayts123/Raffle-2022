import 'dart:convert';
import 'dart:math';

import 'package:draw_idea/models/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../models/product_model.dart';
import '../services/api_service.dart';

class TodoController extends GetxController {
  Products? user_model;
  var isDataLoading = false.obs;
  Future<Album>? _futureAlbum;
  var isLoading = true.obs;
  Products? productList;
  Album? postList;

  @override
  void onInit() {
    fetchAlbum();
    getApi();
    // fetchTransactions();
    postTransactions();
    super.onInit();
  }

  getApi() async {
    try{
      isDataLoading(true);
      // http.Response response = await http.get(
      //     Uri.tryParse('http://dummyapi.io/data/v1/user')!,
      //     headers: {'app-id': '6218809df11d1d412af5bac4'}
      // );
      final String url = "http://rapidoo.cignescrm.in/";

      // Map<String, String> qParams = {
      //   "q": 'iphone', "page": '1'
      // };
      Map<String, String> header = {
        'Content-Type': 'application/json; charset=UTF-8',
        "zoneId":"",
        'X-localization':'English',
        'Authorization': 'Bearer '
      };

      Uri uri = Uri.parse(url);
      final finalUri = uri.replace(); //USE THIS

      final response = await http.get(
        finalUri,
        headers: header,
      );
      print("++++++++++++++++++++++++++++++++++++++++");
      print(response.body.toString());
      print("++++++++++++++++++++++++++++++++++++++++");
      print(user_model.toString());
      print("++++++++++++++++++++++++++++++++++++++++");
      print(jsonDecode(response.body).toString());
      if(response.statusCode == 200){
        ///data successfully

        var result = jsonDecode(response.body);

        user_model =  Products.fromJson(result);
      }else{
        ///error
      }
    }catch(e){
      // log('Error while getting data is $e');
      print('Error while getting data is $e');
    }finally{
      isDataLoading(false);
    }
  }
  // void fetchTransactions() async {
  //   isLoading(true);
  //   try {
  //     var Products = await ApiService.fetchProducts();
  //     if (Products != null) {
  //       isLoading(false);
  //       productList = Products;
  //     }
  //   } catch (e) {
  //   } finally {
  //     isLoading(false);
  //   }
  // }
  Future<Products> fetchAlbum() async {
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

    if (response.statusCode == 200) {

      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Products.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
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
