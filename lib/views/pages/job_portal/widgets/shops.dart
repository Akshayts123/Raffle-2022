import 'package:draw_idea/views/pages/job_portal/widgets/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../controller/home_controller.dart';
import '../Job_screen_3.dart';

class Shops extends StatelessWidget {
  final HomeController _coffeeController = Get.find();
  Shops({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.all(10),
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
              onTap: () {
                Get.to(JobScreen3(
                  heading: _coffeeController.studio[index],
                ));
              },
              child: TabItem(
                hatric: _coffeeController.getHomesList[index].shop ?? "",
                text1: _coffeeController.studio[index],
                text2: "Innovative ideas",
                text3: "40 Vaccency",
              ));
        },
      ),
    );
  }
}
