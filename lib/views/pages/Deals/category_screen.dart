import 'package:draw_idea/views/pages/Deals/widgets/category_image.dart';
import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:draw_idea/views/pages/Deals/widgets/catogory_items.dart';
import 'package:draw_idea/views/pages/Deals/widgets/star.dart';
import 'package:draw_idea/views/pages/Deals/widgets/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';
import '../job_portal/widgets/new_appbar.dart';
import 'category_inner_screen.dart';

class CategoryScreen extends StatelessWidget {
  final categoryimage;
  final String categorytitle;
  CategoryScreen(
      {Key? key, required this.categoryimage, required this.categorytitle})
      : super(key: key);

  final HomeController coffeeController = Get.find();
  var status = 0.obs;
  final _value = "one".obs;
  @override
  Widget build(BuildContext context) {
    List<String> widgetList = ['A', 'B', 'C'];
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 1;
    final double itemWidth = size.width / 0.8;
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Style.systemblue,
      //   leading: IconButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     icon: Icon(Icons.arrow_back),
      //   ),
      //   title: Text(categorytitle),
      // ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            NewAppbar1(categorytitle),
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Heading(
                    text: "All Products",
                  ),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          child: Obx(
                            () => IconButton(
                              icon: status.value == 0
                                  ? Icon(Icons.list)
                                  : Icon(Icons.grid_view),
                              tooltip: 'Open shopping cart',
                              onPressed: () {
                                if (status.value == 0) {
                                  status.value = 1;
                                } else {
                                  status.value = 0;
                                }
                              },
                            ),
                          ),
                        ),
                        Obx(() => DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: _value.value,
                            items: <DropdownMenuItem<String>>[
                              new DropdownMenuItem(
                                child: new Text(
                                  "Filters",
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color: Style.blackcolor,
                                      fontWeight: FontWeight.w600),
                                ),
                                value: 'one',
                              ),
                              new DropdownMenuItem(child: new Text(
                                "Filters1",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Style.blackcolor,
                                    fontWeight: FontWeight.w600),
                              ), ),
                              new DropdownMenuItem(child: new Text(
                                "Filters2",
                                style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Style.blackcolor,
                                    fontWeight: FontWeight.w600),
                              ), ),
                            ],
                            onChanged: (value) {
                             _value.value = value!;
                            },
                          ),
                        ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => Container(
                child: status.value == 0
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          Get.to(CategoryInnerScreen(
                            categorypicture: categoryimage,
                          ));
                        },
                        child: Stack(
                          children: [
                            Card(
                              margin: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    height: 120,
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Container(
                                            child: Image.asset(
                                              categoryimage,
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              child: Text(
                                                "creative professionals.",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 13,
                                                    color: Style.greycolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                            Container(
                                              width: 200,
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text ",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 17,
                                                    color: Style.blackcolor,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                            ),
                                            Star(),
                                            Container(
                                              child: Text(
                                                "\$300",
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    color: Style.blackcolor,
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Favourite(),
                            ),
                          ],
                        ),
                      ),
              ),
            ),
            Obx(
              () => Container(
                child: status.value == 0
                    ? Container(
                        child: GridView.builder(
                          itemCount: 10,
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5,
                                  childAspectRatio: (itemWidth / itemHeight),
                                  crossAxisCount:
                                      (orientation == Orientation.portrait)
                                          ? 2
                                          : 9),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(CategoryInnerScreen(
                                  categorypicture: coffeeController
                                          .getHomesList[index].category ??
                                      "",
                                  index: index,
                                ));
                              },
                              child: Stack(
                                children: [
                                  Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Container(
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 5, vertical: 5),
                                              child: Image.asset(
                                                coffeeController
                                                        .getHomesList[index]
                                                        .category ??
                                                    "",
                                                width: 200.0,
                                                height: 170.0,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.all(10),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text(
                                                      "creative professionals.",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 13,
                                                              color: Style
                                                                  .greycolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: 200,
                                                    child: Text(
                                                      "Lorem Ipsum is simply dummy text ",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 15,
                                                              color: Style
                                                                  .blackcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600),
                                                    ),
                                                  ),
                                                  Star(),
                                                  Container(
                                                    child: Text(
                                                      "\$300",
                                                      style:
                                                          GoogleFonts.poppins(
                                                              fontSize: 14,
                                                              color: Style
                                                                  .blackcolor,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(0),
                                    child: Favourite(),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    : Container(
                        padding: EdgeInsets.all(10),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding:
                                EdgeInsets.only(left: 0, right: 0, bottom: 0),
                            itemCount: 10,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () {
                                  Get.to(CategoryInnerScreen(
                                    categorypicture: coffeeController
                                            .getHomesList[index].category ??
                                        "",
                                    index: index,
                                  ));
                                },
                                child: Stack(
                                  children: [
                                    Card(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.all(10),
                                            height: 120,
                                            child: Row(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: Container(
                                                    child: Image.asset(
                                                      coffeeController
                                                              .getHomesList[
                                                                  index]
                                                              .category ??
                                                          "",
                                                      width: 100.0,
                                                      height: 100.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 15,
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      child: Text(
                                                        "creative professionals.",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 13,
                                                                color: Style
                                                                    .greycolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 200,
                                                      child: Text(
                                                        "Lorem Ipsum is simply dummy text ",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 17,
                                                                color: Style
                                                                    .blackcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                      ),
                                                    ),
                                                    Star(),
                                                    Container(
                                                      child: Text(
                                                        "\$300",
                                                        style:
                                                            GoogleFonts.poppins(
                                                                fontSize: 14,
                                                                color: Style
                                                                    .blackcolor,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: EdgeInsets.all(0),
                                      child: Favourite(),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  NewAppbar1(String heading){
    return   Stack(
      clipBehavior: Clip.none,
      children: <Widget>[
        // Required some widget in between to float AppBar
        Container(
          padding: EdgeInsets.only(top: 35, left: 15, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: (){
                  Get.back();
                },
                child: Container(
                  height: 40,
                  width: 40,

                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.arrow_back_ios,
                        color: Style.whitecolor),
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.circular(3)),
                child: Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: Icon(Icons.more_vert,
                      color: Style.whitecolor),
                ),
              ),
            ],
          ),
          color: Style.systemblue,
          height: 100,
          width: double.infinity,
        ),
        Positioned(
          // To take AppBar Size only
          top: 55.0,
          left: 10.0,
          right: 10.0,
          child: Center(
              child:Text(heading,style: Style.subheading,)
          ),
        )
      ],
    );
  }
}
