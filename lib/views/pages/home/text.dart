import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/product_controller.dart';

class text extends StatelessWidget {
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  final TodoController productController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          "Category",
          style: TextStyle(color: Colors.black87),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey[100],
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          color: Colors.black87,
          onPressed: () {
            print("Drawer Menu Clicked");
            // _key.currentState.openDrawer();
          },
        ),
        actions: <Widget>[
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    print("Cart Clicked");
                  }),
              Positioned(
                top: 20,
                right: 4,
                child: Container(
                  height: 22,
                  width: 22,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Stack(
            children: [
              IconButton(
                  icon: Icon(
                    Icons.notifications_rounded,
                    size: 30,
                    color: Colors.black87,
                  ),
                  onPressed: () {
                    print("Notifications Clicked");
                  }),
              Positioned(
                top: 20,
                right: 4,
                child: Container(
                  height: 22,
                  width: 22,
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.deepPurple),
                  child: Center(
                    child: Text(
                      "0",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Search for markets or products",
                            prefixIcon: Icon(Icons.search_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            )),
                        onTap: () {
                          print("Search Box Tapped");
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Products",
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87),
                          ),
                          Row(
                            children: [
                              IconButton(
                                  icon: Icon(
                                    Icons.list_rounded,
                                    color: Colors.black87,
                                  ),
                                  onPressed: () {
                                    print("List Clicked");
                                  }),
                              IconButton(
                                  icon: Icon(
                                    Icons.grid_view,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    print("Grid Clicked");
                                  }),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          Expanded(
            child: Obx(() {
              if (productController.isLoading.value)
                return Center(child: CircularProgressIndicator());
              else
                print("---------------------");
              print(productController.productList?.data?.length.toString());
              return ListView.builder(
                itemCount: productController.productList?.data?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [

                      Row(
                        children: [

                          Container(
                            width: 150,
                            height: 100,
                            margin: EdgeInsets.fromLTRB(16, 8, 8, 8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(
                                productController.productList?.data?[index]?.avatar??"",
                                width: 150,
                                height: 100,
                                fit: BoxFit.fill,
                                color: Colors.red,
                                colorBlendMode: BlendMode.color,
                              ),
                            ),
                          ),

                  Container(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    productController.productList?.data?[index]?.firstName??"",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  Text(
                                    productController.productList?.data?[index]?.email??"",
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ))
                        ],
                      ),
                      Container(
                        color: Colors.black12,
                        height: 2,
                      )
                    ],
                  );
                },
              );
            }),
          )
        ],
      ),
    );
  }
}