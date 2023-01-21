import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';
import 'new_connet_widget.dart';

class NewConnection extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  NewConnection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Heading(text: "Get a new connection"), more()],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Column(
                  children: [
              Container(
            height: 100,
              child: ListView.builder(
                padding: EdgeInsets.only( top: 0),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (BuildContext context, int index) =>
                NewConnectWidget(img: _coffeeController
                    .getHomesList[index].img ??
                    "", btndesc: _coffeeController
                    .getHomesList[index].btndesc ??
                    "", index: index,)
              ),
            ),

            Container(
                      height: 100,
                      child: ListView.builder(
                        padding: EdgeInsets.only(
                          left: 0,
                        ),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: 2,
                        itemBuilder: (BuildContext context, int index) =>
                            NewConnectWidget(img: _coffeeController
                                .getHomesList[index].img ??
                                "", btndesc: _coffeeController
                                .getHomesList[index].btndesc ??
                                "", index: index,)
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  height: 190,
                  width: 170,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/back.jpg",
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          child: Image.asset(
                            "assets/combo.png",
                            height: 110,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Text(
                            "Portable wifi-free home delivery",
                            style: GoogleFonts.poppins(
                                fontSize: 17,
                                color: Style.whitecolor,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 0,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 15),
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Order now",
                                  style: GoogleFonts.poppins(
                                      fontSize: 15,
                                      color: Style.whitecolor,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                              Icon(
                                Icons.keyboard_double_arrow_right,
                                color: Style.whitecolor,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
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
