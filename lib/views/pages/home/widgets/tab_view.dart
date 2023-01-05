

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:draw_idea/views/pages/home/widgets/tab_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../utils/style.dart';

Widget TabView(){
  return Container(
    // color: Colors.grey[200],
    child: Column(
      children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10,bottom: 10),
                child: Text(
                  "Watch Now",
                  style: Style.mainheading,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 0.0),
                child: RawMaterialButton(
                  onPressed: () {},
                  constraints: BoxConstraints(),
                  elevation: 0.0,
                  fillColor: Style.whitecolor,
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
        DefaultTabController(
          length: 6,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(

                contentPadding: EdgeInsets.symmetric(horizontal: 30,vertical: 0),
                height: 35,
                labelSpacing: 10,
                backgroundColor: Style.systemblue,
                physics: BouncingScrollPhysics(),
                buttonMargin: EdgeInsets.only(left: 15,right: 0),
                unselectedBackgroundColor: Colors.grey[300],
                unselectedLabelStyle: TextStyle(color: Colors.black),
                labelStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: Icon(Icons.directions_car),
                    text: "car",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                  Tab(
                    icon: Icon(Icons.bus_alert),
                    text: "bus",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_bike),
                    text: "bike",
                  ),
                  Tab(
                    icon: Icon(Icons.airplanemode_active),
                    text: "flight",
                  ),
                  Tab(
                    icon: Icon(Icons.directions_transit),
                    text: "transit",
                  ),
                ],
              ),
              Container(
                height: 270,
                child:TabBarView(
                  children: <Widget>[
                    Center(
                      child: TabWidget(),
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
      ],
    ),
  );
}