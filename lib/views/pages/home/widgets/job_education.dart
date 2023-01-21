import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../controller/home_controller.dart';
import '../../../../utils/style.dart';
import '../../../widgets/more/more.dart';
import 'job_child_widget.dart';

class JobEducation extends StatelessWidget {
  const JobEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController _coffeeController = Get.find();
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10, right: 0, bottom: 0),
      height: 480,
      color: context.theme.errorColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Heading(text: "Job & Education"), more()],
          ),
          Container(
            child: Text(
              "source framework by Google for building beautiful",
              style: context.theme.textTheme.titleSmall,
            ),
          ),
          SizedBox(
            height: 0,
          ),
          Container(
            padding: EdgeInsets.only(right: 15, left: 5),
            height: 400,
            child: ListView.builder(
              itemCount: 3,
              // padding: EdgeInsets.only(bottom: 10),
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                 return JobChildWidget(
                    index: index,
                    backimg:
                        _coffeeController.getHomesList[index].backimg ?? "",
                    text: "2 Pizza starting at \$10 each",
                    subtext: "EXPLORE TO OF EATRIES NEARBY",
                    people: _coffeeController.getHomesList[index].people ?? "",
                    bis: _coffeeController.getHomesList[index].bis ?? "",
                  );
                }
                return JobChildWidget(
                  index: index,
                  backimg:
                  _coffeeController.getHomesList[index].backimg ?? "",
                  text: "2 Pizza starting at \$10 each",
                  subtext: "EXPLORE TO OF EATRIES NEARBY",
                  people: _coffeeController.getHomesList[index].people ?? "",
                  bis: _coffeeController.getHomesList[index].bis ?? "",
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
