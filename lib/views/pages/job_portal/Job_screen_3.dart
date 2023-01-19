

import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/icons.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/list_jobs.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/new_appbar.dart';
import 'package:draw_idea/views/pages/job_portal/widgets/tags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class JobScreen3 extends StatelessWidget {
  String heading;
   JobScreen3({Key? key , required this.heading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (overscroll) {
        overscroll.disallowGlow();
        return true;
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              NewAppbar(heading),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Tags(tags: 'Remote',),
                  Tags(tags: 'Fulltime',),
                  Tags(tags: 'Japan',)
                ],
              ),
              SizedBox(
                height: 10,
              ),
              JobsList(),
            ],
          ),
        ),
      ),
    );
  }
}
