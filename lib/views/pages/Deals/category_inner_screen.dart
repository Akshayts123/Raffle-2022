
import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:draw_idea/views/pages/Deals/widgets/heading.dart';
import 'package:draw_idea/views/pages/Deals/widgets/wishlist_transparent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class CategoryInnerScreen extends StatelessWidget {
  final HomeController coffeeController = Get.find();

  final index;
  final categorypicture;
   CategoryInnerScreen(
      {Key? key, required this.categorypicture, this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 450,
                height: 400,
                child: Stack(
                  children: [
                    ImageSlideshow(
                      height: 400,
                      indicatorColor: Style.systemblue,
                      onPageChanged: (value) {},
                      autoPlayInterval: 3000,
                      isLoop: true,
                      children: [
                        Container(
                          child: Image.asset(
                            categorypicture,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            coffeeController
                                .getHomesList[index].category ??
                                "",
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          child: Image.asset(
                            categorypicture,
                            width: 80.0,
                            height: 80.0,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10)),
                        margin: EdgeInsets.all(10),
                        child: Favourite2(),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: HeadingInner(text: "Cardigan Lorem Ipsum"),
                        ),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Icon(
                                  Icons.star,
                                  size: 17,
                                  color: Color(0xFFffd700),
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                child: Text("4.5"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Description",
                        style: Style.text7
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style:Style.text21
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 2),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text("Price", style: GoogleFonts.poppins(
                        fontSize: 16,
                        height: 2,
                        color: Style.blackcolor,
                        fontWeight: FontWeight.w500),),
                  ),
                  Container(
                    child: Text("\$300", style: GoogleFonts.poppins(
                        fontSize: 20,
                        height: 1,
                        color: Style.blackcolor,
                        fontWeight: FontWeight.w500),),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all( width: 2,color: Colors.black,),
                      borderRadius: BorderRadius.circular(50)),
                  child: Icon(Icons.add,color: Colors.black,),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Style.systemblue,
                      borderRadius: BorderRadius.circular(10)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text("Buy Now",style: GoogleFonts.poppins(
                        fontSize: 14,
                        height: 2,
                        color: Style.whitecolor,
                        fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
