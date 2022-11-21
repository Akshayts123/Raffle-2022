

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{
 final TextEditingController textController = TextEditingController();

  @override
  void onInit() {
    textController.clear();
    super.onInit();
  }
}