

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class helpsupport extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
   helpsupport({Key? key}) : super(key: key);

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
                    "Help and Support",
                    style: Style.mainheading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: RawMaterialButton(
                    onPressed: () {},
                    constraints: BoxConstraints(),
                    elevation: 0.0,
                    fillColor: Style.whitecolor,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color:Style.blackcolor),
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
            padding: EdgeInsets.only(left: 0, top: 10),
            height: 115,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                 return Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Row(
                      children: [

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            RawMaterialButton(
                              onPressed: () {},
                              constraints: BoxConstraints(),
                              elevation: 2.0,
                              fillColor:Style.whitecolor,
                              child: Container(
                                height:17,
                                width: 27,
                                decoration: BoxDecoration(
                                  color: Style.systemblue,
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Transform.translate(
                                        child: Container(
                                          child: Image.asset(
                                            _coffeeController.getHomesList[index].help ??
                                                "",
                                            width: 20.0,
                                            color: Colors.orange,
                                            height: 20.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        offset: Offset(3.5, -0),
                                      ),
                                    ),
                                  ]
                                  ,),
                              ),
                              padding: EdgeInsets.only(left: 10.0,right: 10,top: 15,bottom: 15),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)
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
                                  _coffeeController
                                      .getHomesList[index].btndesc ??
                                      "",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13, color: Style.blackcolor),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
                return Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RawMaterialButton(
                            onPressed: () {},
                            constraints: BoxConstraints(),
                            elevation: 2.0,
                            fillColor: Style.whitecolor,
                            child: Image.asset(
                              _coffeeController.getHomesList[index].help ??
                                  "",
                              width: 27.0,
                              color: Style.greycolor,
                              height: 27.0,
                              fit: BoxFit.cover,
                            ),
                            padding: EdgeInsets.all(10.0),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
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
                                _coffeeController
                                    .getHomesList[index].btndesc ??
                                    "",
                                style: GoogleFonts.poppins(
                                    fontSize: 13, color: Style.blackcolor),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
            ),
          ),
        ],
      ),
    );
  }
}
