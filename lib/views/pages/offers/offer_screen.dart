import 'package:draw_idea/views/pages/offers/widgets/offer_grid.dart';
import 'package:draw_idea/views/pages/offers/widgets/offer_image.dart';
import 'package:draw_idea/views/pages/offers/widgets/slider_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../controller/home_controller.dart';
import '../../../utils/style.dart';
import '../Deals/widgets/catogory_search.dart';
import '../Deals/widgets/star.dart';
import '../Deals/widgets/wishlist.dart';
import '../home/main_screen.dart';
import '../home/widgets/bottom_nav_bar.dart';

class OffersScreen extends StatelessWidget {
   OffersScreen({Key? key}) : super(key: key);
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final HomeController coffeeController = Get.find();
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 1;
    final double itemWidth = size.width / 0.8;
    final orientation = MediaQuery.of(context).orientation;
    final List<Tab> _homeScreenTabs = const <Tab>[
      Tab(
        text: 'All',
      ),
      Tab(
        text: 'Popular',
      ),
      Tab(
        text: 'Vegetarian',
      ),
      Tab(
        text: 'Italian',
      ),
      Tab(
        text: 'Chineese',
      ),
      Tab(
        text: 'Snacks',
      ),
    ];
    return Scaffold(

      body:CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 2,
            pinned: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color:  Colors.white,
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
              },
            ),
            title: Container(
              width: MediaQuery.of(context).size.width,
              child: Text("Offers"),
            ),
            expandedHeight: 150,
            backgroundColor: Style.systemblue,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                height: 200.0,
                // child:
                // ClipPath(
                //   clipper: CurveClipper(),
                child:Container(
                  padding: EdgeInsets.only(top: 90),
                  child: CategorySearch(),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: ImageSlideshow(
                        height: 200,
                        indicatorColor: Style.systemblue,
                        onPageChanged: (value) {},
                        autoPlayInterval: 3000,
                        isLoop: true,
                        children: [
                          SliderWidget(),
                          SliderWidget(),
                          SliderWidget(),
                          SliderWidget(),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Premium Offers",
                      style: Style.mainheading,
                    ),
                  ),
                  Container(
                    height: 200,
                    child: ListView.builder(
                      // padding: EdgeInsets.only(top: 20,left: 13),
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  height: 170,
                                  width: 150,
                                  decoration: new BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      gradient: LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: (index % 2 == 0)
                                              ? [Colors.purple, Color(0xFF4347F0)]
                                              : [Colors.orange, Color(0xFFFE5312)])),
                                  child: Center(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            child: Icon(
                                              Icons.workspace_premium,
                                              color: Colors.white,
                                              size: 100,
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Container(
                                            child: Text(
                                                "Elite Class",
                                                style: Style.text18
                                            )),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                      child: Text(
                                          "Lorem Ipsum is simply",
                                          style:Style.text17
                                      )),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                      width: 200,
                                      child: Text(
                                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                          style: Style.text9111
                                      )),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          child: Text(
                                            "\$45,000",
                                            style: GoogleFonts.poppins(
                                                color: (index % 2 == 0)
                                                    ? Color(0xFF4347F0)
                                                    : Colors.orange,
                                                fontSize: 19,
                                                fontWeight: FontWeight.w600),
                                          )),
                                      SizedBox(
                                        width: 30,
                                      ),
                                      Container(
                                          width: 100,
                                          height: 35,
                                          decoration: new BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              gradient: LinearGradient(
                                                  begin: Alignment.centerLeft,
                                                  end: Alignment.centerRight,
                                                  colors: (index % 2 == 0)
                                                      ? [
                                                    Colors.purple,
                                                    Color(0xFF4347F0)
                                                  ]
                                                      : [
                                                    Colors.orange,
                                                    Color(0xFFFE5312),
                                                  ])),
                                          child: TextButton(
                                            child: Text(
                                                "Purchase",
                                                style: Style.text91111
                                            ),
                                            onPressed: () {},
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          );
                        }),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, top: 5),
                    child: Text(
                      "Offers",
                      style: Style.mainheading,
                    ),
                  ),

                  Container(
                    child: DefaultTabController(
                      length: _homeScreenTabs.length,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          TabBar(
                            labelPadding: EdgeInsets.symmetric(horizontal: 20),
                            indicatorSize: TabBarIndicatorSize.label,
                            indicatorColor: Colors.transparent,
                            isScrollable: true,
                            unselectedLabelColor: Style.blackcolor,
                            labelColor: Style.systemblue,
                            tabs: _homeScreenTabs,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 0),
                            height: 1600,
                            child: TabBarView(

                              children: [
                                OfferGrid(),
                                OfferGrid(),
                                OfferGrid(),
                                OfferGrid(),
                                OfferGrid(),
                                OfferGrid(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // bottomNavigationBar: Bottom_nav(),
    );
  }
}
