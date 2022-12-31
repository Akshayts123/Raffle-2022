
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../../controller/product_controller.dart';

class data extends StatelessWidget {
  final TodoController productController = Get.put(TodoController());

   data({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => productController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(child: _builScreen())),
    );
  }
  Widget _builScreen(){
    print("/*/*/*//*/*/*/*/*/*/*/*/*/*//*/*//");
    print( "${productController.user_model?.result?.resultList?.length.toString()}" );
    return  ListView.builder(
        itemCount: productController.user_model?.result?.resultList?.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  padding: const EdgeInsets.only(left: 20),
                  height: 80,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 35,
                        backgroundImage: NetworkImage(productController.user_model?.result?.resultList?[index].item?.image??""),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            productController.user_model?.result?.resultList?[index].item?.title??"",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 18),
                          ),
                          Text(
                              productController.user_model?.result?.resultList?[index].item?.type??"",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                          Text(
                              productController.user_model?.result?.resultList?[index].item?.itemId??"",
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 18)),
                        ],
                      ),
                    ],
                  )),
              const SizedBox(
                height: 10,
              )
            ],
          );
        });
  }
}
