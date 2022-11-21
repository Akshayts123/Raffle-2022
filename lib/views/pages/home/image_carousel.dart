

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class imagecarousel extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  imagecarousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Deals/Offers",
                  style: GoogleFonts.poppins(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  // padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.arrow_circle_right,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  alignment: Alignment(0.0, -4.0),
                  child: CarouselSlider(
                    options: CarouselOptions(
                      autoPlay: true,
                      viewportFraction: 0.9,
                      aspectRatio: 16 / 9,
                    ),
                    items: _coffeeController.imgList
                        .map(
                          (item) =>
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: Image.asset(item,
                                    fit: BoxFit.cover,
                                    height: 150,
                                    width: 1000),
                              ),
                            ),
                          ),
                    )
                        .toList(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
