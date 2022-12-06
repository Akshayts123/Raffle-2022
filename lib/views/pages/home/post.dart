import 'dart:async';
import 'dart:convert';

import 'package:draw_idea/views/pages/home/postscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;

import '../../../controller/product_controller.dart';
import '../../../models/model.dart';

class ApiPost extends StatefulWidget {
  const ApiPost({super.key});

  @override
  State<ApiPost> createState() {
    return _ApiPostState();
  }
}

class _ApiPostState extends State<ApiPost> {
  final TodoController productController = Get.put(TodoController());

  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  Future<Album>? _futureAlbum;
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          'LOGIN ',
          style: TextStyle(color: Colors.black),
        ),
        leading: Icon(
          Icons.menu,
          color: Colors.black,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: isLoading
          ? CircularProgressIndicator()
          : Container(
              padding: const EdgeInsets.all(20.0),
              child: buildColumn(),
            ),
    );
  }

  Column buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: emailcontroller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.email),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Email",
              fillColor: Colors.white70),
        ),
        SizedBox(
          height: 20,
        ),
        TextField(
          obscureText: true,
          controller: passwordcontroller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              prefixIcon: Icon(Icons.security),
              filled: true,
              hintStyle: TextStyle(color: Colors.grey[800]),
              hintText: "Password",
              fillColor: Colors.white70),
        ),
        SizedBox(
          height: 50,
        ),
        // isLoading
        //     ? TextButton(
        //         style: TextButton.styleFrom(
        //           padding: EdgeInsets.zero,
        //         ),
        //         onPressed: () {
        //           setState(() {
        //             isLoading = true;
        //           });
        //           login();
        //           setState(() {
        //             isLoading = false;
        //           });
        //         },
        //         child: Container(
        //           width: 350,
        //           height: 55,
        //           decoration: BoxDecoration(
        //             color: Colors.blueAccent,
        //             borderRadius: BorderRadius.circular(10.0),
        //           ),
        //           child: Center(
        //               child: const Text(
        //             'Create Data',
        //             style: TextStyle(color: Colors.white, fontSize: 15),
        //           )),
        //         ),
        //       )
        //     : Center(child: CircularProgressIndicator()),
        TextButton(
          style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
          ),
          onPressed: () {
            setState(() {
              Login();
            });
          },
          child: Container(
            width: 350,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
                child: const Text(
              'Create Data',
              style: TextStyle(color: Colors.white, fontSize: 15),
            )),
          ),
        ),
      ],
    );
  }

  Future<void> Login() async {
    if (emailcontroller.text.isNotEmpty && passwordcontroller.text.isNotEmpty) {
      var response = await http.post(Uri.parse("https://reqres.in/api/login"),
          body: ({
            "email": emailcontroller.text,
            "password": passwordcontroller.text
          }));
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const PostScreen()),
        );
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Login successfull"),
        ));
        Center(child: CircularProgressIndicator());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Invalid Credentials."),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Field not Allowed"),
      ));
    }
  }

  void login() async {
    setState(() {
      isLoading = true;
    });
  }
}
