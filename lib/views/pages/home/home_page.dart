// import 'package:carousel_slider/carousel_options.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:draw_idea/views/pages/home/home.dart';
// import 'package:draw_idea/views/pages/splash/splash_screen.dart';
// import 'package:draw_idea/views/widgets/badge/badge.dart';
// import 'package:draw_idea/views/widgets/drawer/drawer.dart';
// import 'package:draw_idea/views/widgets/flags/flags.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:provider/provider.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
// import '../../../controller/home_controller.dart';
// import '../../../services/api.dart';
// import '../../../utils/style.dart';
// import '../../widgets/bottomnav/bottom_nav_bar.dart';
// import '../../widgets/search/search.dart';
//
//
//
//
// class Homepage extends StatefulWidget {
//   final _coffeeController = Get.put(HomeController());
//   // final HomeController _coffeeController = Get.find();
//   Homepage({Key? key}) : super(key: key);
//
//   @override
//   State<Homepage> createState() => _HomepageState();
// }
//
// class _HomepageState extends State<Homepage>
//     with WidgetsBindingObserver, AutomaticKeepAliveClientMixin<Homepage> {
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((_) async {
//       await _apicart?.setcartitem();
//       await _apicart?.setcoloritem();
//     });
//
//     super.initState();
//   }
//
//   dynamic selected;
//   var heart = false;
//   PageController controller = PageController();
//   final _advancedDrawerController = AdvancedDrawerController();
//   @override
//   bool get wantKeepAlive => true;
//
//   Api? _apicart;
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   @override
//   void dispose() {
//     controller.dispose();
//     super.dispose();
//   }
//
//   List<Color> colors = [
//     Colors.blue,
//     Colors.orangeAccent,
//     Colors.grey,
//     Colors.green,
//     Colors.redAccent,
//     Colors.pinkAccent,
//     Colors.indigoAccent,
//     Colors.yellowAccent,
//     Colors.brown,
//   ];
//   final List<String> imgList = [
//     'assets/banner1.png',
//     'assets/banner2.jpg',
//     'assets/banner3.jpg',
//     'assets/banner6.jpg',
//     'assets/banner7.png',
//   ];
//   @override
//   Widget build(BuildContext context) {
//     _apicart = Provider.of(context);
//     return GetBuilder<HomeController>(builder: (HomeController) {
//       return AdvancedDrawer(
//         backdropColor: Color(0xFF2F3044),
//         controller: _advancedDrawerController,
//         animationCurve: Curves.easeInOut,
//         animationDuration: const Duration(milliseconds: 300),
//         animateChildDecoration: true,
//         rtlOpening: true,
//         disabledGestures: false,
//         childDecoration: const BoxDecoration(
//           borderRadius: const BorderRadius.all(Radius.circular(16)),
//         ),
//         drawer: drawer(),
//         child: Scaffold(
//           body: SingleChildScrollView(
//             controller: controller,
//             child: Stack(
//               children: [
//                 Container(
//                   color: Colors.red,
//                   child: Column(
//                     children: [
//
//                       Stack(
//                         children: [
//                           Positioned(
//                             top: 190,
//                             left: 0,
//                             right: 0,
//                             // bottom: 0,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Color(0xFFFFF8E1),
//                                   borderRadius: BorderRadius.only(
//                                       topLeft: Radius.circular(15.0),
//                                       topRight: Radius.circular(15.0))),
//                               height: 130,
//                               width: 120,
//                             ),
//                           ),
//                           // Positioned(
//                           //   right: 0,
//                           //   top: 20,
//                           //   child: Container(
//                           //     decoration: BoxDecoration(
//                           //         color: Color(0xFFFFF8E1),
//                           //         borderRadius: BorderRadius.only(
//                           //             topLeft: Radius.circular(10.0),
//                           //             bottomLeft: Radius.circular(10.0))),
//                           //     height: 60,
//                           //     width: 120,
//                           //   ),
//                           // ),
//                           SizedBox(
//                             height: 210,
//                           ),
//                           Positioned(
//                             top: 175,
//                             left: 17,
//                             child: Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.orange,
//                                   borderRadius: BorderRadius.circular(15)),
//                               width: 60,
//                               height: 5,
//                             ),
//                           ),
//                           Positioned(
//                             child: Container(
//                               padding: EdgeInsets.only(left: 10),
//                               child: Column(
//                                 children: [
//                                   _appbar(),
//                                   _homemenu(),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       Container(
//                         color: Color(0xFFFFF8E1),
//                         // height: 600,
//                         child: Column(
//                           children: [
//                             _appbanner(),
//                             _rechargebuttons(),
//                             _imagecarousel(),
//                             _latestmovies(),
//                             _trendingmusic(),
//                             _specialoffer(),
//                             _trendingnews(),
//                             _enjoygaming(),
//                             _jobeducation(),
//                             _stackedbanner(),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           bottomNavigationBar: StylishBottomBar(
//             items: [
//               AnimatedBarItems(
//                   icon: TextButton(
//                     onPressed: () {
//                       Get.to(Homepage());
//                     },
//                     style: TextButton.styleFrom(
//                       minimumSize: Size.zero,
//                       padding: EdgeInsets.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: const Icon(
//                       Icons.house_outlined,
//                       color: Colors.red,
//                     ),
//                   ),
//                   selectedIcon: Icon(
//                     Icons.house_rounded,
//                   ),
//                   selectedColor: Colors.red,
//                   backgroundColor: Colors.tealAccent,
//                   title: const Text('Home')),
//               AnimatedBarItems(
//                   icon: TextButton(
//                     onPressed: () {
//                       Get.to(Home());
//                     },
//                     style: TextButton.styleFrom(
//                       minimumSize: Size.zero,
//                       padding: EdgeInsets.zero,
//                       tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                     ),
//                     child: const Icon(
//                       Icons.star_border_rounded,
//                       color: Colors.red,
//                     ),
//                   ),
//                   selectedIcon: const Icon(Icons.star_rounded),
//                   selectedColor: Colors.red,
//                   backgroundColor: Colors.lightGreenAccent,
//                   title: const Text('Star')),
//               AnimatedBarItems(
//                   icon: const Icon(
//                     Icons.style_outlined,
//                   ),
//                   selectedIcon: const Icon(
//                     Icons.style,
//                   ),
//                   backgroundColor: Colors.amber,
//                   selectedColor: Colors.red,
//                   title: const Text('Style')),
//               AnimatedBarItems(
//                   icon: const Icon(
//                     Icons.person_outline,
//                   ),
//                   selectedIcon: const Icon(
//                     Icons.person,
//                   ),
//                   backgroundColor: Colors.purpleAccent,
//                   selectedColor: Colors.red,
//                   title: const Text('Profile')),
//             ],
//             iconSize: 32,
//             barAnimation: BarAnimation.blink,
//             iconStyle: IconStyle.Default,
//             hasNotch: true,
//             fabLocation: StylishBarFabLocation.center,
//             opacity: 0.3,
//             currentIndex: selected ?? 0,
//             onTap: (index) {
//               controller.jumpToPage(index!);
//               setState(() {
//                 selected = index;
//               });
//             },
//           ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               setState(() {
//                 heart = !heart;
//               });
//             },
//             backgroundColor: Colors.white,
//             child: Icon(
//               heart
//                   ? CupertinoIcons.creditcard_fill
//                   : CupertinoIcons.creditcard,
//               color: Colors.red,
//             ),
//           ),
//           floatingActionButtonLocation:
//               FloatingActionButtonLocation.centerDocked,
//         ),
//       );
//     });
//   }
//
//   void _handleMenuButtonPressed() {
//     // NOTICE: Manage Advanced Drawer state through the Controller.
//     // _advancedDrawerController.value = AdvancedDrawerValue.visible();
//     _advancedDrawerController.showDrawer();
//   }
//
//   Widget _appbar() {
//     return Container(
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(top: 25.0),
//             child: Row(
//               children: [
//                 Column(
//                   children: [
//                     flags(),
//                   ],
//                 ),
//                 Icon(
//                   Icons.keyboard_arrow_down,
//                   size: 20,
//                   color: Colors.white,
//                 )
//               ],
//             ),
//           ),
//           Container(
//             child: Center(
//               child: Row(
//                 // crossAxisAlignment: CrossAxisAlignment.end,
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   search(),
//                   IconButton(
//                     onPressed: _handleMenuButtonPressed,
//                     icon: ValueListenableBuilder<AdvancedDrawerValue>(
//                       valueListenable: _advancedDrawerController,
//                       builder: (_, value, __) {
//                         return AnimatedSwitcher(
//                           duration: Duration(milliseconds: 250),
//                           child: Icon(
//                             value.visible ? Icons.clear : Icons.menu,
//                             color: Colors.white,
//                             size: 30,
//                             key: ValueKey<bool>(value.visible),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
//
//   Widget _homemenu() {
//     return Container(
//       height: 100,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: _apicart?.cartitems.length,
//         itemBuilder: (BuildContext context, int index) => Container(
//           child: Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 5),
//                 child: TextButton(
//                   style: ButtonStyle(),
//                   onPressed: () {},
//                   child: Column(
//                     children: [
//                       Image.asset(
//                         _apicart?.cartitems[index].gif ?? "",
//                         width: 40.0,
//                         height: 40.0,
//                         color: Colors.white,
//                         fit: BoxFit.cover,
//                       ),
//                       SizedBox(
//                         height: 2,
//                       ),
//                       Text(
//                         _apicart?.cartitems[index].Name ?? "",
//                         style: GoogleFonts.poppins(
//                             fontSize: 15, color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _appbanner() {
//     return Container(
//       height: 320,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: _apicart?.cartitems.length,
//         itemBuilder: (BuildContext context, int index) => Container(
//           child: Row(
//             children: [
//               Container(
//                 padding: EdgeInsets.symmetric(horizontal: 10),
//                 child: TextButton(
//                   style: ButtonStyle(),
//                   onPressed: () {},
//                   child: Column(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(10.0),
//                         child: Image.asset(
//                           _apicart?.cartitems[index].ban ?? "",
//                           width: 300.0,
//                           height: 300.0,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _rechargebuttons() {
//     return Container(
//       padding: EdgeInsets.only(left: 15),
//       height: 150,
//       child: ListView.builder(
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: _apicart?.cartitems.length,
//         itemBuilder: (BuildContext context, int index) => Container(
//           child: Row(
//             children: [
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 55,
//                     height: 55,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(50)),
//                     margin: EdgeInsets.symmetric(horizontal: 15),
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       child: Image.asset(
//                         _apicart?.cartitems[index].img ?? "",
//                         width: 35.0,
//                         color: Colors.red,
//                         height: 35.0,
//                         fit: BoxFit.cover,
//                       ),
//                       style: ButtonStyle(
//                         elevation: MaterialStatePropertyAll(1.3),
//                         shape: MaterialStateProperty.all(CircleBorder()),
//                         padding: MaterialStateProperty.all(EdgeInsets.all(13)),
//                         backgroundColor: MaterialStateProperty.all(
//                             Colors.white), // <-- Button color
//                         overlayColor:
//                             MaterialStateProperty.resolveWith<Color?>((states) {
//                           if (states.contains(MaterialState.pressed))
//                             return Colors.black12;
//                         }),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 5,
//                   ),
//                   Center(
//                     child: Container(
//                       padding: EdgeInsets.only(left: 13),
//                       width: 85,
//                       child: Text(
//                         _apicart?.cartitems[index].btndesc ?? "",
//                         style: GoogleFonts.poppins(
//                             fontSize: 13, color: Colors.black),
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _imagecarousel() {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   "Deals/Offers",
//                   style: GoogleFonts.poppins(
//                     fontSize: 19,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 Container(
//                   // padding: EdgeInsets.only(right: 15),
//                   child: Icon(
//                     Icons.arrow_circle_right,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             child: Column(
//               children: [
//                 Container(
//                   alignment: Alignment(0.0, -4.0),
//                   child: CarouselSlider(
//                     options: CarouselOptions(
//                       autoPlay: true,
//                       viewportFraction: 0.9,
//                       aspectRatio: 16 / 9,
//                     ),
//                     items: imgList
//                         .map(
//                           (item) => Container(
//                             margin: EdgeInsets.symmetric(horizontal: 10),
//                             child: Center(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: Image.asset(item,
//                                     fit: BoxFit.cover,
//                                     height: 150,
//                                     width: 1000),
//                               ),
//                             ),
//                           ),
//                         )
//                         .toList(),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _latestmovies() {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.only(left: 20),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Text(
//                     "India's top 10",
//                     style: GoogleFonts.poppins(
//                         fontSize: 19,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(right: 15),
//                   child: Icon(
//                     Icons.arrow_circle_right,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 260,
//             padding: EdgeInsets.only(top: 15),
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: 9,
//               itemBuilder: (BuildContext context, int index) => Container(
//                 padding: EdgeInsets.only(left: 15),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 10, horizontal: 20),
//                       child: Container(
//                         // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//                         alignment: Alignment.topCenter,
//                         child: Stack(
//                           children: <Widget>[
//                             Container(
//                               // margin: EdgeInsets.only(top: 30),
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: Image.asset(
//                                   _apicart?.cartitems[index].movie ?? "",
//                                   height: 200,
//                                   width: 150,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                             Align(
//                               alignment: Alignment.topLeft,
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     alignment: Alignment.topLeft,
//                                     child: FractionalTranslation(
//                                       translation: Offset(-0.5, 0),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             _apicart?.cartitems[index].no ?? "",
//                                             height: 70,
//                                             color: Colors.white,
//                                             width: 70,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                   Container(
//                                     alignment: Alignment.topLeft,
//                                     child: FractionalTranslation(
//                                       translation: Offset(-1.5, 0),
//                                       child: Row(
//                                         children: [
//                                           Image.asset(
//                                             _apicart?.cartitems[index].no2 ??
//                                                 "",
//                                             height: 70,
//                                             color: Colors.red,
//                                             width: 70,
//                                             fit: BoxFit.cover,
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.only(left: 15),
//                       child: Text(
//                         "Kesariya ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _trendingmusic() {
//     return Container(
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(top: 10),
//             padding: EdgeInsets.only(left: 20, top: 10),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   child: Text(
//                     "trending music",
//                     style: GoogleFonts.poppins(
//                         fontSize: 19,
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.only(right: 15),
//                   child: Icon(
//                     Icons.arrow_circle_right,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Container(
//             height: 200,
//             padding: EdgeInsets.only(top: 15),
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: 9,
//               itemBuilder: (BuildContext context, int index) => Container(
//                 margin: EdgeInsets.only(left: 30),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(10.0),
//                       child: Image.asset(
//                         _apicart?.cartitems[index].movie ?? "",
//                         height: 150,
//                         width: 150,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                     Container(
//                       margin: EdgeInsets.only(top: 10),
//                       padding: EdgeInsets.only(left: 10),
//                       child: Text(
//                         "Kesariya ",
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _specialoffer() {
//     return Container(
//       color: Colors.red,
//       margin: EdgeInsets.only(top: 20),
//       padding: EdgeInsets.only(left: 20, top: 20),
//       height: 170,
//       child: Row(
//         children: [
//           Container(
//             // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//             alignment: Alignment.topCenter,
//             child: Stack(
//               children: <Widget>[
//                 Container(
//                   padding: EdgeInsets.only(left: 9),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: 90,
//                         height: 20,
//                         decoration: BoxDecoration(
//                             color: Colors.yellow,
//                             borderRadius: BorderRadius.circular(3)),
//                         child: Center(
//                             child: Text(
//                               "Special offer",
//                               style: GoogleFonts.poppins(
//                                   fontSize: 11, fontWeight: FontWeight.bold),
//                             )),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Container(
//                         child: Text("6 OTT'S in 1 app!",
//                             style: GoogleFonts.poppins(
//                                 fontSize: 17,
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold)),
//                       ),
//                       Container(
//                         width: 150,
//                         child: Text(
//                           "Flutter is an open source framework by Google for building beautiful",
//                           style: GoogleFonts.poppins(
//                             fontSize: 12,
//                             color: Colors.white,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         child: TextButton(
//                           onPressed: () {},
//                           style: TextButton.styleFrom(
//                             minimumSize: Size.zero,
//                             padding: EdgeInsets.only(top: 10),
//                             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//                           ),
//                           child: Row(
//                             children: [
//                               Text("Stream at \$10 ",
//                                   style: GoogleFonts.poppins(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold)),
//                               Icon(
//                                 Icons.double_arrow_rounded,
//                                 size: 17,
//                                 color: Colors.white,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 Align(
//                   alignment: Alignment.topRight,
//                   child:
//                       Container(
//                         alignment: Alignment.topRight,
//                         child: FractionalTranslation(
//                           translation: Offset(0.8, -0.1),
//                           child: Container(
//                             child: Image.asset(
//                               "assets/box2.png",
//                               width: 200.0,
//                               height: 230.0,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//
//
//                 ),
//               ],
//             ),
//           ),
//           // Container(
//           //   child: Column(
//           //     crossAxisAlignment: CrossAxisAlignment.start,
//           //     children: [
//           //       Container(
//           //         padding: EdgeInsets.only(left: 9),
//           //         child: Column(
//           //           crossAxisAlignment: CrossAxisAlignment.start,
//           //           children: [
//           //             Container(
//           //               width: 90,
//           //               height: 20,
//           //               decoration: BoxDecoration(
//           //                   color: Colors.yellow,
//           //                   borderRadius: BorderRadius.circular(3)),
//           //               child: Center(
//           //                   child: Text(
//           //                 "Special offer",
//           //                 style: GoogleFonts.poppins(
//           //                     fontSize: 11, fontWeight: FontWeight.bold),
//           //               )),
//           //             ),
//           //             SizedBox(
//           //               height: 5,
//           //             ),
//           //             Container(
//           //               child: Text("6 OTT'S in 1 app!",
//           //                   style: GoogleFonts.poppins(
//           //                       fontSize: 17,
//           //                       color: Colors.white,
//           //                       fontWeight: FontWeight.bold)),
//           //             ),
//           //             Container(
//           //               width: 150,
//           //               child: Text(
//           //                 "Flutter is an open source framework by Google for building beautiful",
//           //                 style: GoogleFonts.poppins(
//           //                   fontSize: 12,
//           //                   color: Colors.white,
//           //                 ),
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //       ),
//           //       Container(
//           //         child: TextButton(
//           //           onPressed: () {},
//           //           child: Row(
//           //             children: [
//           //               Text("Stream at \$10 ",
//           //                   style: GoogleFonts.poppins(
//           //                       fontSize: 15,
//           //                       color: Colors.white,
//           //                       fontWeight: FontWeight.bold)),
//           //               Icon(
//           //                 Icons.double_arrow_rounded,
//           //                 size: 17,
//           //                 color: Colors.white,
//           //               )
//           //             ],
//           //           ),
//           //         ),
//           //       ),
//           //     ],
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
//
//   Widget _trendingnews() {
//     return Container(
//       padding: EdgeInsets.only(left: 20, top: 20, right: 0, bottom: 0),
//       child: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 child: Text(
//                   "trending news",
//                   style: GoogleFonts.poppins(
//                       fontSize: 19,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(right: 15),
//                 child: Icon(
//                   Icons.arrow_circle_right,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 130,
//             margin: EdgeInsets.only(
//               top: 15,
//             ),
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: 9,
//               itemBuilder: (BuildContext context, int index) => Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10),
//                 width: 125.0,
//                 height: 120.0,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(70.0)),
//                   border: Border.all(
//                     color: Colors.white,
//                     width: 9.0,
//                   ),
//                 ),
//                 child: Container(
//                   width: 30.0,
//                   height: 30.0,
//                   decoration: BoxDecoration(
//                       color: Colors.black,
//                       image: DecorationImage(
//                         image: AssetImage(
//                           "assets/company1.png",
//                         ),
//                         fit: BoxFit.scaleDown,
//                       ),
//                       borderRadius: BorderRadius.all(Radius.circular(70.0)),
//                       border: Border.all(
//                         color: Color(0xFFFFF8E1),
//                         width: 3.0,
//                       )),
//                   child: Container(
//                     alignment: Alignment.center,
//                     child: FractionalTranslation(
//                         translation: Offset(0, 3.1),
//                         child: Container(
//                             height: 18,
//                             width: 35,
//                             decoration: BoxDecoration(
//                                 color: Colors.red,
//                                 borderRadius: BorderRadius.circular(5)),
//                             child: Center(
//                               child: Text(
//                                 "LIVE",
//                                 style: GoogleFonts.poppins(
//                                     fontSize: 14,
//                                     color: Colors.white,
//                                     fontWeight: FontWeight.w600),
//                               ),
//                             ))),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _enjoygaming() {
//     return Container(
//       margin: EdgeInsets.only(top: 30),
//       padding: EdgeInsets.only(left: 20, right: 0, bottom: 15),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 child: Text(
//                   "enjoy non-stop gaming",
//                   style: GoogleFonts.poppins(
//                       fontSize: 19,
//                       color: Colors.black,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ),
//               Container(
//                 padding: EdgeInsets.only(right: 15),
//                 child: Icon(
//                   Icons.arrow_circle_right,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           Container(
//             height: 200,
//             padding: EdgeInsets.only(top: 15),
//             child: ListView.builder(
//               shrinkWrap: true,
//               scrollDirection: Axis.horizontal,
//               itemCount: 9,
//               itemBuilder: (BuildContext context, int index) => Container(
//                 child: Column(
//                   children: [
//                     Stack(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                               vertical: 15, horizontal: 15),
//                           child: Container(
//                             height: 130,
//                             width: 130,
//                             decoration: BoxDecoration(
//                                 color: colors[index],
//                                 borderRadius: BorderRadius.circular(15)),
//                           ),
//                         ),
//                         Positioned(
//                           // left: 100,
//                           top: -15,
//                           bottom: 15,
//                           child: Image.asset(
//                             _apicart?.cartitems[index].game ?? "",
//                             fit: BoxFit.fill,
//                           ), // replace your image with Image.assets here
//                         ),
//                       ],
//                     ),
//                     Container(
//                       child: Text(
//                         _apicart?.cartitems[index].title ?? "",
//                         style: GoogleFonts.poppins(
//                           fontSize: 15,
//                           color: Colors.black,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _jobeducation() {
//     return Container(
//       padding: EdgeInsets.only(left: 20, top: 15, right: 15, bottom: 15),
//       height: 600,
//       color: Colors.grey[200],
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Job & Education ",
//                 style: GoogleFonts.poppins(
//                     fontSize: 19,
//                     color: Colors.black,
//                     fontWeight: FontWeight.w600),
//               ),
//               Container(
//                 child: Icon(
//                   Icons.arrow_circle_right,
//                   color: Colors.black,
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           Container(
//             child: Text("source framework by Google for building beautiful",
//                 style: GoogleFonts.poppins(
//                   fontSize: 14,
//                   color: Colors.black,
//                 )),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//             height: 505,
//             child: ListView.builder(
//               itemCount: 3,
//               physics: NeverScrollableScrollPhysics(),
//               scrollDirection: Axis.vertical,
//               itemBuilder: (BuildContext context, int index) {
//                 return Container(
//                   margin: EdgeInsets.only(bottom: 15),
//                   height: 140,
//                   decoration: new BoxDecoration(
//                     borderRadius: BorderRadius.circular(10),
//                     image: new DecorationImage(
//                       fit: BoxFit.cover,
//                       colorFilter: new ColorFilter.mode(
//                           Colors.black.withOpacity(0.3), BlendMode.darken),
//                       image:
//                           AssetImage(_apicart?.coloritems[index].backimg ?? ""),
//                     ),
//                   ),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.only(
//                           left: 15,
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Container(
//                               width: 150,
//                               child: Text(
//                                 "2 Pizza starting at \$10 each",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 17,
//                                   height: 1.2,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 10,
//                             ),
//                             Container(
//                               // width:210,
//                               child: Text(
//                                 "EXPLORE TO OF EATRIES NEARBY",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 11,
//                                   height: 1.2,
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         child: FractionalTranslation(
//                           translation: Offset(0, 0),
//                           child: Container(
//                             child: Image.asset(
//                               _apicart?.cartitems[index].game ?? "",
//                               width: 120,
//                               height: 140,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Container(
//                         padding: EdgeInsets.only(right: 10, top: 20),
//                         alignment: Alignment.topRight,
//                         child: Container(
//                           decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(7)),
//                           width: 42,
//                           height: 42,
//                           child: Center(
//                             child: Image.asset(
//                               _apicart?.coloritems[index].bis ?? "",
//                               width: 35.0,
//                               height: 35.0,
//                               fit: BoxFit.cover,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _stackedbanner() {
//     return Container(
//       margin: EdgeInsets.only(top: 40, bottom: 40),
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 0),
//             child: Container(
//               // padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
//               alignment: Alignment.topCenter,
//               child: Stack(
//                 children: <Widget>[
//                   Container(
//                     height: 110,
//                     color: Colors.indigo,
//                     padding: EdgeInsets.only(left: 160, top: 12),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           padding: EdgeInsets.only(left: 10),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 "Flutter is an open",
//                                 style: GoogleFonts.poppins(
//                                   fontSize: 13,
//                                   color: Colors.white,
//                                 ),
//                               ),
//                               Text(
//                                   "source framework by Google for building beautiful",
//                                   style: GoogleFonts.poppins(
//                                     fontSize: 11,
//                                     color: Colors.white,
//                                   )),
//                             ],
//                           ),
//                         ),
//                         Container(
//                           child: TextButton(
//                             onPressed: () {},
//                             child: Row(
//                               children: [
//                                 Text("Watch now ",
//                                     style: GoogleFonts.poppins(
//                                         fontSize: 14,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold)),
//                                 Icon(
//                                   Icons.double_arrow_rounded,
//                                   size: 14,
//                                   color: Colors.white,
//                                 )
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   Align(
//                     alignment: Alignment.topLeft,
//                     child: Row(
//                       children: [
//                         Container(
//                           alignment: Alignment.topLeft,
//                           child: FractionalTranslation(
//                             translation: Offset(0.15, -0.2),
//                             child: Container(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: Image.asset(
//                                   "assets/bane1.jpeg",
//                                   width: 135.0,
//                                   height: 135.0,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           alignment: Alignment.topLeft,
//                           child: FractionalTranslation(
//                             translation: Offset(-0.92, -0.16),
//                             child: Container(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10.0),
//                                 child: Image.asset(
//                                   "assets/bane.jpeg",
//                                   width: 110.0,
//                                   height: 160.0,
//                                   fit: BoxFit.cover,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//           // Positioned(
//           //   child: Container(
//           //     height: 110,
//           //     color: Colors.indigo,
//           //     padding: EdgeInsets.only(left: 160, top: 12),
//           //     child: Column(
//           //       crossAxisAlignment: CrossAxisAlignment.start,
//           //       children: [
//           //         Container(
//           //           padding: EdgeInsets.only(left: 10),
//           //           child: Column(
//           //             crossAxisAlignment: CrossAxisAlignment.start,
//           //             children: [
//           //               Text(
//           //                 "Flutter is an open",
//           //                 style: GoogleFonts.poppins(
//           //                   fontSize: 13,
//           //                   color: Colors.white,
//           //                 ),
//           //               ),
//           //               Text(
//           //                   "source framework by Google for building beautiful",
//           //                   style: GoogleFonts.poppins(
//           //                     fontSize: 11,
//           //                     color: Colors.white,
//           //                   )),
//           //             ],
//           //           ),
//           //         ),
//           //         Container(
//           //           child: TextButton(
//           //             onPressed: () {},
//           //             child: Row(
//           //               children: [
//           //                 Text("Watch now ",
//           //                     style: GoogleFonts.poppins(
//           //                         fontSize: 14,
//           //                         color: Colors.white,
//           //                         fontWeight: FontWeight.bold)),
//           //                 Icon(
//           //                   Icons.double_arrow_rounded,
//           //                   size: 14,
//           //                   color: Colors.white,
//           //                 )
//           //               ],
//           //             ),
//           //           ),
//           //         ),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ],
//       ),
//     );
//   }
// }
