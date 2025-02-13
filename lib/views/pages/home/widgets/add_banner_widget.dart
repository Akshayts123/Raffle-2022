

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../Deals/widgets/wishlist.dart';

class AddBannerWidget extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  final index;
   AddBannerWidget({Key? key, this.index}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 5),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 180,
                  height: 240,
                  child: Card(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          children: [
                            SizedBox(
                              width: 220,
                              height: 135,
                              child: Image.asset(
                                _coffeeController
                                    .getHomesList[index].offer ??
                                    "",
                                fit: BoxFit.cover,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(0), child: Favourite(),
                            ),
                          ],
                        ),

                        SizedBox(
                          height: 2,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                (index % 2 == 0)? Container(
                                  child: Text(
                                    'Grab 30% OFF',
                                    style: context.theme.textTheme.titleMedium,
                                  ),
                                ):Container(
                                  child: Text(
                                    'Grab 20% OFF',
                                    style: context.theme.textTheme.titleMedium,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    // mainAxisAlignment: MainAxisAlignment.spaceBetwee,
                                    children: [
                                      Container(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFFffd700),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFFffd700),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFFffd700),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFFffd700),
                                        ),
                                      ),
                                      Container(
                                        child: Icon(
                                          Icons.star,
                                          size: 15,
                                          color: Color(0xFFffd700),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      (index % 2 == 0)? Container(
                                          child: Text(
                                            "330 Reviews",
                                            style: Style.grab
                                          )):Container(
                                          child: Text(
                                              "760 Reviews",
                                              style: Style.grab
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 23,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Style.systemblue,
                                          borderRadius:
                                          BorderRadius.circular(3),
                                        ),
                                        child: Icon(
                                          Icons.manage_history_outlined,
                                          size: 17,
                                          color: Style.whitecolor,
                                        ),
                                      ),
                                      Container(
                                        width: 23,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Style.systemblue,
                                          borderRadius:
                                          BorderRadius.circular(3),
                                        ),
                                        child: Icon(
                                          Icons.account_balance_wallet_sharp,
                                          size: 17,
                                          color: Style.whitecolor,
                                        ),
                                      ),
                                      Container(
                                        width: 23,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Style.systemblue,
                                          borderRadius:
                                          BorderRadius.circular(3),
                                        ),
                                        child: Icon(
                                          Icons.mail,
                                          size: 17,
                                          color: Style.whitecolor,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ]),
                        )
                      ],
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 2,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

