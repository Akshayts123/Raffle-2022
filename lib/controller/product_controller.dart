import 'dart:math';

import 'package:draw_idea/models/model.dart';
import 'package:get/get.dart';


import '../services/api_service.dart';

class TodoController extends GetxController {
  var isLoading = true.obs;
  Random? productList;


  @override
  void onInit() {
    fetchTransactions();
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
    } catch (e) {} finally {
      isLoading(false);
    }
  }

}