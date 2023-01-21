
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';

class JobChildWidget extends StatelessWidget {
  final index;
  final backimg;
  final text;
  final subtext;
  final people;
  final bis;
  final HomeController _coffeeController = Get.find();

   JobChildWidget({Key? key,required this.index,required this.backimg,required this.text,required this.subtext,required this.people,required this.bis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 110,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: new DecorationImage(
          fit: BoxFit.cover,
          // colorFilter: new ColorFilter.mode(
          //     Colors.black.withOpacity(0.0), BlendMode.darken),
          image:
          AssetImage(backimg),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  child: Text(
                    text,
                    style:Style.text41,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  // width:210,
                  child: Text(
                    subtext,
                    style: Style.text51,
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: FractionalTranslation(
              translation: Offset(0, 0),
              child: Container(
                child: Image.asset(
                  people,
                  width: 120,
                  height: 140,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 10, top: 10),
            alignment: Alignment.topRight,
            child: Container(
              decoration: BoxDecoration(
                  color: Style.whitecolor,
                  borderRadius: BorderRadius.circular(7)),
              width: 37,
              height: 37,
              child: Center(
                child: Image.asset(
                  bis,
                  width: 33.0,
                  height: 33.0,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
