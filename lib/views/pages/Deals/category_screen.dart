import 'package:draw_idea/views/pages/Deals/widgets/category_image.dart';
import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:draw_idea/views/pages/Deals/widgets/star.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';
import 'category_inner_screen.dart';

class CategoryScreen extends StatelessWidget {
  final HomeController coffeeController = Get.find();
  final categoryimage;
  final String categorytitle;
   CategoryScreen(
      {Key? key, required this.categoryimage, required this.categorytitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Style.systemblue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(categorytitle),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Heading(text: "All Products",),
                  Container(
                    child: Row(
                      children: [
                        Text("Filters", style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Style.blackcolor,
                            fontWeight: FontWeight.w600),),
                        Icon(Icons.keyboard_arrow_down_sharp)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  return   GestureDetector(
                    onTap: (){
                      Get.to(CategoryInnerScreen(categorypicture: categoryimage, index: index,));
                    },
                    child: Card(margin:EdgeInsets.only(bottom:20),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            height: 120,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child:  Text("creative professionals.", style: GoogleFonts.poppins(
                                          fontSize: 13,
                                          color: Style.greycolor,
                                          fontWeight: FontWeight.w500),),
                                    ),
                                    Container(
                                      width: 200,
                                      child:  Text("Lorem Ipsum is simply dummy text ", style: GoogleFonts.poppins(
                                          fontSize: 17,
                                          color: Style.blackcolor,
                                          fontWeight: FontWeight.w600),),
                                    ),
                                     Star(),
                                    Container(
                                      child:  Text("\$300", style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Style.blackcolor,
                                          fontWeight: FontWeight.w500),),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );

                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
