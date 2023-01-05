import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../consts/constants.dart';



class ApiService {
  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer ",
  };
  // Future<List<CategoryModel>?> getUsers() async {
  //   try {
  //     // var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
  //     // var response = await http.get(url);
  //     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
  //     print("fetching $url");
  //     var response = await http.get(url, headers: headers);
  //     if (response.statusCode == 200) {
  //       List<UserModel> _model = userModelFromJson(response.body);
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
  // Future<List<CategoryModel>?> getUsers() async {
  //   try {
  //     var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
  //     var response = await http.get(url);
  //     if (response.statusCode == 200) {
  //       List<CategoryModel> _model = popularapiFromJson(response.body);
  //       return _model;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  }
  // static Future<List<CategoryModel>?> getTodo() async {
  //   var response =
  //   await http.get(Uri.parse('https://raw-tutorial.s3.eu-west-1.amazonaws.com/patients.json'));
  //
  //   if (response.statusCode == 200) {
  //     var data = response.body;
  //     return popularapiFromJson(data);
  //   } else {
  //     return null;
  //   }
  // }
  // Future<CategoryModel> getUsers() async {
  //   var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
  //   print("fetching $url");
  //   var response = await http.get(url, headers: headers);
  //
  //   if (response.statusCode == 200) {
  //     // If the server did return a 200 OK response,
  //     // then parse the JSON.
  //     return CategoryModel.fromJson(jsonDecode(response.body));
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // then throw an exception.
  //     throw Exception('Failed to load album');
  //   }
  // }
// }