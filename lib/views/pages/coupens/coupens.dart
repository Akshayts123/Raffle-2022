import 'package:confetti/confetti.dart';
import 'package:draw_idea/utils/style.dart';
import 'package:draw_idea/views/pages/coupens/show_scrached.dart';
import 'package:draw_idea/views/pages/home/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scratcher/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/home_controller.dart';
import '../Deals/widgets/catogory_heading.dart';
import '../home/widgets/bottom_nav_bar.dart';
import '../home/widgets/floating_action.dart';
import '../job_portal/widgets/appbar.dart';
import 'open_scrached.dart';

class ScrachCoupens extends StatefulWidget {
  ScrachCoupens({Key? key}) : super(key: key);

  @override
  State<ScrachCoupens> createState() => _ScrachCoupensState();
}

class _ScrachCoupensState extends State<ScrachCoupens> {
  final HomeController _coffeeController = Get.find();
  late ScrollController scrollController;
  late ConfettiController controller;
  bool reward = true;
  bool lastStatus = true;
  List<int> alreadyAddedIndices = [];
  final scratchKey = GlobalKey<ScratcherState>();
  var courseid = 0;
  double? closing = 0;
  var coursename = "default";
  bool isExpired = true;
  final expirationDate = DateTime(2021, 12, 20);
  @override
  Widget build(BuildContext context) {
    _appBar(height) => Appbar( text:"COUPONS", height: height,);
    return Scaffold(
      backgroundColor:context.theme.backgroundColor ,
      // bottomNavigationBar: Bottom_nav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _appBar(AppBar().preferredSize.height),
            SizedBox(
              height: 40,
            ),
            Container(
              color: context.theme.backgroundColor ,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Heading(
                      text: "My Rewards",
                    ),
                  ),
                  GridView.count(
                    crossAxisCount: 2,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0,
                    padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                    shrinkWrap: true,
                    children: List.generate(
                      _coffeeController.getHomesList.length,
                          (index) {
                        return GestureDetector(
                          onTap: () {
                            alreadyAddedIndices.contains(index)
                                ? showGeneralDialog(
                              context: context,
                              barrierLabel: "Barrier",
                              barrierDismissible: false,
                              barrierColor:
                              Colors.black.withOpacity(0.9),
                              transitionDuration:
                              Duration(milliseconds: 1),
                              pageBuilder: (_, __, ___) {
                                return openScrach(
                                  index: index,
                                );
                              },
                            )
                                : showGeneralDialog(
                              context: context,
                              barrierLabel: "Barrier",
                              barrierDismissible: false,
                              barrierColor:
                              Colors.black.withOpacity(0.9),
                              transitionDuration:
                              Duration(milliseconds: 1),
                              pageBuilder: (_, __, ___) {
                                return ScracherWidget(index

                                );
                              },
                              transitionBuilder: (_, anim, __, child) {
                                Tween<Offset> tween;
                                if (anim.status ==
                                    AnimationStatus.reverse) {
                                  tween = Tween(
                                      begin: Offset(0, 0),
                                      end: Offset.zero);
                                } else {
                                  tween = Tween(
                                      begin: Offset(0, 0),
                                      end: Offset.zero);
                                }

                                return SlideTransition(
                                  position: tween.animate(anim),
                                  child: FadeTransition(
                                    opacity: anim,
                                    child: child,
                                  ),
                                );
                              },
                            );
                            // LogoutOverlay();
                          },
                          child: ShowScrached(alreadyAddedIndices: alreadyAddedIndices,index: index),
                        );
                      },
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

  Widget Expired() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.grey[200],
        child: Center(
            child: Text(
          "Expired",
          style: GoogleFonts.poppins(
              fontSize: 17,
              color: Style.blackcolor,
              fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Widget Redeem() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 50,
        color: Colors.green[100],
        child: Center(
            child: Text(
          "Redeem",
          style: GoogleFonts.poppins(
              fontSize: 17, color: Colors.green, fontWeight: FontWeight.w500),
        )),
      ),
    );
  }

  Widget ScracherWidget(index){
    return new WillPopScope(
      onWillPop: () async => false,
      child: SafeArea(
        child: Column(
          mainAxisAlignment:
          MainAxisAlignment.spaceBetween,
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (reward) {
                        Navigator.pop(
                            context, ScrachCoupens);
                      }
                      if (reward == false &&
                         courseid == index) {
                        scratchKey.currentState
                            ?.reveal();
                        reward = true;
                      }
                    },
                    child: Icon(
                      Icons.close,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.expand_circle_down_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Icon(
                        Icons.more_vert,
                        size: 30,
                        color: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            ),

            Center(
              child: Container(
                // color: Colors.white,
                width: 200,
                height: 200,
                child: Column(
                  children: [
                    Scratcher(
                      key: scratchKey,
                      brushSize: 60,
                      threshold: 75,
                      // color: Colors.red,
                      image: Image.asset(
                        "assets/yy.png",
                        fit: BoxFit.fill,
                      ),
                      onChange: (value) async {
                        setState(() {
                          // change as per your code
                          // courseid = index;
                          // coursename=index.toString();
                          // add index in list if not available
                          // tapping again, remove index from list
                          // scratchKey.currentState?. reveal();
                        courseid = index;
                          closing = value;
                          if (value > 12) {
                          alreadyAddedIndices
                                .add(index);
                           reward = false;
                          } else {
                            alreadyAddedIndices
                                .remove(index);
                          }
                          // alreadyAddedIndices.contains(index)?alreadyAddedIndices.add(index):alreadyAddedIndices.add(index);
                        },);
                        // SharedPreferences prefs = await SharedPreferences.getInstance();
                        // prefs?.setBool("reward", true);
                        print(
                            "Scratch progress: $value%");
                      },

                      onThreshold: () =>
                       controller?.play(),
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .spaceEvenly,
                          crossAxisAlignment:
                          CrossAxisAlignment
                              .center,
                          children: [
                            Container(
                              width: 200,
                              height: 200,
                              padding:
                              EdgeInsets
                                  .all(10),
                              decoration:
                              BoxDecoration(
                                color: Colors
                                    .white,
                                border: Border.all(
                                    width: 1,
                                    color: Colors
                                        .grey),
                              ),
                              child: Container(
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      child:
                                      DefaultTextStyle(
                                        style: TextStyle(
                                            decoration:
                                            TextDecoration.none),
                                        child:
                                        Text(
                                          "25% upto \$500",
                                          style: GoogleFonts.poppins(
                                              fontSize: 30,
                                              color: Style.blackcolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child:
                                      DefaultTextStyle(
                                        style: TextStyle(
                                            decoration:
                                            TextDecoration.none),
                                        child:
                                        Text(
                                          "off on your 1st 5 uber rides",
                                          style: GoogleFonts.poppins(
                                              fontSize: 13,
                                              color: Style.blackcolor,
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                      15,
                                    ),
                                    Stack(
                                      clipBehavior:
                                      Clip.none,
                                      children: <
                                          Widget>[
                                        Container(
                                          child:
                                          Row(
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(100.0),
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius: BorderRadius.circular(100),
                                                  child: Image.asset(
                                                    _coffeeController.getHomesList[index].scrach ?? "",
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                        Positioned(
                                          top:
                                          -20,
                                          right:
                                          -10,
                                          child:
                                          Container(
                                            child:
                                            Image.asset(
                                              "assets/staring.jpg",
                                              width: 80.0,
                                              height: 80.0,
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ConfettiWidget(
                      blastDirectionality:
                      BlastDirectionality
                          .explosive,
                      confettiController:
                      controller,
                      particleDrag: 0.05,
                      emissionFrequency: 0.001,
                      numberOfParticles: 50,
                      gravity: 0.05,
                      shouldLoop: false,
                      colors: [
                        Colors.green,
                        Colors.red,
                        Colors.yellow,
                        Colors.blue,
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: Icon(
                Icons.close,
                size: 0,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ),
    );
  }


  removescratch() {
    setState(() {
      scratchKey.currentState?.reveal();
    });
  }

  scrollListener() {
    if (isShrink != lastStatus) {
      setState(() {
        lastStatus = isShrink;
      });
    }
  }

  bool get isShrink {
    return scrollController.hasClients &&
        scrollController.offset > (200 - kToolbarHeight);
  }

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(scrollListener);
    controller = new ConfettiController(duration: new Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    scrollController.removeListener(scrollListener);
    super.dispose();
  }
}

class CurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    int curveHeight = 40;
    Offset controlPoint = Offset(size.width / 2, size.height + curveHeight);
    Offset endPoint = Offset(size.width, size.height - curveHeight);

    Path path = Path()
      ..lineTo(0, size.height - curveHeight)
      ..quadraticBezierTo(
          controlPoint.dx, controlPoint.dy, endPoint.dx, endPoint.dy)
      ..lineTo(size.width, 0)
      ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
