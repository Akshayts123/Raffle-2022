

import 'dart:convert';

import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart ' as http;
import '../models/register.dart';

class RegisterController extends GetxController{

  var users = <Apipost>[].obs;
  TextEditingController emailtext = TextEditingController();
  TextEditingController passwordtext = TextEditingController();
  String baseurl = "https://reqres.in/api/registe";

  // Login()async {
  //   if (emailtext.text.isNotEmpty && passwordtext.text.isNotEmpty) {
  //     Uri url = Uri.parse("${baseurl}/adduser");
  //     final userdata = Apipost(
  //       email: emailtext.text,
  //       password: passwordtext.text,
  //     );
  //     try {
  //       var res = await http.post(url, body: jsonEncode(userdata.toJson()),
  //           headers: {"content-type": "application/json "});
  //       if (res.statusCode == 201) {
  //         Get.snackbar("post", "successfully");
  //         Get.to(HomeScreen());
  //         print("==========================");
  //         print(res);
  //         Center(child:CircularProgressIndicator());
  //       } else {
  //         Get.snackbar("error", "login failed");
  //       }
  //     } catch (e) {
  //       Get.snackbar("error", "$e");
  //     }
  //   }
  //   else {
  //     Get.snackbar("error", "empty");
  //   }
  // }
  Future<void> Login() async {
    if (emailtext.text.isNotEmpty && passwordtext.text.isNotEmpty) {

      var response = await http.post(Uri.parse("https://reqres.in/api/register"),
          body: ({
            "email": emailtext.text,
            "password": passwordtext.text
          }));

      if (response.statusCode == 200) {
        Get.snackbar("post", "successfully");
        Get.to(HomeScreen());
        // print("============================");
        // print(response);
        Center(child: CircularProgressIndicator());
      } else {
        Get.snackbar("error", "Invalid Credentials.");
      }
    } else {
      Get.snackbar("error", "Invalid Credentials null value ");
    }
  }
}