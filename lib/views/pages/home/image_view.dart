
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';


class imageview extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  imageview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child:  Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Deals / Offers",
                    style: GoogleFonts.poppins(
                        fontSize: 19,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(30)),
                    child: Icon(
                      Icons.chevron_right,
                      size: 20,
                    ),
                  ),
                  padding: EdgeInsets.all(0.0),
                  shape: CircleBorder(),
                ),
              ],
            ),
          ),
          Container(
            height: 200,
            padding: EdgeInsets.only(top: 20,bottom: 20),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                margin: EdgeInsets.only(left: 10),
                child:  Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(_coffeeController.getHomesList[index]
                          .banner ??
                          "",
                          fit: BoxFit.cover,
                          height: 200,
                          width: 300),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
