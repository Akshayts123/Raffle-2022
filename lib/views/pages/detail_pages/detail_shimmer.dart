import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

import '../../../utils/style.dart';

Widget ShimmerDetail() {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(0.0),
        child: ImageSlideshow(
          height: 200,
          indicatorColor: Style.systemblue,
          onPageChanged: (value) {},
          autoPlayInterval: 3000,
          isLoop: true,
          children: [
            Container(
              child: Image.asset(
                "assets/purchase.png",
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Image.asset(
                "assets/purchase.png",
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              child: Image.asset(
                "assets/purchase.png",
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Container(
        height: 180,
        child: ListView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 8),
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) => Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: [
                Row(
                  children: [
                    FadeShimmer(
                      height: 90,
                      width: 120,
                      radius: 4,
                      millisecondsDelay: 300,
                      fadeTheme: FadeTheme.light,
                    ),
                  ],
                ),
                SizedBox(height: 15,),
                Column(
                  children: [
                    FadeShimmer(
                      height: 30,
                      width: 120,
                      radius: 4,
                      millisecondsDelay: 300,
                      fadeTheme: FadeTheme.light,
                    ),
                    SizedBox(height: 10,),
                    FadeShimmer(
                      height: 10,
                      width: 120,
                      radius: 4,
                      millisecondsDelay: 300,
                      fadeTheme: FadeTheme.light,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 0),
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) => Container(
          padding: EdgeInsets.all(0),
          child: Column(
            children: [

              Column(
                children: [
                  FadeShimmer(
                    height: 200,
                    width: 350,
                    radius: 4,
                    millisecondsDelay: 300,
                    fadeTheme: FadeTheme.light,

                  ),
                  SizedBox(height: 10,),

                ],
              )
            ],
          ),
        ),
      ),
    ],
  );
}
