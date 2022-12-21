import 'package:draw_idea/models/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:scratcher/widgets.dart';

import '../../../controller/home_controller.dart';
import '../../../models/language_model.dart';

class SecondPage extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  final Homes courcemodel;
  final LanguageModel courcecolor;
  SecondPage({Key? key, required this.courcemodel, required this.courcecolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
                itemCount: 1,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => ClipPath(
                  clipper: CurveClipper(),
                  child: Container(
                    color: courcecolor.courcecolor,
                    height: 200.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 60;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
