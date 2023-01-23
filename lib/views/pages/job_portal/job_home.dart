import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:draw_idea/controller/home_controller.dart';
import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/Deals/widgets/wishlist.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/appbar.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/designation.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/shops.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/tab_item.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/wishlist.dart';
import 'package:draw_idea/views/widgets/more/more.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../Deals/widgets/catogory_heading.dart';
import 'Job_screen_3.dart';
import 'job_screen_2.dart';
import 'widgets/job_head_slider.dart';

class JobHome extends HookWidget {
  JobHome({Key? key}) : super(key: key);
  final HomeController _coffeeController = Get.find();
  @override
  Widget build(BuildContext context) {
    _appBar(height) => Appbar( text:"JOB PORTAL", height: height,);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(AppBar().preferredSize.height),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 120,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.all(10),
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                physics: BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) => Container(
                  height: 70,
                  width: 270,
                  margin: EdgeInsets.only(right: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        "assets/graph1.png",
                      ),
                      fit: BoxFit.cover,
                    ),
                    color: HomeController.cources1[index],
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: GestureDetector(
                    onTap: (){
                      Get.to(JobScreen3(heading: 'Job Applicant',));
                    },
                    child: JobHeaderSlider(
                        "874", "Job Applicant", "98%", "assets/up.png"),
                  )
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Heading(text: "Categories",),
                  more(),
                ],
              ),
            ),
            DefaultTabController(
              length: 6,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 30, vertical: 0),
                    height: 45,
                    labelSpacing: 10,
                    backgroundColor: Style.systemblue,
                    physics: BouncingScrollPhysics(),
                    buttonMargin: EdgeInsets.only(left: 10, right: 0),
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        icon: Icon(Icons.color_lens),
                        text: "Designer",
                      ),
                      Tab(
                        icon: Icon(Icons.camera_alt),
                        text: "Photographer",
                      ),
                      Tab(
                        icon: Icon(Icons.developer_board),
                        text: "Developer",
                      ),
                      Tab(
                        icon: Icon(Icons.color_lens),
                        text: "Designer",
                      ),
                      Tab(
                        icon: Icon(Icons.color_lens),
                        text: "Designer",
                      ),
                      Tab(
                        icon: Icon(Icons.color_lens),
                        text: "Designer",
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 270,
                    child: TabBarView(
                      children: <Widget>[
                        Shops(),
                        Shops(),
                        Shops(),
                        Shops(),
                        Shops(),
                        Shops(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Heading(text: "Latest Vacancies",),
                  more(),
                ],
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: 5,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Get.to(
                    JobInnerScreen(
                      Images1:  _coffeeController
                          .getHomesList[index].services ??
                          "",
                      description: _coffeeController.studio[index],
                      designation: _coffeeController.designation[index],
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 140,
                  margin: EdgeInsets.only(bottom: 10),
                  child: Card(elevation: 2, child: Designation( index: index,)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
