import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/appbar.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/designation.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/dot_text.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/icons.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/salary.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';

class JobInnerScreen extends StatefulWidget {
  String Images1;
  final description;
  final designation;

  JobInnerScreen(
      {Key? key,
      required this.Images1,
      required this.description,
      required this.designation})
      : super(key: key);

  @override
  State<JobInnerScreen> createState() => _JobInnerScreenState();
}

class _JobInnerScreenState extends State<JobInnerScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }
  final HomeController _coffeeController = Get.find();
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(height: 180, child: Iconsimage(widget.Images1)),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Heading(text: widget.description),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
                            widget.designation,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                           widget.description,
                            style: context.theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          Wishlist(),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Posted 2h ago",
                            style: context.theme.textTheme.bodyLarge,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Salary(),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    TabBar(
                      controller: _tabController,
                      indicatorColor: Style.systemblue,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ),
                        color: Style.systemblue,
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Style.systemblue,
                      labelStyle: Style.text31,
                      tabs: [
                        Tab(
                          text: 'Job Desc.',
                        ),
                        Tab(
                          text: 'Gallery',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 500,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                            style: context.theme.textTheme.titleLarge,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Heading(text: "Requirments"),
                          SizedBox(
                            height: 10,
                          ),
                          DotText(
                          text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DotText(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          DotText(
                            text: "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 500,
                      child: GridView.builder(
                          itemCount: _coffeeController.getHomesList.length,
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          physics: BouncingScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 5,
                              crossAxisCount:
                                  (orientation == Orientation.portrait) ? 2 : 9),
                          itemBuilder: (BuildContext context, int index) {
                           return Container(
                             child: Image.asset(
                               _coffeeController.getHomesList[index].ban??"",
                               width: 75.0,
                               height: 75.0,
                               fit: BoxFit.cover,
                             ),
                           );
                          }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          height: 60,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                    color: Style.systemblue,
                    borderRadius: BorderRadius.circular(10)),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Apply for this job ",
                      style: GoogleFonts.poppins(
                          fontSize: 14,
                          height: 2,
                          color: Style.whitecolor,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
