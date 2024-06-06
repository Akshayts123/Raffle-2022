
import 'package:draw_idea/views/pages/home/widgets/add_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/appbanner.dart';
import 'package:draw_idea/views/pages/home/widgets/enjoy_gaming.dart';
import 'package:draw_idea/views/pages/home/widgets/featured_offer.dart';
import 'package:draw_idea/views/pages/home/widgets/help_support.dart';
import 'package:draw_idea/views/pages/home/widgets/image_view.dart';
import 'package:draw_idea/views/pages/home/widgets/job_education.dart';
import 'package:draw_idea/views/pages/home/widgets/latest_movies.dart';
import 'package:draw_idea/views/pages/home/widgets/music_slider.dart';
import 'package:draw_idea/views/pages/home/widgets/new_connection.dart';
import 'package:draw_idea/views/pages/home/widgets/news_slider.dart';
import 'package:draw_idea/views/pages/home/widgets/offer_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/progress_circles.dart';
import 'package:draw_idea/views/pages/home/widgets/small_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/stacked_banner.dart';
import 'package:draw_idea/views/pages/home/widgets/tickets.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FullVersion extends StatelessWidget {
  const FullVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      // color: Color(0xFFFFF9E9),
      color: context.theme.backgroundColor,
      child: Column(

        children: [
          // CarouselSliders(),
          AppBanner(),
          // CategoryList(),
          AddBanner(),
          // MenuSlider(),
          ProgressCircles(),
          ImageView(),
          SmallBanner(),
          LatestMovies(),
          MusicSlider(),
          OfferBanner(),
          NewsSlider(),
          EnjoyGaming(),
          JobEducation(),
          StackedBanner(),
          Tickets(),
          NewConnection(),
          FeaturedOffer(),
          // TabView(),
          HelpSupport(),
        ],
      ),
    );
  }
}
