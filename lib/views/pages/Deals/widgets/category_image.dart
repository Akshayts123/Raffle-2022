import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';

class CategoryImage extends StatelessWidget {
  final index;
  final HomeController coffeeController = Get.find();
   CategoryImage({Key? key,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 100,
      child: Column(
        children: [
          Container(
            child: Image.asset(
              coffeeController.getHomesList[index].category??"",
              width: 80.0,
              height: 80.0,
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
