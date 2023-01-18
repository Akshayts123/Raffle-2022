import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:draw_idea/views/pages/detail_pages/widgets/favourite.dart';
import 'package:draw_idea/views/pages/home/home_screen.dart';
import 'package:draw_idea/views/pages/home/widgets/tab_widget.dart';
import 'package:draw_idea/views/pages/register_login/welcome_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/style.dart';
import '../Deals/widgets/wishlist.dart';
import '../home/main_screen.dart';
import 'detail_shimmer.dart';

class Details extends StatefulWidget {
  Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  // bool integer = true;

  var integer;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    integer = setValue();
  }

  setValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      integer = (prefs.getBool('guest'));
    });
    return true;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height) / 1.05;
    final double itemWidth = size.width / 0.8;
    final orientation = MediaQuery.of(context).orientation;
    return   WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child:  integer==true ? ShimmerDetail() :  Container(
                child: Column(
                  children: [
                    // integer==true ? Text("Guest") : Text("User"),
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
                    Container(
                      height: 130,
                      child: ListView.builder(
                        shrinkWrap: true,
                        padding: EdgeInsets.only(left: 8),
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 9,
                        itemBuilder: (BuildContext context, int index) => Container(
                          padding: EdgeInsets.only(top: 20),
                          child: Row(
                            children: [
                              Card(
                                elevation: 5,
                                color: (index % 2 == 0)
                                    ? Colors.white
                                    : Style.systemblue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                child: Container(
                                  height: 90,
                                  width: 120,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 15),
                                  child: Column(
                                    children: [
                                      Icon(Icons.calendar_today_sharp,
                                          color: (index % 2 == 0)
                                              ? Colors.black
                                              : Style.whitecolor),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        "Calender",
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: (index % 2 == 0)
                                              ? Colors.black
                                              : Style.whitecolor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),

                    ListView.builder(
                      itemCount: 1,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              height: 1060,
                              // color: Colors.white,
                              child: InkWell(
                                onTap: () {
                                  print("hii");
                                },
                                child: SafeArea(
                                  child: TitleScrollNavigation(
                                    bodyStyle: NavigationBodyStyle(
                                        // background: Colors.white,
                                        ),
                                    identiferStyle: NavigationIdentiferStyle(
                                      color: Style.systemblue,
                                      position: IdentifierPosition.bottomAndLeft,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    barStyle: TitleNavigationBarStyle(
                                      activeColor: Style.systemblue,
                                      elevation: 0,
                                      style: GoogleFonts
                                          .poppins(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                         ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.0, vertical: 20.0),
                                      spaceBetween: 40,
                                    ),
                                    titles: [
                                      "Lorem Ipsum",
                                      "Lorem Ipsum",
                                      "Lorem Ipsum",
                                      "Lorem Ipsum",
                                      "Lorem Ipsum",
                                    ],
                                    pages: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        child: ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount: 5,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  Container(
                                            height: 190,
                                            width: 190,
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15)
                                              ),
                                              color: (index == 0)? Color(0xFF5185FF):(index == 4) ? Style.systemblue: (index == 2) ? Color(0xFF4FD2C2) :Color(0xFF6062CD),
                                              child: Container(
                                                padding: EdgeInsets.all(15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CircleAvatar(
                                                      child: Icon(
                                                          Icons.account_balance),
                                                    ),
                                                    Container(
                                                      padding: EdgeInsets.only(left: 15),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Small Stuff Adds Up?",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    fontSize: 16,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              SizedBox(width: 30,),
                                                              Text(
                                                                "07-06-2023",
                                                                style: GoogleFonts
                                                                    .poppins(
                                                                    fontSize: 13,
                                                                    fontWeight: FontWeight.bold,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            width: 270,

                                                            child: Text(
                                                              "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer",
                                                              style: GoogleFonts
                                                                  .poppins(
                                                                  fontSize: 14,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 10,
                                                          ),
                                                          Container(
                                                            width: 250,
                                                            child: Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [

                                                                Container(
                                                                  height: 35,
                                                                  width: 120,
                                                                  decoration: BoxDecoration(
                                                                    color:Colors.white,
                                                                      borderRadius: BorderRadius.circular(30)
                                                                  ),
                                                                  child: TextButton(
                                                                    onPressed: () {  },
                                                                    child: Text("SETUP A GOAL",style: GoogleFonts
                                                                        .poppins(
                                                                        fontSize: 13,
                                                                        color: Colors
                                                                            .black),),

                                                                  ),
                                                                ),
                                                                Container(child: Favourites()),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      ),

                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: GridView.builder(
                                          itemCount: 6,
                                          padding: EdgeInsets.all(10),
                                          shrinkWrap: true,
                                          physics: NeverScrollableScrollPhysics(),
                                          gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                              mainAxisSpacing: 5,
                                              crossAxisSpacing: 5,
                                              childAspectRatio: (itemWidth / itemHeight),
                                              crossAxisCount:
                                              (orientation == Orientation.portrait)
                                                  ? 2
                                                  : 9),
                                          itemBuilder: (BuildContext context, int index) {
                                            return GestureDetector(
                                              onTap: () {

                                              },
                                              child: Stack(
                                                children: [
                                                  Card(
                                                    elevation: 5,
                                                    shape: RoundedRectangleBorder(
                                                        borderRadius:
                                                        BorderRadius.circular(10)),
                                                    child: ClipRRect(
                                                      borderRadius: BorderRadius.circular(10),
                                                      child: Container(
                                                        color: Colors.white,
                                                        child: Column(
                                                          children: [
                                                            Container(
                                                              padding: EdgeInsets.symmetric(
                                                                  horizontal: 10, vertical: 10),
                                                              child: ClipRRect(
                                                                borderRadius: BorderRadius.circular(10),
                                                                child: Image.asset(
                                                                  "assets/purchase.png",
                                                                  width: 200.0,
                                                                  height: 170.0,
                                                                  fit: BoxFit.cover,
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              padding: EdgeInsets.all(10),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    child: Text(
                                                                      "creative professionals.",
                                                                      style:
                                                                      GoogleFonts.poppins(
                                                                          fontSize: 13,
                                                                          color: Style
                                                                              .greycolor,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 200,
                                                                    child: Text(
                                                                      "Lorem Ipsum is simply dummy text ",
                                                                      style:
                                                                      GoogleFonts.poppins(
                                                                          fontSize: 15,
                                                                          color: Style
                                                                              .blackcolor,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .w600),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      Container(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  Container(
                                            margin: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                  child: Material(
                                                    elevation: 15,
                                                    child: Image.asset(
                                                      "assets/purchase.png",
                                                      width: 130.0,
                                                      height: 130.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Lorem",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: "Poppins",
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          width: 100,
                                                          child: Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Poppins",
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  Container(
                                            margin: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                  child: Material(
                                                    elevation: 15,
                                                    child: Image.asset(
                                                      "assets/purchase.png",
                                                      width: 130.0,
                                                      height: 130.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Lorem",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: "Poppins",
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          width: 100,
                                                          child: Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Poppins",
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: 5,
                                          physics: NeverScrollableScrollPhysics(),
                                          itemBuilder:
                                              (BuildContext context, int index) =>
                                                  Container(
                                            margin: EdgeInsets.only(
                                                left: 15,
                                                right: 15,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(20.0),
                                                  child: Material(
                                                    elevation: 15,
                                                    child: Image.asset(
                                                      "assets/purchase.png",
                                                      width: 130.0,
                                                      height: 130.0,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment.start,
                                                    children: [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text(
                                                        "Lorem",
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontFamily: "Poppins",
                                                            fontWeight:
                                                                FontWeight.bold),
                                                      ),
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Container(
                                                          width: 100,
                                                          child: Text(
                                                            "Lorem Ipsum",
                                                            style: TextStyle(
                                                              fontSize: 12,
                                                              fontFamily:
                                                                  "Poppins",
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                ),

                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.transparent,
          child: Container(
            height: 60,
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 10,vertical: 4),
            child: Column(
              children: [
                Container(
                  width:double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Style.systemblue,
                      borderRadius: BorderRadius.circular(10)),
                  child:integer==true ? TextButton(
                    onPressed: () {
                      // Utility.showToast(msg: "Please enter valid Email and Password .");
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                              title: const Text(
                                  "Login to View Shop details",style: TextStyle(color: Style.blackcolor),),
                              actions: [
                                Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: Style.systemblue,
                                    borderRadius: BorderRadius.circular(10)
                                  ),

                                  child: TextButton(
                                    child: const Text("Login Now",style: TextStyle(color: Style.whitecolor),),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  WelcomeScreen()));
                                    },
                                  ),
                                )
                              ]));
                      // Get.to(WelcomeScreen());
                    },
                    child: Text("View Shop",style: GoogleFonts.poppins(
                        fontSize: 16,
                        height: 2,
                        color: Style.whitecolor,
                        fontWeight: FontWeight.w500)),
                  ): TextButton(
                    onPressed: () {
                      Get.to(MainScreen());
                    },
                    child: Text("View Shop",style: GoogleFonts.poppins(
                        fontSize: 16,
                        height: 2,
                        color: Style.whitecolor,
                        fontWeight: FontWeight.w500)),
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  // logoutUser() async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   return (prefs.getBool('guest') ?? false);
  //   print('shared prefs ::::::: ' + prefs.getBool('guest').toString());
  // }
}
