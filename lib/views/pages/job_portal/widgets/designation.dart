

import 'package:draw_idea/views/pages/job_portal/widgets/wishlist.dart';
import 'package:flutter/cupertino.dart';

import '../../../../utils/style.dart';

Designation(){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 10,),
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
                "Software Developer",
                style: Style.text29,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Crewmates Studio",
                style: Style.text9111,
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
                style: Style.text9111,
              ),
            ],
          ),
        ),
      ],
    ),
  );
}