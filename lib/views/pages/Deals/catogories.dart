import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/Deals/category_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../controller/category_controller.dart';
import '../../../controller/home_controller.dart';
import '../../widgets/more/more.dart';
import '../home/main_screen.dart';
import '../home/widgets/bottom_nav_bar.dart';
import '../home/widgets/floating_action.dart';
import '../job_portal/widgets/appbar.dart';
import 'widgets/catogory_heading.dart';
import 'widgets/catogory_items.dart';
import 'widgets/catogory_search.dart';

class Catogories extends HookWidget {
  final CategoryController catogoryController = Get.find();
  final HomeController coffeeController = Get.find();
  final _scrollController = ScrollController();


  Catogories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _appBar(height) => Appbar( text:"CATEGORIES", height: height,);
    final orientation = MediaQuery.of(context).orientation;
    return Scaffold(
        backgroundColor: context.theme.canvasColor,
      // appBar: AppBar(
      //   backgroundColor: Style.systemblue,
      //   leading: Icon(Icons.menu),
      //   title: Text("Categories"),
      // ),
      body:SingleChildScrollView(
        child: Column(
          children: [
            _appBar(AppBar().preferredSize.height),
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding:  Pods.HEADING_PADDING,
                            child: Heading(text: "Popular Category",)
                        ),
                        more()
                      ],
                    ),

                    Container(
                      child: GridView.builder(
                        itemCount: 6,
                        padding: EdgeInsets.all(10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                            crossAxisCount:
                            (orientation == Orientation.portrait) ? 3 : 9),
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: (){
                              Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.title[index],));
                            },
                            child: CatogoryItems(
                              title: catogoryController.title[index],
                              image: coffeeController.getHomesList[index].category ?? "",
                            ),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            padding:  Pods.HEADING_PADDING,
                            child: Heading(text: "All Category",)
                        ),
                        more()
                      ],
                    ),

                    GestureDetector(
                      onTap: (){},
                      child: Container(
                        child: GridView.builder(
                          itemCount: 10,
                          padding: EdgeInsets.all(10),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount:
                              (orientation == Orientation.portrait) ? 3 : 9),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.alltitle[index],));
                              },
                              child: CatogoryItems(
                                title: catogoryController.alltitle[index],
                                image: coffeeController.getHomesList[index].category ?? "",
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
      // CustomScrollView(
      //   controller: _scrollController,
      //   slivers: [
      //     SliverAppBar(
      //       elevation: 2,
      //       pinned: true,
      //       leading: IconButton(
      //         icon: Icon(
      //           Icons.arrow_back,
      //           color:  Colors.white,
      //         ),
      //         onPressed: () {
      //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainScreen()));
      //         },
      //       ),
      //       title: Container(
      //         width: MediaQuery.of(context).size.width,
      //         child: Text("Categories"),
      //       ),
      //       expandedHeight: 140,
      //       backgroundColor: Style.systemblue,
      //       flexibleSpace: FlexibleSpaceBar(
      //         background: Container(
      //           height: 200.0,
      //           // child:
      //           // ClipPath(
      //           //   clipper: CurveClipper(),
      //           child:Container(
      //             padding: EdgeInsets.only(top: 15),
      //             child: Stack(
      //               children: [
      //                 Positioned(
      //                   // To take AppBar Size only
      //                   top: 80.0,
      //                   left: 10.0,
      //                   right: 10.0,
      //                   child: Container(
      //                     decoration: BoxDecoration
      //                       (border: Border.all(width: 1,color: Colors.white)),
      //                     child: AppBar(
      //                       backgroundColor: Colors.white,
      //                       leading: IconButton(
      //                         icon: Icon(Icons.search, color: Style.systemblue),
      //                         onPressed: () {},
      //                       ),
      //                       primary: false,
      //                       title: TextField(
      //                           decoration: InputDecoration(
      //                               hintText: "Search",
      //                               border: InputBorder.none,
      //                               hintStyle: TextStyle(color: Colors.grey))),
      //                       actions: <Widget>[
      //                         IconButton(
      //                           icon: Icon(Icons.filter_list_alt, color: Style.systemblue),
      //                           onPressed: () {},
      //                         ),
      //                         Container(
      //                           height: 10,
      //                           width: 50,
      //                           color: Style.systemblue,
      //                           child: IconButton(
      //                             icon: Icon(Icons.search, color: Style.whitecolor),
      //                             onPressed: () {},
      //                           ),
      //                         )
      //                       ],
      //                     ),
      //                   ),
      //                 )
      //               ],
      //             )
      //           ),
      //         ),
      //       ),
      //     ),
      //     SliverToBoxAdapter(
      //       child: Padding(
      //         padding: const EdgeInsets.only(top: 10.0),
      //         child: SingleChildScrollView(
      //           physics: BouncingScrollPhysics(),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //
      //               Container(
      //                 padding: EdgeInsets.symmetric(horizontal: 10),
      //                 child: Heading(
      //                   text: "Popular Category",
      //                 ),
      //               ),
      //               Container(
      //                 child: GridView.builder(
      //                   itemCount: 6,
      //                   padding: EdgeInsets.all(10),
      //                   shrinkWrap: true,
      //                   physics: NeverScrollableScrollPhysics(),
      //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                       mainAxisSpacing: 10,
      //                       crossAxisSpacing: 10,
      //                       crossAxisCount:
      //                       (orientation == Orientation.portrait) ? 3 : 9),
      //                   itemBuilder: (BuildContext context, int index) {
      //                     return GestureDetector(
      //                       onTap: (){
      //                         Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.title[index],));
      //                       },
      //                       child: CatogoryItems(
      //                         title: catogoryController.title[index],
      //                         image: coffeeController.getHomesList[index].category ?? "",
      //                       ),
      //                     );
      //                   },
      //                 ),
      //               ),
      //               Container(
      //                 padding: EdgeInsets.symmetric(horizontal: 10),
      //                 child: Heading(
      //                   text: "All Category",
      //                 ),
      //               ),
      //               GestureDetector(
      //                 onTap: (){},
      //                 child: Container(
      //                   child: GridView.builder(
      //                     itemCount: 10,
      //                     padding: EdgeInsets.all(10),
      //                     shrinkWrap: true,
      //                     physics: NeverScrollableScrollPhysics(),
      //                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //                         mainAxisSpacing: 10,
      //                         crossAxisSpacing: 10,
      //                         crossAxisCount:
      //                         (orientation == Orientation.portrait) ? 3 : 9),
      //                     itemBuilder: (BuildContext context, int index) {
      //                       return GestureDetector(
      //                         onTap: (){
      //                           Get.to(CategoryScreen(categoryimage: coffeeController.getHomesList[index].category??"", categorytitle: catogoryController.alltitle[index],));
      //                         },
      //                         child: CatogoryItems(
      //                           title: catogoryController.alltitle[index],
      //                           image: coffeeController.getHomesList[index].category ?? "",
      //                         ),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      // bottomNavigationBar: Bottom_nav(),
    );
  }
}
