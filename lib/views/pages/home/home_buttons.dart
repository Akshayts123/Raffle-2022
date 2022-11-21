

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class homemenu extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   homemenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 100,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: _coffeeController.getHomesList.length,
          itemBuilder: (BuildContext context, int index) =>
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: TextButton(
                        style: ButtonStyle(),
                        onPressed: () {},
                        child: Column(
                          children: [
                            Image.asset(
                              _coffeeController.getHomesList[index].gif??"",
                              width: 40.0,
                              height: 40.0,
                              color: Colors.white,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Text(
                              _coffeeController.getHomesList[index].Name??"",
                              style: GoogleFonts.poppins(
                                  fontSize: 15, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
        ),
      ),
    );
  }
}
