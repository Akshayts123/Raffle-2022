

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class ShowScrached extends StatelessWidget {
  final index;
  final alreadyAddedIndices;
  final HomeController _coffeeController = Get.find();
  ShowScrached({Key? key, this.index, this.alreadyAddedIndices }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(3.0),
        child: (alreadyAddedIndices.contains(index))
            ? Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(
                //         _coffeeController.getHomesList[index]
                //           .game ?? ""),
                //   fit: BoxFit.cover,
                // ),
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
              ),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "25% upto \$500",
                        style:Style.text20
                      ),
                    ),
                    Container(
                      child: Text(
                        "off on your 1st 5 uber rides",
                        style:Style.text2
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Stack(
                      clipBehavior: Clip.none,
                      children: <Widget>[
                        Container(
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(100.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(100),
                                  child: Image.asset(
                                    _coffeeController
                                        .getHomesList[index].scrach ??
                                        "",
                                    width: 50.0,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          top: -20,
                          right: -10,
                          child: Container(
                            child: Image.asset(
                              "assets/staring.jpg",
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Align(
            //   alignment: Alignment.center,
            //   child: Transform.translate(
            //     offset: Offset(0, 0),
            //     child:isExpired==false ? Redeem(): Expired(),
            //   ),
            // ),
          ],
        )
            : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/yy.png",),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
        ));
  }
}
