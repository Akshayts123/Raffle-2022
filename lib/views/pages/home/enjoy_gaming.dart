

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class enjoygaming extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   enjoygaming({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(left: 20, right: 0, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "enjoy non-stop gaming",
                  style: GoogleFonts.poppins(
                      fontSize: 19,
                      color: Colors.black,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: EdgeInsets.only(right: 15),
                child: Icon(
                  Icons.arrow_circle_right,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 15),
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 9,
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 15),
                              child: Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: _coffeeController.colors[index],
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Positioned(
                              // left: 100,
                              top: -15,
                              bottom: 15,
                              child: Image.asset(
                                _coffeeController.getHomesList[index].game??"",
                                fit: BoxFit.fill,
                              ), // replace your image with Image.assets here
                            ),
                          ],
                        ),
                        Container(
                          child: Text(
                            _coffeeController.getHomesList[index].title??"",
                            style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
