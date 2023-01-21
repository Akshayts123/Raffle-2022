

import 'package:draw_idea/views/pages/home/widgets/appbanner.dart';
import 'package:draw_idea/views/pages/home/widgets/image_view.dart';
import 'package:draw_idea/views/pages/home/widgets/small_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class GuestVersion extends StatelessWidget {
  const GuestVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: context.theme.backgroundColor,
        child: Column(
          children: [
            AppBanner(),
            ImageView(),
            SmallBanner(),
          ],
        ));
  }
}
