

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';

class menuslider extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  menuslider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15),
      height: 150,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: _coffeeController.getHomesList.length,
        itemBuilder: (BuildContext context, int index) =>
            Container(
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Image.asset(
                            _coffeeController.getHomesList[index].img??"",
                            width: 35.0,
                            color: Colors.red,
                            height: 35.0,
                            fit: BoxFit.cover,
                          ),
                          style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(1.3),
                            shape: MaterialStateProperty.all(CircleBorder()),
                            padding: MaterialStateProperty.all(EdgeInsets.all(
                                13)),
                            backgroundColor: MaterialStateProperty.all(
                                Colors.white),
                            // <-- Button color
                            overlayColor:
                            MaterialStateProperty.resolveWith<Color?>((states) {
                              if (states.contains(MaterialState.pressed))
                                return Colors.black12;
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 13),
                          width: 85,
                          child: Text(
                            _coffeeController.getHomesList[index].btndesc??"",
                            style: GoogleFonts.poppins(
                                fontSize: 13, color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
      ),
    );
  }
}
