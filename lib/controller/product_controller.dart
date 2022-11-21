
import 'package:get/get.dart';

import '../models/items.dart';
import '../services/api_service.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  // var todoList = <Dog>[].obs;
   Dog? todoList;

  @override
  void onInit() {
    fetchfinaltodo();
    super.onInit();
  }

  void fetchfinaltodo() async {
    isLoading.value =true;
    //try {
      Dog? todos = await Dataservices.getTodo();
      print("===========tofos");
      print(todos);
      if (todos != null) {
        todoList = todos;
        print("--------------------");
        print(todoList);
        print("--------------------");
      }
    //} finally {
      isLoading.value = false;
    //}
  }
}