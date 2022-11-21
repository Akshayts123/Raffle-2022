
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';

class text extends StatelessWidget {
  final TodoController _controller = Get.put(TodoController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('HomeScreen'),
      ),
      body:
      Obx(() {
        if (_controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return  Column(
              children: [
                ListTile(

                  title: Text(_controller.todoList?.data?.email??""),
                ),

               // Container(
               //    child:Image(
               //      image: NetworkImage(_controller.todoList?.data?.avatar??"",),
               //    ),
               //  ),
              ],
            );
          },
        ));


  }
}