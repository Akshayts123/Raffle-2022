import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:draw_idea/controller/home_controller.dart';
import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/Deals/widgets/wishlist.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/appbar.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/tab_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'widgets/job_head_slider.dart';

class JobHome extends StatelessWidget {

   JobHome({Key? key}) : super(key: key);
  RxBool  isBluetoothOn = false.obs;
  @override
  Widget build(BuildContext context) {

    _appBar(height) => Appbar(context, height);
    return Scaffold(
      appBar: _appBar(AppBar().preferredSize.height),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
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
                  child: JobHeaderSlider(
                      "874", "Job Applicant", "98%", "assets/up.png"),
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: Style.mainheading,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "more",
                          style: Style.text9111,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
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
                        Container(
                          height: 120,
                          child: ListView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(10),
                            scrollDirection: Axis.horizontal,
                            itemCount: 10,
                            physics: BouncingScrollPhysics(),
                            itemBuilder: (BuildContext context, int index) =>
                                TabItem(
                              "assets/hatric.png",
                              "Creative Studios",
                              "Innovative ideas",
                              "40 Vaccency",
                            ),
                          ),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                        Center(
                          child: Icon(Icons.directions_car),
                        ),
                        Center(
                          child: Icon(Icons.directions_transit),
                        ),
                        Center(
                          child: Icon(Icons.directions_bike),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Latest Vacancies",
                    style: Style.mainheading,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          "more",
                          style: Style.text9111,
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 15,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              itemCount: 10,
              physics: BouncingScrollPhysics(),
              itemBuilder: (BuildContext context, int index) =>
                  Container(
                    width: double.infinity,
                    height: 100,

                    margin: EdgeInsets.only(bottom: 10),
                    child: Card(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 10),
                              width: 70.0,
                              height: 70.0,
                              child: Image.asset(
                                "assets/hatric.png",
                                width: 55.0,
                                height: 55.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Software Developer",
                                    style: Style.text29,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Software Developer",
                                    style: Style.text9111,
                                  ),
                                  ],
                              ),
                            ),
                            Spacer(),
                            Center(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Icon(
                                    isBluetoothOn.value ? Icons.favorite : Icons.favorite_border,
                                    color:Style.systemblue,
                                    size: 20,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "2h ago",
                                    style: Style.text9111,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
            ),
          ],
        ),
      ),
    );
  }
}
