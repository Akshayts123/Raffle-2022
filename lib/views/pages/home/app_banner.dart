import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
// import 'package:shimmer/shimmer.dart';

import '../../../controller/home_controller.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class appbanner extends StatelessWidget {
  appbanner({Key? key}) : super(key: key);

  final HomeController _coffeeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return  Shimmer(
            duration: Duration(seconds: 3), //Default value
            interval:
                Duration(seconds: 3), //Default value: Duration(seconds: 0)
            color: Colors.white, //Default value
            colorOpacity: 0, //Default value
            enabled: true, //Default value
            direction: ShimmerDirection.fromLTRB(), //Default Value
            child: Container(
              height: 300,
              child: ListView.builder(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: _coffeeController.getHomesList.length,
                itemBuilder: (BuildContext context, int index) => Container(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: TextButton(
                          style: ButtonStyle(),
                          onPressed: () {},
                          child: Column(
                            children: [
                              RawMaterialButton(
                                onPressed: () {},
                                constraints: BoxConstraints(),
                                elevation: 5.0,
                                fillColor: Colors.white,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    _coffeeController.getHomesList[index].ban ??
                                        "",
                                    width: 280.0,
                                    height: 280.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                padding: EdgeInsets.all(0.0),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ));


  }
}
