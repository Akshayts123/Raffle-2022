import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class latestmovies extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  latestmovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    child: Text(
                      "Latest Movies",
                      style: Style.mainheading,
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 0.0,
                    fillColor:Style.whitecolor,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Style.blackcolor),
                          borderRadius: BorderRadius.circular(30)),
                      child: Icon(
                        Icons.chevron_right,
                        size: 20,
                      ),
                    ),
                    padding: EdgeInsets.all(0.0),
                    shape: CircleBorder(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 220,
            child: ListView.builder(
              padding: EdgeInsets.only(top: 15,left: 40),
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: _coffeeController.getHomesList.length,
              itemBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.only(left: 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 30),
                      // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                      alignment: Alignment.topCenter,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            // margin: EdgeInsets.only(top: 30),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: Image.asset(
                                _coffeeController.getHomesList[index].movie ??
                                    "",
                                height: 200,
                                width: 150,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: Row(
                              children: [
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: FractionalTranslation(
                                    translation: Offset(-0.5, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          _coffeeController
                                                  .getHomesList[index].no ??
                                              "",
                                          height: 55,
                                          color:Style.whitecolor,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.topLeft,
                                  child: FractionalTranslation(
                                    translation: Offset(-1.5, 0),
                                    child: Row(
                                      children: [
                                        Image.asset(
                                          _coffeeController
                                                  .getHomesList[index].no2 ??
                                              "",
                                          height: 55,
                                          color:  Style.systemblue,
                                          width: 55,
                                          fit: BoxFit.cover,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
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
