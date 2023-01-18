import 'package:draw_idea/views/pages/Deals/widgets/catogory_heading.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/appbar.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/designation.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/icons.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/salary.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/wishlist.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(height: 180, child: Iconsimage(widget.Images1)),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Heading(text: widget.description),
            ),
            SizedBox(
              height: 10,
            ),
            Designation(),
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
                    indicator: BoxDecoration(

                      borderRadius: BorderRadius.circular(
                        10.0,
                      ),
                      color: Colors.grey.shade900,
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey.shade900,
                    tabs: [
                      Tab(
                        text: 'One',
                      ),
                      Tab(
                        text: 'Two',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(
                    child: Text(
                      'Page One',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Page Two',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
