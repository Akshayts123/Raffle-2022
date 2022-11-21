
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/items.dart';

class Dataservices {

  static Future<Dog?> getTodo() async {

    var response =
    await http.get(Uri.parse('https://reqres.in/api/users/2'));
    if (response.statusCode == 200) {


      var data = response.body;
      return jsonDecode(data);

    } else {
      return null;
    }
  }
}