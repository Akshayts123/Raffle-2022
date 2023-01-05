import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/Deals/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/category_controller.dart';
import '../../../controller/home_controller.dart';
import '../home/widgets/bottom_nav_bar.dart';
import '../home/widgets/floating_action.dart';
import 'widgets/catogory_heading.dart';
import 'widgets/catogory_items.dart';
import 'widgets/catogory_search.dart';

class Catogories extends StatelessWidget {
  final CategoryController catogoryController = Get.find();
  final HomeController coffeeController = Get.find();
  Catogories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.systemblue,
        leading: Icon(Icons.menu),
        title: Text("Categories"),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: CategorySearch(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Heading(
                text: "Popular Category",
              ),
            ),
            Container(
              child: GridView.builder(
                itemCount: 6,
                padding: EdgeInsets.all(10),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    crossAxisCount:
                        (orientation == Orientation.portrait) ? 3 : 9),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: (){
                      Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.title[index],));
                    },
                    child: CatogoryItems(
                      title: catogoryController.title[index],
                      image: coffeeController.getHomesList[index].category ?? "",
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Heading(
                text: "All Category",
              ),
            ),
            GestureDetector(
              onTap: (){},
              child: Container(
                child: GridView.builder(
                  itemCount: 10,
                  padding: EdgeInsets.all(10),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      crossAxisCount:
                          (orientation == Orientation.portrait) ? 3 : 9),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.alltitle[index],));
                      },
                      child: CatogoryItems(
                        title: catogoryController.alltitle[index],
                        image: coffeeController.getHomesList[index].category ?? "",
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Bottom_nav(),
    );
  }
}
